/*
911. 在线选举
https://leetcode-cn.com/problems/online-election/

1. 初始化时将时间区间保存起来（便于后续查询时进行二分查找）
2. 通过 persons 数组计算出每个投票时间点胜出的人
3. q 的时候用二分法查找出时间点下标，即可得出答案
*/
class TopVotedCandidate {
    private var tops: [Int] = []
    private var times: [Int] = []
    init(_ persons: [Int], _ times: [Int]) {
        var top = -1
        var vCounts = [-1: -1]
        for p in persons {
            vCounts[p, default: 0] += 1
            if vCounts[top, default: 0] <= vCounts[p]!  {
                top = p
            }
            tops.append(top)
        }

        self.times = times
    }
    
    func q(_ t: Int) -> Int {
        var left = 0
        var right = times.count - 1
        while left < right {
            let mid = left + (right - left + 1) / 2
            if times[mid] <= t {
                left = mid
            } else {
                right = mid - 1
            }
        }
        
        return tops[left]
    }
}
