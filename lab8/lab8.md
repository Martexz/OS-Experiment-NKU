# 练习1: 完成读文件操作的实现

## 代码实现
在 `kern/fs/sfs/sfs_inode.c` 中的 `sfs_io_nolock` 函数实现了对文件的读写操作。由于文件系统的数据是以块（Block）为单位存储的，而用户的读写请求可能从任意偏移量开始，且长度任意，因此读写操作需要分三种情况处理：

1.  **起始非对齐部分**：如果读写起始偏移量 `offset` 不是块大小 `SFS_BLKSIZE` 的整数倍，说明起始位置在一个块的中间。我们需要先处理这个块中从 `offset` 到块末尾（或请求结束位置）的数据。
2.  **中间对齐块部分**：处理完起始非对齐部分后，剩下的数据如果足够长，会包含若干个完整的块。对于这些完整的块，我们可以直接以块为单位进行读写，效率更高。
3.  **结尾非对齐部分**：处理完中间的完整块后，如果还有剩余数据，说明结束位置在一个块的中间（或者数据量很小，都在第一个块中处理完了）。我们需要处理这个块中从块开始到结束位置的数据。

具体代码逻辑如下：

```c
    // (1) 如果offset不在块边界，先处理第一个不完整的块
    if ((blkoff = offset % SFS_BLKSIZE) != 0) {
        // 计算本次需要读写的大小：如果跨块了，就读到块尾；否则读到 endpos
        size = (nblks != 0) ? (SFS_BLKSIZE - blkoff) : (endpos - offset);
        // 加载数据块的索引
        if ((ret = sfs_bmap_load_nolock(sfs, sin, blkno, &ino)) != 0) {
            goto out;
        }
        // 读写数据到 buffer
        if ((ret = sfs_buf_op(sfs, buf, size, ino, blkoff)) != 0) {
            goto out;
        }
        // 更新已处理长度和 buffer 指针
        alen += size;
        if (nblks == 0) {
            goto out;  // 所有数据都在第一个块中，处理完毕
        }
        buf += size;
        blkno++;
        nblks--;
    }

    // (2) 处理中间的完整块
    while (nblks > 0) {
        if ((ret = sfs_bmap_load_nolock(sfs, sin, blkno, &ino)) != 0) {
            goto out;
        }
        // 直接读写整个块
        if ((ret = sfs_block_op(sfs, buf, ino, 1)) != 0) {
            goto out;
        }
        alen += SFS_BLKSIZE;
        buf += SFS_BLKSIZE;
        blkno++;
        nblks--;
    }

    // (3) 如果还有剩余数据（最后一个不完整的块）
    if ((size = endpos % SFS_BLKSIZE) != 0) {
        if ((ret = sfs_bmap_load_nolock(sfs, sin, endpos / SFS_BLKSIZE, &ino)) != 0) {
            goto out;
        }
        // 读写剩余部分
        if ((ret = sfs_buf_op(sfs, buf, size, ino, 0)) != 0) {
            goto out;
        }
        alen += size;
    }
```

## 解释
- `sfs_bmap_load_nolock`: 用于将文件偏移量对应的逻辑块号映射到磁盘上的物理块号（`ino`）。
- `sfs_buf_op`: 函数指针，指向 `sfs_rbuf` (读) 或 `sfs_wbuf` (写)，用于处理非对齐的数据读写。
- `sfs_block_op`: 函数指针，指向 `sfs_rblock` (读) 或 `sfs_wblock` (写)，用于处理整块的数据读写。

# 练习2: 完成基于文件系统的执行程序机制的实现

在 Lab5 中，`load_icode` 函数是从内存中的二进制数据加载 ELF 程序。而在 Lab8 中，需要改为从文件系统中加载程序。主要修改包括：

### 1. 新增 `load_icode_read` 辅助函数
该函数封装了文件读取操作，使得从文件系统读取 ELF 数据更加方便：

```c
static int
load_icode_read(int fd, void *buf, size_t len, off_t offset)
{
    int ret;
    // 先定位到指定偏移量
    if ((ret = sysfile_seek(fd, offset, LSEEK_SET)) != 0)
    {
        return ret;
    }
    // 读取指定长度的数据
    if ((ret = sysfile_read(fd, buf, len)) != len)
    {
        return (ret < 0) ? ret : -1;
    }
    return 0;
}
```

- `sysfile_seek`: 将文件读取位置移动到指定偏移量 `offset`
- `sysfile_read`: 从当前位置读取 `len` 字节数据到缓冲区 `buf`
- 返回值检查：确保读取的数据长度等于请求的长度

### 2. 修改 `load_icode` 函数签名
```c
// Lab5: static int load_icode(unsigned char *binary, size_t size)
// Lab8: static int load_icode(int fd, int argc, char **kargv)
```

**参数变化**：
- **Lab5**: 接收内存中的二进制数据指针 `binary` 和大小 `size`
- **Lab8**: 接收文件描述符 `fd`、参数个数 `argc` 和参数数组 `kargv`

### 3. 使用文件系统读取 ELF 数据
在 Lab8 中，所有对 ELF 文件的读取都通过 `load_icode_read` 从文件系统完成：

```c
// (3.1) 读取 ELF 文件头
struct elfhdr __elf, *elf = &__elf;
if ((ret = load_icode_read(fd, elf, sizeof(struct elfhdr), 0)) != 0)
{
    goto bad_elf_cleanup_pgdir;
}

// (3.2) 读取程序头表
off_t phoff = elf->e_phoff + sizeof(struct proghdr) * phnum;
if ((ret = load_icode_read(fd, ph, sizeof(struct proghdr), phoff)) != 0)
{
    goto bad_cleanup_mmap;
}

// (3.5.1) 读取程序段内容到内存
if ((ret = load_icode_read(fd, page2kva(page) + off, size, offset)) != 0)
{
    goto bad_cleanup_mmap;
}
```

### 4. 参数传递机制
Lab8 需要将命令行参数传递给用户程序，参数布局如下：

```
用户栈布局（从高地址到低地址）：
+-------------------+ <- USTACKTOP
| argv[argc-1] 内容 |
| ...               |
| argv[1] 内容      |
| argv[0] 内容      |
+-------------------+ <- stacktop
| NULL              |
| argv[argc-1] 指针 |
| ...               |
| argv[1] 指针      |
| argv[0] 指针      |
+-------------------+ <- uargv
| argc              |
+-------------------+ <- 最终的栈顶 (sp)
```

实现代码：
```c
// 计算所有参数字符串的总长度
uint32_t argv_size = 0, i;
for (i = 0; i < argc; i++)
{
    argv_size += strnlen(kargv[i], EXEC_MAX_ARG_LEN + 1) + 1;
}

// 计算参数字符串存放位置（栈顶下方）
uintptr_t stacktop = USTACKTOP - (argv_size / sizeof(long) + 1) * sizeof(long);
// 计算argv数组存放位置
char **uargv = (char **)(stacktop - argc * sizeof(char *));

// 复制参数字符串并设置argv指针
argv_size = 0;
for (i = 0; i < argc; i++)
{
    uargv[i] = (char *)(stacktop + argv_size);
    strcpy((char *)uargv[i], kargv[i]);
    argv_size += strnlen(kargv[i], EXEC_MAX_ARG_LEN + 1) + 1;
}

// 在argv数组上方存放argc
stacktop = (uintptr_t)uargv - sizeof(int);
*(int *)stacktop = argc;

// 设置栈指针指向argc的位置
tf->gpr.sp = stacktop;
```
