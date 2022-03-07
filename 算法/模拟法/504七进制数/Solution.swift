/*
504. 七进制数
https://leetcode-cn.com/problems/base-7/
*/
class Solution {
    func convertToBase7(_ num: Int) -> String {
        guard num != 0 else { return "0" }
        var ans = ""
        let flag = num >= 0 ? 1 : -1
        var num = num * flag
        while num != 0 {
            let mod = num % 7
            ans =  "\(mod)" + ans
            num /= 7
        }
        return flag == 1 ? ans : "-\(ans)"
    }
}
