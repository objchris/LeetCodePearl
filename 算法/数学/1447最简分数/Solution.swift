/*
1447. 最简分数
https://leetcode-cn.com/problems/simplified-fractions/

辗转相除法求最大公约数
*/
class Solution {
    func simplifiedFractions(_ n: Int) -> [String] {
        guard n > 1 else { return [] }
        var set = Set<String>()
        for i in 2...n {
            for j in 1..<i {
                let t = gcd(i, j)
                let s = "\(j/t)/\(i/t)"
                set.insert(s)
            }
        }
        return Array(set)
    }

    func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a % b)
    }
}
