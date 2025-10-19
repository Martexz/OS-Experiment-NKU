# 成员
2310700 杨雨杭
2310708 王增哲
2311807 问丕丕

# 练习1
# first-fit算法
实验给出的代码中，实现了朴素的first-fit内存分配算法。其中，由**default_ini**，**default_init_memmap**，**default_alloc_pages**，**default_free_pages**等重要的函数组成实现。

函数的内存分配过程为：`default_init` 初始化空闲链表和 `nr_free`；`default_init_memmap(base,n)` 将从`base` 开始的 n 页设置为一个空闲块（`base->property=n`、置 `PageProperty`）并按物理地址有序插入 `free_list`，同时 `nr_free += n`。`default_alloc_pages(n)` 从 `free_list` 头部顺序查找第一个 `property >= n` 的块，摘除该块并返回前 n 页；若块更大则在 `page + n`处创建残余空闲块（分裂）并插回链表，`nr_free -= n`。`default_free_pages(base,n)` 将释放区标为空闲块、按地址插入链表、`nr_free += n`，然后尝试与前后空闲块合并以减少碎片。
## default_ini
```c
default_init(void) {

    list_init(&free_list);

    nr_free = 0;

}
```
`default_init()` 函数初始化物理内存分配器的全局状态，把空闲页链表设置为空表，并将空闲页计数清零。其中，空闲页计数可记录目前系统还有多少空闲页(可供分配的内存)，判断是否能进行内存分配。空闲页链表的功能即为：当系统需要分配内存时，分配器无需遍历整个内存空间，而是直接从空闲页链表中快速获取可用页面，大幅提升了分配效率。
## default_init_memmap

```c
default_init_memmap(struct Page *base, size_t n) {

    assert(n > 0);

    struct Page *p = base;

    for (; p != base + n; p ++) {

        assert(PageReserved(p));

        p->flags = p->property = 0;

        set_page_ref(p, 0);

    }

    base->property = n;

    SetPageProperty(base);

    nr_free += n;

    if (list_empty(&free_list)) {

        list_add(&free_list, &(base->page_link));

    } else {

        list_entry_t* le = &free_list;

        while ((le = list_next(le)) != &free_list) {

            struct Page* page = le2page(le, page_link);

            if (base < page) {

                list_add_before(le, &(base->page_link));

                break;

            } else if (list_next(le)  &free_list) {

                list_add(le, &(base->page_link));

            }

        }

    }

}
```
`default_init_memmap()`函数首先引入参数base为一段连续物理页的起始页，n表示这段连续物理页的页数。首先确保初始化的页数不为零，接下来初始化这段连续的物理页，占用状态、空闲页长度、引用计数均初始化为零。将起始页 `base` 的 `property` 字段设为 `n`，表示该空闲块包含 `n` 个连续页，并通过 `SetPageProperty(base)` 标记这是一个空闲块的起始页。同时，将全局空闲页计数器 `nr_free` 增加 `n`。
最后，将这段空闲块按地址顺序插入到空闲页链表 `free_list` 中：  
如果链表为空，则直接插入；  
如果链表不为空，则遍历链表，找到第一个地址比 `base` 大的节点，在其前面插入，以保证空闲块按物理地址升序排列。
## default_alloc_pages
```c
default_alloc_pages(size_t n) {

    assert(n > 0);

    if (n > nr_free) {

        return NULL;

    }

    struct Page *page = NULL;

    list_entry_t *le = &free_list;

    while ((le = list_next(le)) != &free_list) {

        struct Page *p = le2page(le, page_link);

        if (p->property >= n) {

            page = p;

            break;

        }

    }

    if (page != NULL) {

        list_entry_t* prev = list_prev(&(page->page_link));

        list_del(&(page->page_link));

        if (page->property > n) {

            struct Page *p = page + n;

            p->property = page->property - n;

            SetPageProperty(p);

            list_add(prev, &(p->page_link));

        }

        nr_free -= n;

        ClearPageProperty(page);

    }

    return page;

}
```
`default_alloc_pages()`函数首先判断空闲页数量是否足够，接下来遍历空闲块循环链表，直到找到第一个足够大的空闲块（p->property >= n）就停止遍历，这就是first-fit算法
接下来分配并处理剩余块，一处找到的空闲块，表示该块已经被分配，若空闲块的大小大于需求，则将空闲块进行分裂，将剩余部分(page+n)作为新空闲块，`property`和空闲页计数
清除已分配块的 Property 标志，返回n页的首地址
## default_free_pages
```c
default_free_pages(struct Page *base, size_t n) {

    assert(n > 0);

    struct Page *p = base;

    for (; p != base + n; p ++) {

        assert(!PageReserved(p) && !PageProperty(p));

        p->flags = 0;

        set_page_ref(p, 0);

    }

    base->property = n;

    SetPageProperty(base);

    nr_free += n;

  

    if (list_empty(&free_list)) {

        list_add(&free_list, &(base->page_link));

    } else {

        list_entry_t* le = &free_list;

        while ((le = list_next(le)) != &free_list) {

            struct Page* page = le2page(le, page_link);

            if (base < page) {

                list_add_before(le, &(base->page_link));

                break;

            } else if (list_next(le)  &free_list) {

                list_add(le, &(base->page_link));

            }

        }

    }

  

    list_entry_t* le = list_prev(&(base->page_link));

    if (le != &free_list) {

        p = le2page(le, page_link);

        if (p + p->property  base) {

            p->property += base->property;

            ClearPageProperty(base);

            list_del(&(base->page_link));

            base = p;

        }

    }

  

    le = list_next(&(base->page_link));

    if (le != &free_list) {

        p = le2page(le, page_link);

        if (base + base->property  p) {

            base->property += p->property;

            ClearPageProperty(p);

            list_del(&(p->page_link));

        }

    }

}
```
`default_free_pages()`函数的作用为释放一段连续的物理页（内存块），并将它们重新加入空闲链表中。
首先在操作前进行参数的检查：确保释放的页数n>0，检查这些页不是保留页并且也不是空闲块，重置页的状态标志和引用计数。
设置空闲块信息，准备将这个空闲块插入到空闲页链表之中。接下来进行插入链表的核心操作：如果空闲链表为空，直接插入；否则，遍历整个 `free_list`，找到第一个地址比 `base` 大的空闲块，将当前空闲块插入到它前面，若遍历到末尾仍未插入，说明当前块地址最大，插入到链表尾部。
插入完空闲块后，则应当按照相应的规则进行空闲块合并操作。首先尝试与前一个节点合并：进行合并，前块 `p->property` 增加，清除当前块的 Property 标志，从链表中删除当前块节点，更新 `base = p`；尝试与后一个空闲块合并：更新 `property`，删除后一个节点。
## first-fit算法优化
- 当前 default_free_pages 中，插入后又重新获取 le = list_prev(&(base->page_link))，可以在插入时记住位置，以减少边界合并时的重复遍历
- 并且可以如果恰好找到了大小合适的块，可以直接分配，避免分裂操作，~~加一点聊胜于无的性能~~

