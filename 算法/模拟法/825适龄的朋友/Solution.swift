/*
825. 适龄的朋友
https://leetcode-cn.com/problems/friends-of-appropriate-ages/

双指针，求范围
*/
class Solution {
    func numFriendRequests(_ ages: [Int]) -> Int {
        let ages = ages.sorted()
        let n = ages.count
        var ans = 0
        var i = 0, j = 0
        for k in 0..<n {
            while i < k && !check(ages[i], ages[k]) { i += 1 }
            if j < k { j = k }
            while j < n && check(ages[j], ages[k]) { j += 1 }
            if j > i { ans += j - i - 1 }
        }
        return ans
    }

    private func check(_ x:  Int, _ y: Int) -> Bool {
        if y <= Int(Double(x) * 0.5 + 7) { return false }
        if y > x { return false }
        if y > 100 && x < 100 { return false }
        return true
    }

}
