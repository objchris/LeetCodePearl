/*
933. 最近的请求次数
https://leetcode-cn.com/problems/number-of-recent-calls/
*/
class RecentCounter {

    var cnt = 0
    var ping = [Int]()

    init() {

    }
    
    func ping(_ t: Int) -> Int {
        cnt += 1
        ping.append(t)
        while true {
            if let first = ping.first, first < t - 3000 {
                ping.removeFirst()
                cnt -= 1
                continue
            }
            break
        }
        return cnt
    }
}
