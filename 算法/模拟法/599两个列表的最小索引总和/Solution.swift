/*
599. 两个列表的最小索引总和
https://leetcode-cn.com/problems/minimum-index-sum-of-two-lists/
*/
class Solution {
    func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
        var map = [String: Int]()
        for i in list1.indices {
            map[list1[i]] = i
        }
        var ans = [String]()
        var minIndex = Int.max
        for i in list2.indices {
            let list = list2[i]
            if let idx1 = map[list] {
                let sum = i + idx1
                if sum < minIndex {
                    ans = [list]
                    minIndex = sum
                } else if sum == minIndex {
                    ans.append(list)
                }
            }
        }
        return ans
    }
}
