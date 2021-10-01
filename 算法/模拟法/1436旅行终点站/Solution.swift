/*
 1436. 旅行终点站
 https://leetcode-cn.com/problems/destination-city/
 */
class Solution {
    func destCity(_ paths: [[String]]) -> String {
        var cts = Set<String>()
        for p in paths {
            cts.insert(p[1])
        }
        for p in paths {
            cts.remove(p[0])
        }
        return cts.first!
    }
}
