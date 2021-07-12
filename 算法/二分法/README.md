# 二分法

往常我们使用「二分」进行查值，需要确保序列本身满足「二段性」：当选定一个端点（基准值）后，结合「一段满足 & 另一段不满足」的特性来实现“折半”的查找效果。

二分法仅适用于有序的序列，对于无序的，是无法正确解决问题的。使用二分法可将算法执行时间从 O(n) 降低到 O(log2n) 。直接降低了一个量级。

二分法的思路是通过序列的两个端点，计算出中心，再围绕中心，判断所查找的值位于中心的左侧还是右侧，以此类推得到最终的位置。

``` swift
var left = 0
var right = arr.count - 1
while left <= right {
    let mid = (left + right) / 2
    if arr[mid] == target {
        return mid
    }
    if arr[mid] > target {
        right = mid - 1
    } else {
        left = mid + 1
    }
}
return notFound
```
上述代码在寻找单一元素下标时是通用。

一般来说，二分的时间复杂度是 O(logn)

| 题目 | 解题代码 |
| ----- | ---------- |
| [33.搜索旋转排序数组](https://leetcode-cn.com/problems/search-in-rotated-sorted-array/) | [Swift代码](33搜索旋转排序数组/Solution.swift) |
| [34.在排序数组中查找元素的第一个和最后一个位置](https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/) | [Swift代码](34排序数组查找目标所在区间/Solution.swift) |
| [35.搜索插入位置](https://leetcode-cn.com/problems/search-insert-position/) | [Swift代码](35搜索插入位置/Solution.swift) |
| [74. 搜索二维矩阵](https://leetcode-cn.com/problems/search-a-2d-matrix/) | [Swift代码](74搜索二维矩阵/Solution.swift) |
| [274.H指数](https://leetcode-cn.com/problems/h-index/) | [Swift代码](274H指数/Solution.swift) |
| [275.H指数2]( https://leetcode-cn.com/problems/h-index-ii/) | [Swift代码](275H指数2/Solution.swift) |
| [852.二分极值](https://leetcode-cn.com/problems/peak-index-in-a-mountain-array/) | [Swift代码](852二分极值/Solution.swift) |
| [981.基于时间的键值存储](https://leetcode-cn.com/problems/time-based-key-value-store/) | [Swift代码](981基于时间的键值存储/Solution.swift) |
