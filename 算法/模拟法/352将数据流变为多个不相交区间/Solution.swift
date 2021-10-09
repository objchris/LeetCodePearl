/*
 352. 将数据流变为多个不相交区间
 https://leetcode-cn.com/problems/data-stream-as-disjoint-intervals/
 */
class SummaryRanges {

    var store: [Int]
    var maxV = 0

    init() {
        store = [Int](repeating: 0, count: 10010)
    }

    func addNum(_ val: Int) {
        store[val] = 1
        maxV = max(maxV, val)
    }

    func getIntervals() -> [[Int]] {
        var ans = [[Int]]()
        var i = 0
        while i <= maxV {
            if store[i] == 0 {
                i += 1
                continue
            }
            var t = [Int]()
            t.append(i)
            while store[i] != 0 && i <= maxV {
                i += 1
            }
            t.append(i - 1)
            ans.append(t)
        }
        return ans
    }
}

/**
 * Your SummaryRanges object will be instantiated and called as such:
 * let obj = SummaryRanges()
 * obj.addNum(val)
 * let ret_2: [[Int]] = obj.getIntervals()
 */
