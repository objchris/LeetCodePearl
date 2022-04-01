/*
954. 二倍数对数组
https://leetcode-cn.com/problems/array-of-doubled-pairs/
*/
class Solution {
    func canReorderDoubled(_ arr: [Int]) -> Bool {
        var map = [Int: Int]()
        for n in arr {
            map[n, default: 0] += 1
        }
        if let zero = map[0], zero % 2 != 0 {
            return false
        }
        for n in arr.sorted() where map[n] != nil && map[2 * n] != nil {
            map[2 * n]! -= 1
            if map[2 * n]! == 0 { map.removeValue(forKey: 2 * n)}
            map[n]! -= 1
            if map[n]! == 0 { map.removeValue(forKey: n)}
        }
        return map.isEmpty
    }
}
