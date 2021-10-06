/*
 414. 第三大的数
 https://leetcode-cn.com/problems/third-maximum-number/
 */
class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        var i = Int.min, j = Int.min, k = Int.min
        for n in nums {
            if n > i {
                k = j
                j = i
                i = n
            } else if n > j && n < i {
                k = j
                j = n
            } else if n > k && n < j {
                k = n
            }
        }
        return k == Int.min ? i : k
    }
}
