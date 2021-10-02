/*
 405. 数字转换为十六进制数
 https://leetcode-cn.com/problems/convert-a-number-to-hexadecimal/
 
 通用的进制转换思路，不断使用 `num % k` 和 `num / k` 来构造出 k 进制的每一位
 */
class Solution {
    var strs = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]

    func toHex(_ num: Int) -> String {
        if num == 0 { return "0" }
        var num = num
        if num < 0 {
            num = Int(pow(Double(2), Double(32))) + num
        }
        var ans = ""
        while num > 0 {
            let i = num % 16
            ans = strs[i] + ans
            num /= 16
        }
        return ans
    }
}
