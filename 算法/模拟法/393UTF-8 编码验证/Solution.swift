/*
393. UTF-8 编码验证

UTF-8 中的一个字符可能的长度为 1 到 4 字节，遵循以下的规则：

对于 1 字节 的字符，字节的第一位设为 0 ，后面 7 位为这个符号的 unicode 码。
对于 n 字节 的字符 (n > 1)，第一个字节的前 n 位都设为1，第 n+1 位设为 0 ，后面字节的前两位一律设为 10 。剩下的没有提及的二进制位，全部为这个符号的 unicode 码。

https://leetcode-cn.com/problems/utf-8-validation/
*/
class Solution {
    func validUtf8(_ data: [Int]) -> Bool {
        let n = data.count
        var i = 0
        while i < n {
            let head = data[i]
            // get byte count
            var byteCnt = -1
            for p in (3...7).reversed() {
                if ((head >> p) & 1) != 0 {
                    if p == 3 { return false }
                    byteCnt += 1
                } else {
                    break
                }
            }
            if byteCnt == 0 {
                return false
            } else if byteCnt > 0 {
                if i + byteCnt >= n { return false }
                while byteCnt > 0 {
                    i += 1
                    let byte = data[i]
                    if ((byte >> 7) & 1) != 1 || ((byte >> 6) & 1) != 0 {
                        return false
                    }
                    byteCnt -= 1
                }
            } 
            i += 1
        }
        return true
    }
}
