/*
89. 格雷编码
https://leetcode-cn.com/problems/gray-code/

题解：
作者：objchris
链接：https://leetcode-cn.com/problems/gray-code/solution/chriswift-yi-ti-shuang-jie-ben-ban-fa-df-fgio/
来源：力扣（LeetCode）
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
*/
// DFS + 回溯暴力求解
class Solution1 {
    var vis = Set<Int>()
    var ans = [0]
    var cnt = 0

    func grayCode(_ n: Int) -> [Int] {
        cnt = Int(pow(2, Double(n)))
        vis.insert(0)
        dfs(0, 1, n)
        return ans
    }

    func dfs(_ cur: Int, _ depth: Int, _ n: Int) -> Bool {
        if depth == cnt && (cur & (cur - 1) == 0) {
            return true
        }
        for i in next(cur, n) {
            if vis.contains(i) { continue }
            vis.insert(i)
            ans.append(i)
            if dfs(i, depth + 1, n) { return true }
            ans.popLast()
            vis.remove(i)
        }
        return false
    }

    func next(_ cur: Int, _ n: Int) -> [Int] {
        var ret = [Int]()
        for i in 0..<n {
            ret.append(cur ^ (1 << i))
        }
        return ret
    }
}

// 根据定义解答
class Solution2 {
    func grayCode(_ n: Int) -> [Int] {
        var ans = [Int]()
        for i in 0..<(1 << n) { 
            ans.append(i ^ (i >> 1))
        }
        return ans
    }
}
