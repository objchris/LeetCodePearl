/*
821. 字符的最短距离
https://leetcode-cn.com/problems/shortest-distance-to-a-character/
*/
class Solution {
    func shortestToChar(_ s: String, _ c: Character) -> [Int] {
        let a = Array(s)
        var indices = [Int]()
        for i in a.indices where a[i] == c {
            indices.append(i)
        }
        var ans = [Int](repeating: 0, count: a.count)
        for i in 0...indices.first! {
            ans[i] = indices.first! - i
        }
        for i in (indices.last!..<a.count).reversed() {
            ans[i] = i - indices.last!
        }
        var r = 1
        while r < indices.count {
            var x = indices[r - 1], y = indices[r]
            var dis = 0
            while x <= y {
                ans[x] = dis
                ans[y] = dis
                x += 1
                y -= 1
                dis += 1
            }
            r += 1
        }
        return ans
    }
}
