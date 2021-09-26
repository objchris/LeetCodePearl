/*
 371. 两整数之和
 https://leetcode-cn.com/problems/sum-of-two-integers/
 
 1. 通过 ^ 计算两者的无进位加法结果
 2. 通过 & 和 << 计算两者的进位结果
 3. 重复相加，直至进位为 0
 */
class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        return b != 0 ? getSum(a ^ b, (a & b) << 1) : a
    }
}
