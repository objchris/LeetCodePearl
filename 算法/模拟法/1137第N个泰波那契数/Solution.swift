/*
 1137. 第 N 个泰波那契数
 https://leetcode-cn.com/problems/n-th-tribonacci-number/
 */
class Solution {

    var table = [0: 0, 1: 1, 2: 1]
    // 使用哈希表保存值，时间复杂度和空间复杂度都是O(n)
    func tribonacci_O_n(_ n: Int) -> Int {
        if n > 2 {
            for i in 3...n {
                table[i] = table[i - 3]! + table[i - 2]! + table[i - 1]!
            }
        }
        return table[n]!
    }

    // 每一次计算的中间值仅使用3次，没必须使用哈希表一直保存着
    // 因此可以用常数级别的变量，滚动保存计算的中间值
    func tribonacci(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        if n < 3 {
            return 1
        }
        var a = 0, b = 1, c = 1, d = 0
        for i in 3...n {
            d = a + b + c
            a = b
            b = c
            c = d
        }
        return d
    }
    
}


