/*
420. 强密码检验器
https://leetcode-cn.com/problems/strong-password-checker/
*/
class Solution {
    func strongPasswordChecker(_ password: String) -> Int {
        
        var hasLowercase = 0
        var hasUppercase = 0
        var hasDigit     = 0
        
        for item in password {
            if item >= "a" && item <= "z" {
                hasLowercase  = 1
            }
            if item >= "A" && item <= "Z" {
                hasUppercase  = 1
            }
            if item >= "0" && item <= "9" {
                hasDigit  = 1
            }
        }
        
        // 当前有几种字符
        let kindNum = hasLowercase + hasUppercase + hasDigit
        
        if password.count < 6 {
            return max(6 - password.count, 3 - kindNum)
        } else if password.count < 21 {
            var total = 0
            var count = 0
            var cur: Character = "@"
            
            for item in password {
                // 跟前一个相等  就继续往下比较
                if cur == item {
                    count = count + 1
                } else {
                    // 计算重复要操作数
                    total = total + count / 3
                    // 重置 count  cur
                    count = 1
                    cur = item
                }
            }
            
            // 结尾在看一下   重复数
            total = total + count / 3
            // 比较重复数   和  种类数    选最大
            return max(total, 3 - kindNum)
        } else {
            // 替换次数和删除次数
            var total: Int = 0
            var remove: Int = password.count - 20
            // k mod 3 = 1 的组数，即删除 2 个字符可以减少 1 次替换操作
            var rm2: Int = 0
            var count: Int = 0
            var cur: Character = "@"
            
            for item in password {
                if cur == item {
                    count = count + 1
                } else {
                    if remove > 0 && count >= 3 {
                        if count % 3 == 0 {
                            // 如果是 k % 3 = 0 的组，那么优先删除 1 个字符，减少 1 次替换操作
                            remove = remove - 1
                            total = total - 1
                        }else if count % 3 == 1 {
                            // 如果是 k % 3 = 1 的组，那么存下来备用
                            rm2 = rm2 + 1
                        }
                        // k % 3 = 2 的组无需显式考虑
                    }
                    total =  total + count / 3
                    count = 1
                    cur = item
                }
            }
            
            // 结尾判断
            if remove > 0 && count >= 3 {
                if count % 3 == 0 {
                    // 如果是 k % 3 = 0 的组，那么优先删除 1 个字符，减少 1 次替换操作
                    remove = remove - 1
                    total = total - 1
                } else if count % 3 == 1 {
                    // 如果是 k % 3 = 1 的组，那么存下来备用
                    rm2 = rm2 + 1
                }
            }
            
            total = total + count / 3
            // 使用 k % 3 = 1 的组的数量，由剩余的替换次数、组数和剩余的删除次数共同决定
            let user2 = min(min(total, rm2), remove / 2)
            total = total - user2
            remove = remove - user2 * 2
            // 由于每有一次替换次数就一定有 3 个连续相同的字符（k / 3 决定），因此这里可以直接计算出使用 k % 3 = 2 的组的数量
            let use3 = min(total, remove / 3)
            total = total - use3
            remove = remove - use3 * 3            
            return (password.count - 20) + max(total, 3 - kindNum)
        }
    }
}
