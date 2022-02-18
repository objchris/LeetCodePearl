/*
1791. 找出星型图的中心节点
https://leetcode-cn.com/problems/find-center-of-star-graph/
*/
class Solution {
    func findCenter(_ edges: [[Int]]) -> Int {
        var a = edges[0][0], b = edges[0][1]
        if edges[1][0] == a || edges[1][0] == b { return edges[1][0] }
        else { return edges[1][1] }
    }
}
