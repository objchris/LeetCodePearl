/*
997. 找到小镇的法官
https://leetcode-cn.com/problems/find-the-town-judge/

维护一个数组，当 A 信任 B 时，令 A - 1，B + 1 。结果当 X 为 n - 1 时，即为法官
*/
class Solution {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var judge = [Int](repeating: 0, count: n + 1) 
        trust.forEach { t in
            judge[t[0]] -= 1
            judge[t[1]] += 1
        }
        for (i,d) in judge.enumerated() {
            if d == n - 1 {
                return i
            }
        }
        return -1
    }
}
