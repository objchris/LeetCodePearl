// 65.Valid Number
// https://leetcode-cn.com/problems/valid-number/
// 不难，就是需要注意许多细节，以下字符串结果为false
// +-.
// .-4
// .+8
// 模拟法，头脑不发热都能做出来
// https://leetcode-cn.com/problems/valid-number/solution/gong-shui-san-xie-zi-fu-chuan-mo-ni-by-a-7cgc/
class Solution {
    
    let numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    func isInteger(_ s: String) -> Bool {
        var index = s.startIndex
        if s.hasPrefix("+") || s.hasPrefix("-") {
            index = s.index(after: s.startIndex)
        }
        let numberString = String(s[index..<s.endIndex])
        if numberString.count == 0 {
            return false
        }
        if numberString.contains(".") {
            return false
        }
        for char in numberString {
            if (!numbers.contains(String(char))) {
                return false
            }
        }
        return true
    }
    
    func isDecimal(_ s:String) -> Bool {
        var index = s.startIndex
        if s.hasPrefix("+") || s.hasPrefix("-") {
            index = s.index(after: s.startIndex)
        }
        let numberString = String(s[index..<s.endIndex])
        if numberString.count == 0 {
            return false
        }
        let arr = numberString.split(separator: ".", omittingEmptySubsequences: false)
        if arr.count != 2 {
            return false
        }
        if arr[0] == "" {
            return !String(arr[1]).hasPrefix("+") &&
                   !String(arr[1]).hasPrefix("-") &&
                   isInteger(String(arr[1]))
        } else if arr[1] == "" {
            return isInteger(String(arr[0]))
        }
        return isInteger(String(arr[0])) && isInteger(String(arr[1]))
    }
    
    func isNumber(_ s: String) -> Bool {
        var result = false
        let arr = s.uppercased().split(separator: "E", omittingEmptySubsequences: false)
        if arr.count > 2 {
            return false
        }
        result = isInteger(String(arr[0])) || isDecimal(String(arr[0]))
        if arr.count == 2 {
            result = result && isInteger(String(arr[1]))
        }
        return result
    }
}

// 或许用正则表达式求解
// "[+-]?(?:\\d+\\.?\\d*|\\.\\d+)(?:[Ee][+-]?\\d+)?"

// 状态机驱动法
// https://leetcode-cn.com/problems/valid-number/solution/biao-qu-dong-fa-by-user8973/

