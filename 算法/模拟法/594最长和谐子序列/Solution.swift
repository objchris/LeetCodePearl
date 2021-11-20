/*
 594. 最长和谐子序列
 https://leetcode-cn.com/problems/longest-harmonious-subsequence/
 
 1. 先排序，通过滑动窗口寻找最长的序列长度
 2. 使用 Hash 表，存储各个数值的个数，遍历寻找最长的长度
 */
class SolutionOne {
    // O(nlogn)
    func findLHS(_ nums: [Int]) -> Int {
        let ns = nums.sorted()
        let cnt = ns.count
        var ans = 0
        var l = 0, r = 0
        while r < cnt {
            while r < cnt && ns[r] <= (ns[l] + 1) {
                r += 1
            }
            if ns[r - 1] > ns[l] {
                ans = max(ans, r - l)
            }
            l += 1 // +1 是为了防止 ns[l - 1] 不会越界
            while l < r && ns[l] == ns[l - 1] {
                l += 1
            }
        }
        return ans
    }
}

class SolutionTwo {
    // O(n)
    func findLHS(_ nums: [Int]) -> Int {
        var map = [Int: Int]()
        for n in nums {
            map[n, default: 0] += 1
        }
        var ans = 0
        for (k, v) in map {
            let addOne =  map[k + 1, default: 0]
            if addOne != 0 {
                ans = max(ans, v + addOne)
            }
        }
        return ans
    }
}
