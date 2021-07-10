# 二分法

往常我们使用「二分」进行查值，需要确保序列本身满足「二段性」：当选定一个端点（基准值）后，结合「一段满足 & 另一段不满足」的特性来实现“折半”的查找效果。

二分法仅适用于有序的序列，对于无序的，是无法正确解决问题的。使用二分法可将算法执行时间从 O(n) 降低到 O(log2n) 。直接降低了一个量级。

二分法的思路是通过序列的两个端点，计算出中心，再围绕中心，判断所查找的值位于中心的左侧还是右侧，以此类推得到最终的位置。

``` swift
var left = 0
var right = arr.count - 1
while left <= right {
    let mid = (left + right) / 2
    if arr[mid] == somethingFinding {
        return mid
    }
    if arr[mid] > somethingFinding {
        right = mid - 1
    } else {
        left = mid + 1
    }
}
return notFound
```
