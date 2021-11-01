/*
 575. 分糖果
 https://leetcode-cn.com/problems/distribute-candies/
 */
class Solution {
    func distributeCandies(_ candyType: [Int]) -> Int {
        let count = candyType.count
        return min(Set<Int>(candyType).count, count / 2)
    }
}