# 练习 2
## 代码补充展示：

### best_fit_init_memmap

```cpp
 /*LAB2 EXERCISE 2: YOUR CODE*/ 
        // 清空当前页框的标志和属性信息，并将页框的引用计数设置为0
        p->flags =0;
        p->property =0;
        set_page_ref(p,0);

```

上述为第一段需要填充的代码，其主要作用为清空当前页框的标志和属性信息，并将页框的引用计数设置为0。

```cpp
list_entry_t* le = &free_list;
        while ((le = list_next(le)) != &free_list) {
            struct Page* page = le2page(le, page_link);
            /*LAB2 EXERCISE 2: YOUR CODE*/ 
            // 编写代码
            // 1、当base < page时，找到第一个大于base的页，将base插入到它前面，并退出循环
            // 2、当list_next(le) == &free_list时，若已经到达链表结尾，将base插入到链表尾部
            if (base < page) {
                list_add_before(le, &(base->page_link));
                break;
            } else if (list_next(le) == &free_list) {
                list_add(le, &(base->page_link));
                break;
            }

        }
```

根据所给提示，我们补充出所需代码，其主要目的是将页按照由小到大的顺序用链表链接，对空闲页进行有序初始化。

### best_fit_alloc_pages

```cpp
/*LAB2 EXERCISE 2: YOUR CODE*/ 
    // 下面的代码是first-fit的部分代码，请修改下面的代码改为best-fit
    // 遍历空闲链表，查找满足需求的空闲页框
    // 如果找到满足需求的页面，记录该页面以及当前找到的最小连续空闲页框数量

    while ((le = list_next(le)) != &free_list) {
        struct Page *p = le2page(le, page_link);
        if (p->property >= n && p->property < min_size) {
            page = p;
            min_size = p->property;
        }
    }
```

上述代码是实现best_fit的核心处，相对于first_fit，最主要的区别为从找第一个符合条件的页改为找到最合适的一个页，由此我们便可以知道best_fit需要遍历所有页，并通过min_size不断迭代记录最小的且符合要求的页，即这里的判断条件。

### best_fit_free_pages

```cpp
/*LAB2 EXERCISE 2: YOUR CODE*/ 
    // 编写代码
    // 具体来说就是设置当前页块的属性为释放的页块数、并将当前页块标记为已分配状态、最后增加nr_free的值
    base->property = n;
    SetPageProperty(base);
    nr_free += n;
```

```cpp
/*LAB2 EXERCISE 2: YOUR CODE*/ 
        // 编写代码
        // 1、判断前面的空闲页块是否与当前页块是连续的，如果是连续的，则将当前页块合并到前面的空闲页块中
        // 2、首先更新前一个空闲页块的大小，加上当前页块的大小
        // 3、清除当前页块的属性标记，表示不再是空闲页块
        // 4、从链表中删除当前页块
        // 5、将指针指向前一个空闲页块，以便继续检查合并后的连续空闲页块
        if (p + p->property == base) {
            p->property += base->property;
            ClearPageProperty(base);
            list_del(&(base->page_link));
            base = p;
        }
```


##### 实现过程阐述

Best-Fit 内存管理算法在设计上以最小剩余空间为核心思想，通过在空闲链表中查找能够满足分配请求的最小可用块，从而提高内存利用率并减少碎片。在初始化阶段，系统首先建立空闲块链表`free_list` 并记录可用页数量 `nr_free`。当执行分配操作时，算法遍历整个空闲链表，寻找大小不小于请求页数且最接近的空闲块；一旦找到合适块，若其大小恰好相等则直接从链表中移除，否则将原空闲块拆分成已分配部分和剩余部分，更新链表指针及可用页计数，从而完成较为精确的分配。在释放操作中，算法将释放的页块插入到链表中合适位置，并尝试与相邻空闲块进行合并以减少碎片。通过这种“寻找最优空闲块并尽可能合并”的方式，Best-Fit 实现了在物理内存管理中较高的空间利用效率与碎片控制。
