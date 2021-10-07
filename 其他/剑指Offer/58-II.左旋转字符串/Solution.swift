/*
 剑指 Offer 58 - II. 左旋转字符串
 https://leetcode-cn.com/problems/zuo-xuan-zhuan-zi-fu-chuan-lcof/
 */
class Solution {
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        let arr = Array(s)
        let cnt = arr.count
        let ansArr = Array(arr[n..<cnt]) + Array(arr[0..<n])
        return String(ansArr)
    }
}
