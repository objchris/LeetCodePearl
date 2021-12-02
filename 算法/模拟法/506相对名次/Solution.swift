/*
506. 相对名次
https://leetcode-cn.com/problems/relative-ranks/

排序 + 哈希表
*/
class Solution {
    func findRelativeRanks(_ score: [Int]) -> [String] {
        var map = [Int: String]()
        let sorted = score.sorted(by: >)
        for (i, n) in sorted.enumerated() {
            switch i {
                case 0: map[n] = "Gold Medal"
                case 1: map[n] = "Silver Medal"
                case 2: map[n] = "Bronze Medal"
                default: map[n] = "\(i + 1)"
            }
        }
        return score.map { map[$0]! }
    }
}
