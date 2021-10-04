/*
 482. 密钥格式化
 https://leetcode-cn.com/problems/license-key-formatting/
 */
class Solution {
    func licenseKeyFormatting(_ s: String, _ k: Int) -> String {
        let ss = Array(s.uppercased().filter({$0 != "-"}))
        let n = ss.count / k, m = ss.count % k
        var ans = String(ss[..<m])

        for i in stride(from: m+k, through: ss.count, by: k) {
            if !ans.isEmpty { ans += "-" }
            ans += String(ss[i-k..<i])
        }
        
        return ans
    }
}
