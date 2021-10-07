/*
 剑指 Offer 05. 替换空格
 https://leetcode-cn.com/problems/ti-huan-kong-ge-lcof/
 */
class Solution {
    func replaceSpace(_ s: String) -> String {
        var ans = ""
        for char in s {
            ans += (String(char) == " ") ? "%20" : String(char)
        }
        return ans
    }
}
