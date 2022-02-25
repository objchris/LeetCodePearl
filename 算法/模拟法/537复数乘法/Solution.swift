/*
537. 复数乘法
https://leetcode-cn.com/problems/complex-number-multiplication/
*/
class Solution {
    func complexNumberMultiply(_ num1: String, _ num2: String) -> String {
        let n1 = num1.split(separator: "+").map { String($0) }
        let n2 = num2.split(separator: "+").map { String($0) }
        let a = Int(n1[0])!
        var b1 = n1[1]
        b1.remove(at: b1.index(before: b1.endIndex))
        let b = Int(b1)!
        let c = Int(n2[0])!
        var d1 = n2[1]
        d1.remove(at: d1.index(before: d1.endIndex))
        let d = Int(d1)!
        let r1 = a * c + b * d * -1
        let r2 = a * d + c * b
        return "\(r1)+\(r2)i"
    }
}
