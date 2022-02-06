/*
1748. 唯一元素的和
https://leetcode-cn.com/problems/sum-of-unique-elements/
*/
class Solution {
    func sumOfUnique(_ nums: [Int]) -> Int {
        var arr = [Int](repeating: 0, count: 110)
        for n in nums {
            arr[n] += 1
        }
        var ans = 0
        for i in 1...100 where arr[i] == 1 {
            ans += i
        }   
        return ans
    }
}
