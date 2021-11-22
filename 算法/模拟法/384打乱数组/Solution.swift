/*
 384. 打乱数组
 https://leetcode-cn.com/problems/shuffle-an-array/
 
 本题着重考虑如何 shuffle ，使用到十分经典的洗牌算法：
 对于不同的位置：
 1. Position[0]: 选取 [0, n) 中的一个下标 rand ，互换 nums[0] 和 nums[rand]
 2. Position[1]: 选取 [1, n) 中的一个下标 rand ，互换 nums[1] 和 nums[rand]
 3. ...
 4. Position[n - 1]: 选取 [n - 1, n) 中的一个下标 rand ，互换 nums[n - 1] 和 nums[rand]
 
 这样做，对于已经确定好位置的数，不会在发生变化，可使得 shuffle 得到的结果的概率是相同的
 */
class Solution {

    var nums: [Int]

    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func reset() -> [Int] {
        return nums
    }
    
    func shuffle() -> [Int] {
        var ans = nums
        let count = nums.count
        for i in 0..<count {
            let rand = Int.random(in: i..<count)
            ans.swapAt(i, rand)
        }
        return ans
    }
    
}
