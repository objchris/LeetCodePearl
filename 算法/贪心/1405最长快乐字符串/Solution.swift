/*
1405. 最长快乐字符串
https://leetcode-cn.com/problems/longest-happy-string/
*/
class Solution {
    func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
        var ans = [Character]()
        var queue = [(Character, Int)]()
        if a > 0 { queue.append((Character("a"), a)) }
        if b > 0 { queue.append((Character("b"), b)) }
        if c > 0 { queue.append((Character("c"), c)) }
        while !queue.isEmpty {
            queue.sort{ $0.1 > $1.1 }
            var cur = queue.removeFirst()
            let n = ans.count
            if n >= 2 && ans[n - 1] == cur.0 && ans[n - 2] == cur.0 {
                if queue.isEmpty { break }
                var next = queue.removeFirst()
                ans.append(next.0)
                next.1 -= 1
                if next.1 > 0 { queue.append(next) }
                queue.append(cur)
            } else {
                ans.append(cur.0)
                cur.1 -= 1
                if cur.1 > 0 { queue.append(cur) }
            }
        }
        return String(ans)
    }

}
