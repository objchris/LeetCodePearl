/*
1706. 球会落何处
https://leetcode-cn.com/problems/where-will-the-ball-fall/
*/
class Solution {
    func findBall(_ grid: [[Int]]) -> [Int] {
        let m = grid.count
        let n = grid[0].count
        var ans = [Int]()
        for t in 0..<n {
            var j = t, i = 0
            var stop = false
            while i < m {
                if grid[i][j] == 1 {
                    if j >= n - 1 || grid[i][j + 1] == -1 {
                        ans.append(-1)
                        stop = true
                        break
                    }
                    j += 1
                    i += 1
                } else if grid[i][j] == -1 {
                    if j <= 0 || grid[i][j - 1] == 1 {
                        ans.append(-1)
                        stop = true
                        break
                    }
                    j -= 1
                    i += 1
                }
            }
            if !stop {
                ans.append(j)
            }
        }
        return ans
    }
}
