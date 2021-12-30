/*
846. 一手顺子
https://leetcode-cn.com/problems/hand-of-straights/

哈希表存储数字，再遍历
*/
class Solution {
    func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
        let n = hand.count
        guard groupSize <= n , n % groupSize == 0 else { return false }
        var map = [Int: Int]()
        let hand = hand.sorted()
        for h in hand { map[h, default: 0] += 1 }
        for h in hand {
            if let cnt = map[h], cnt > 0 {
                for i in 0..<groupSize {
                    guard let v = map[h + i], v > 0 else { return false }
                    map[h + i]! -= 1 
                }
            }
        }
        return true
    }
}
