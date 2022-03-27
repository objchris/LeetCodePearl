/*
2028. 找出缺失的观测数据
https://leetcode-cn.com/problems/find-missing-observations/
*/
class Solution {
    func missingRolls(_ rolls: [Int], _ mean: Int, _ n: Int) -> [Int] {
        let sum = rolls.reduce(0, +)
        let m = rolls.count
        let total = (m + n) * mean
        var need = total - sum
        if need < n || need > 6 * n { return [] }

        var ans = [Int]()
        let base = need / n 
        var mod = need % n
        for i in 0..<n {
            let t = base + (mod > 0 ? 1 : 0)
            mod -= 1
            ans.append(t)
        }
        return ans
    }   
}
