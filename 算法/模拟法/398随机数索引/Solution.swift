/*
398. 随机数索引
https://leetcode-cn.com/problems/random-pick-index/
*/
class Solution {

    var nums: [Int]

    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func pick(_ target: Int) -> Int {
        var ans = 0, cnt = 0
        for i in nums.indices {
            if nums[i] == target {
                cnt += 1
                if Int.random(in: 0..<cnt) == 0 { ans = i }
            }
        }
        return ans
    }

}
