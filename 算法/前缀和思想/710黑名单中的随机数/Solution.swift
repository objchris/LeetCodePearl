/*
710. 黑名单中的随机数
https://leetcode.cn/problems/random-pick-with-blacklist/

前缀和+二分，官方题解的黑名单映射解法也很妙，值得学习
*/
class Solution {
    var list = [(Int, Int)]()
    var sum = [Int](repeating: 0, count: 100010)
    var cnt = 0

    init(_ n: Int, _ blacklist: [Int]) {
        let bs = blacklist.sorted()
        let m = bs.count
        if m == 0 {
            list.append((0, n - 1))
        } else {
            if bs[0] != 0 {
                list.append((0, bs[0] - 1))
            }
            for i in 1..<m {
                if bs[i - 1] == bs[i] - 1 { continue }
                list.append((bs[i - 1] + 1, bs[i] - 1))
            }
            if bs[m - 1] != n - 1 {
                list.append((bs[m - 1] + 1, n - 1))
            }
        }
        cnt = list.count
        for i in 1...cnt {
            let (l, r) = list[i - 1]
            sum[i] = sum[i - 1] + r - l + 1
        }
    }
    
    func pick() -> Int { 
        let val = Int.random(in: 1...sum[cnt])
        var l = 1, r = cnt
        while l < r {
            let m = (l + r) >> 1
            if sum[m] >= val {
                r = m
            } else {
                l = m + 1
            }
        }
        let (a, b) = list[r - 1]
        return b - (sum[r] - val)
    }
}
