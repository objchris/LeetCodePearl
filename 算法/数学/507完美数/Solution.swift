/*
507. 完美数
https://leetcode-cn.com/problems/perfect-number/
*/

// 解法一：直接遍历
class Solution {
    func checkPerfectNumber(_ num: Int) -> Bool {
        let mid = num / 2
        guard mid > 1 else { return false }
        var ans = 0
        for i in 1...mid {
            if num % i == 0 { ans += i }
        }
        return ans == num
    }
}

// 对解法一进行优化
class Solution {
    func checkPerfectNumber(_ num: Int) -> Bool {
        guard num > 1 else { return false }
        // 1 肯定为符合条件的正因子，因此 sum 可初始化为 1 
        var sum = 1, i = 2
        /*
        以 36 为例， 有正因子 1，2，3，4，6，9，12，18
        当确认了 2 为符合条件的正因子时，18 肯定也是符合条件的，加入到 sum 中
        以此类推，确认了 3 符合条件，12 也可推导出来，加入到 sum 中
        4, 9 加入到 sum 中
        6 只能加入到 sum 中一次，因此需要判断 num 是否为 i 的平方值
        */
        while i <= Int(sqrt(Double(num))) {
            if num % i == 0 {
                sum += i
                if i != num / i { sum += num / i } // 判断 num 是否为 i 的平方值，若是，则上一行已经将这个正因子加入 sum 中，不用再加了
            }
            i += 1
        }
        return sum == num
    }
}

// 从数学层面，[1, 10^8]中仅有以下 5 个数符合条件，因此也可通过打表法求解
class Solution {
    func checkPerfectNumber(_ num: Int) -> Bool {
        return num == 6 || num == 28 || num == 496 || num == 8128 || num == 33550336
    }
}
