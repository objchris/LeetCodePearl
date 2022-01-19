/*
219. 存在重复元素 II
https://leetcode-cn.com/problems/contains-duplicate-ii/
*/
class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var map = [Int: Int]()
        for i in nums.indices {
            if let j = map[nums[i]], abs(i - j) <= k { return true }
            map[nums[i]] = i 
        }
        return false
    }
}
