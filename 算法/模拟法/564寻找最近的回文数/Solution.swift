/*
564. 寻找最近的回文数
https://leetcode-cn.com/problems/find-the-closest-palindrome/
*/
class Solution {
    func nearestPalindromic(_ s: String) -> String {
        let n = s.count
        let cur = Int(s)!
        var set = Set<Int>()
        set.insert(Int(pow(10, Double(n - 1)) - 1))
        set.insert(Int(pow(10, Double(n)) + 1))
        let substr = String(s[s.startIndex..<s.index(s.startIndex, offsetBy: (n + 1) / 2)])
        let t = Int(substr)!
        for i in (t - 1)...(t + 1) {
            let temp = getNum(i, n % 2 == 0)
            if (temp != cur) {
                set.insert(temp)
            }
        }
        var ans = -1
        for i in set {
            if ans == -1 { ans = i }
            else if abs(i - cur) < abs(ans - cur) { ans = i }
            else if abs(i - cur) == abs(ans - cur) && i < ans { ans = i }
        }
        return "\(ans)"
    }

    func getNum(_ k: Int, _ isEven: Bool) -> Int {
        var ret = "\(k)"
        let n = ret.count
        var idx = isEven ? n - 1: n - 2
        while idx >= 0 {
            let s = String(ret[ret.index(ret.startIndex, offsetBy: idx)])
            idx -= 1
            ret += s
        }
        return Int(ret)!
    }
}
