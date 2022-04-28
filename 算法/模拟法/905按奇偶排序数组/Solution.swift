/*
905. 按奇偶排序数组
https://leetcode-cn.com/problems/sort-array-by-parity/

双指针一次遍历
当 r 指针是偶数时，l 指针前进，直至遇到奇数，交换 l 和 r 的值
*/
class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var l = 0, r = 0
        var ans = nums
        while r < ans.count {
            if ans[r] % 2 == 0 {
                while l < r && ans[l] % 2 == 0 { l += 1 }
                ans.swapAt(l, r)
            }
            r += 1
        }
        return ans
    }
}
