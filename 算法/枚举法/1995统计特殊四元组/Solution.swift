/*
1995. 统计特殊四元组
https://leetcode-cn.com/problems/count-special-quadruplets/

数据量 [0, 50]，直接暴力枚举
*/
class Solution {
    func countQuadruplets(_ nums: [Int]) -> Int {
        var ans = 0
        let n = nums.count
        for i in 0..<n-3 {
            for j in i+1..<n-2 {
                for k in j+1..<n-1 {
                    for l in k+1..<n {
                        if nums[i] + nums[j] + nums[k] == nums[l] { ans += 1 }
                    }
                }
            }
        }
        return ans
    }
}
