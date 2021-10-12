/*
 29. 两数相除
 https://leetcode-cn.com/problems/divide-two-integers/
 */
class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if dividend == 0 {
            return 0
        }
        
        if divisor == 1 {
            return dividend
        }
        
        if divisor == -1 {
            if dividend > Int(Int32.min) {
                return -dividend
            }
            return Int(Int32.max)
        }
        // 结果是正数还是负数标志
        let sign = dividend > 0 && divisor > 0 || dividend < 0 && divisor < 0
        let a = dividend > 0 ? dividend : -dividend
        let b = divisor > 0 ? divisor : -divisor
        let res = div(a, b)
        
        return sign ? res : -res
    }

    func div(_ a: Int, _ b: Int) -> Int {
        if a < b {
            return 0
        }
        
        var count = 1
        var result = b
        while result + result <= a {
            count += count
            result += result
        }
        
        return count + div(a-result, b)
    }
}
