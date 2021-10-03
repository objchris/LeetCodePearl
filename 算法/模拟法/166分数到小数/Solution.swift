/*
 166. 分数到小数
 https://leetcode-cn.com/problems/fraction-to-recurring-decimal/
 
 纯模拟，用数组保存小数点后的小数，用哈希表记录余数和下标
 最后组合起来
 */
class Solution {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        guard numerator != 0 else { return "0" }
        var sign = -1
        if (numerator > 0 && denominator > 0) || (numerator < 0 && denominator < 0) {
            sign = 1
        }

        var ans = ""
        ans += sign == -1 ? "-" : ""

        let numerator = abs(numerator)
        let denominator = abs(denominator)
        var beforeDot = numerator / denominator
        ans += "\(beforeDot)"

        var mod = numerator % denominator
        if mod == 0 { return ans }
        ans += "."
        
        var map = [Int: Int]() // mod: idx
        var arr = [Int]()
        var c = -1
        var i = 0
        while mod != 0 {
            let n = mod * 10 / denominator
            if map[mod] != nil {
                // 有循环
                c = map[mod]!
                break
            }
            map[mod] = i
            i += 1
            arr.append(n)
            mod = (mod * 10) % denominator
        }
        if c != -1 {
            ans += arr[0..<c].map{ String($0) }.joined()
            ans += "(\(arr[c..<arr.count].map{ String($0) }.joined()))"
        } else {
            ans += arr.map{ String($0) }.joined()
        }
        return ans
    }
}
