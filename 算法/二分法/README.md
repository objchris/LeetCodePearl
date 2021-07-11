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
| [33.搜索旋转排序数组](https://leetcode-cn.com/problems/search-in-rotated-sorted-array/) | [Swift代码](33\346\220\234\347\264\242\346\227\213\350\275\254\346\216\222\345\272\217\346\225\260\347\273\204/Solution.swift) |
| [34.在排序数组中查找元素的第一个和最后一个位置](https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/) | [Swift代码](34\346\216\222\345\272\217\346\225\260\347\273\204\346\237\245\346\211\276\347\233\256\346\240\207\346\211\200\345\234\250\345\214\272\351\227\264/Solution.swift) |
| [274.H指数](https://leetcode-cn.com/problems/h-index/) | [Swift代码](274H指数/Solution.swift) |
