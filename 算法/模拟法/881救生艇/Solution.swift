/*
 881. 救生艇
 https://leetcode-cn.com/problems/boats-to-save-people/
 
 先排序，双指针求解, O(nlogn)
 */
class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        let sorted = people.sorted()
        var left = 0, right = sorted.count - 1
        var ans = 0
        while left <= right {
            if left != right && sorted[left] + sorted[right] > limit {
                ans += 1
                right -= 1
                continue
            }
            ans += 1
            left += 1
            right -= 1
        }
        return ans
    }
}
