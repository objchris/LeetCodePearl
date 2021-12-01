/*
1446. 连续字符
https://leetcode-cn.com/problems/consecutive-characters/

简单双指针
*/
class Solution {
    func maxPower(_ s: String) -> Int {
        var l = 0, r = 0
        let arr = Array(s)
        var ans = 0
        while r < arr.count {
            while r < arr.count && arr[l] == arr[r] {
                r += 1
            }
            ans = max(ans, r - l)
            l = r
        }
        return ans
    }
}
