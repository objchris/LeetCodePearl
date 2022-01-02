/*
 5967. 检查是否所有A都在B之前
 https://leetcode-cn.com/problems/check-if-all-as-appears-before-all-bs/
 */
class Solution {
    func checkString(_ s: String) -> Bool {
        var b = false
        for c in s {
            if c == "a" {
                if b { return false }
                continue
            }
            b = true
        }
        return true
    }
}
