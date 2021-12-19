/*
 5957. 向字符串添加空格
 https://leetcode-cn.com/problems/adding-spaces-to-a-string/
 */
class Solution {
    func addSpaces(_ s: String, _ spaces: [Int]) -> String {
        let arr = Array(s)
        var ans = ""
        var l = 0
        for s in spaces {
            ans += String(arr[l..<s]) + " "
            l = s
        }
        if l < arr.count {
            ans += String(arr[l..<arr.count])
        }
        return ans
    }
}
