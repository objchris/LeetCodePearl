/*
553. 最优除法
https://leetcode-cn.com/problems/optimal-division/
*/
class Solution {
    func optimalDivision(_ nums: [Int]) -> String {
        let n = nums.count
        var ans = ""
        for i in 0..<n {
            ans += "\(nums[i])"
            if i + 1 < n { ans += "/" }
            if n > 2 && i == 0 { ans += "(" }
        }
        if n > 2 { ans += ")" }
        return ans
    }
}
