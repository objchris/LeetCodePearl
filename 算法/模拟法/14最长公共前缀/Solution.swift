/*
14. 最长公共前缀
https://leetcode-cn.com/problems/longest-common-prefix/

每次求两个字符串的共同前缀即可
*/
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var ans = strs[0]
        for i in 1..<strs.count {
            ans = prefixOfString(ans, strs[i])
        }
        return ans
    }

    func prefixOfString(_ l: String, _ r: String) -> String {
        let arr1 = Array(l)
        let arr2 = Array(r)
        var n = min(arr1.count, arr2.count)
        var ret = ""
        for i in 0..<n {
            if (arr1[i] != arr2[i]) {
                break
            }
            ret += String(arr1[i])
        }
        return ret
    } 
}
