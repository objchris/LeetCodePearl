/*
 面试题 17.14. 最小K个数
 https://leetcode-cn.com/problems/smallest-k-lcci/
 */
class Solution {
    // 排序 O(nlogn)
    func smallestK(_ arr: [Int], _ k: Int) -> [Int] {
        guard k > 0 else { return [] }
        return Array(arr.sorted()[0...k-1])
    }
}

