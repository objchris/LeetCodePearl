/*
 5965. 相同元素的间隔之和
 https://leetcode-cn.com/problems/intervals-between-identical-elements/
 
 变种前缀和
 */
class Solution {
    func getDistances(_ arr: [Int]) -> [Int] {
        var map = [Int:[Int]]()
        // 存起相同值的下标
        for (i, v) in arr.enumerated() {
            map[v, default:[Int]()].append(i)
        }
        var ans = [Int](repeating: 0, count: arr.count)
        for (_, v) in map {
            // 计算 v[0] 与其他下标的距离总和
            for n in v { ans[v[0]] += n - v[0] }
            let cnt = v.count
            for i in 1..<cnt {
                /*
                    ans[v[i]] 的结果可以从 ans[v[i - 1]] 得到
                    从 i - 1 到 i ，将有 i - 1 个距离增加了 v[i] - v[i - 1]，cnt - 1 - i 个距离减少 v[i] - v[i - 1]
                */
                ans[v[i]] = ans[v[i - 1]] + (2 * i - cnt) * (v[i] - v[i - 1])
            }
        }
        return ans
    }
}
