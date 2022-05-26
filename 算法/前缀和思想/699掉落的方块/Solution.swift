/*
699. 掉落的方块
https://leetcode.cn/problems/falling-squares/
*/
class Solution {
    func fallingSquares(_ positions: [[Int]]) -> [Int] {
        let n = positions.count
        var heights = [Int](repeating: 0,count: n)
        for i in 0..<n {
            let left1 = positions[i][0], right1 = positions[i][0] + positions[i][1] - 1
            var height = positions[i][1]
            for j in 0..<i {
                let left2 = positions[j][0], right2 = positions[j][0] + positions[j][1] - 1
                if right1 >= left2 && right2 >= left1 {
                    height = max(height, heights[j] + positions[i][1])
                }
            }
            heights[i] = height
        }
        for i in 1..<n {
            heights[i] = max(heights[i], heights[i - 1])
        }
        return heights
    }
}

