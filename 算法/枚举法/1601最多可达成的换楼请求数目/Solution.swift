/*
1601. 最多可达成的换楼请求数目
https://leetcode-cn.com/problems/maximum-number-of-achievable-transfer-requests/
*/
class Solution {
    var rs: [[Int]]!
    
    func maximumRequests(_ n: Int, _ requests: [[Int]]) -> Int {
        rs = requests
        let m = requests.count
        var ans = 0
        for i in 0..<(1<<m) {
            let cnt = count(i)
            if cnt <= ans { continue }
            if check(i) { ans = cnt }
        }
        return ans
    }
    
    func check(_ s: Int) -> Bool {
        var cnt = [Int](repeating: 0, count: 20)
        var sum = 0
        for i in 0..<16 {
            if ((s >> i) & 1) == 1 {
                let a = rs[i][0], b = rs[i][1]
                cnt[a] += 1
                if cnt[a] == 1 { sum += 1 }
                cnt[b] -= 1
                if cnt[b] == 0 { sum -= 1 }
            }
        }
        return sum == 0
    }
    
    func count(_ s: Int) -> Int {
        var ans = 0, s = s
        while s > 0 {
            s &= (s - 1)
            ans += 1
        }
        return ans
    }
}
