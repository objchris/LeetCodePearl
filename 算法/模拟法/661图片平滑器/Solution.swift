/*
661. 图片平滑器
https://leetcode-cn.com/problems/image-smoother/
*/
class Solution {
    let dist = [[-1, -1],[-1, 0],[-1, 1],[0, -1],[0, 0],[0, 1],[1, -1],[1, 0],[1, 1]]

    func imageSmoother(_ img: [[Int]]) -> [[Int]] {
        let m = img.count, n = img[0].count
        var ans = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                var cnt = 0
                var sum = 0
                for dis in dist {
                    let x = i + dis[0], y = j + dis[1]
                    if x >= 0 && x < m && y >= 0 && y < n {
                        sum += img[x][y]
                        cnt += 1
                    }
                }
                ans[i][j] = sum / cnt
            }
        }
        return ans
    }
}
