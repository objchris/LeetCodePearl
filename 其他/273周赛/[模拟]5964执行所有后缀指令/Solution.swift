/*
 5964. 执行所有后缀指令
 https://leetcode-cn.com/problems/execution-of-all-suffix-instructions-staying-in-a-grid/
 */
class Solution {
    func executeInstructions(_ n: Int, _ startPos: [Int], _ s: String) -> [Int] {
        var ans = [Int]()
        var sArr = Array(s), m = sArr.count
        for i in 0..<m {
            var cnt = 0
            var pos = startPos
            for j in i..<m {
                if sArr[j] == "U" {
                    if pos[0] == 0 { break }
                    pos[0] -= 1
                } else if sArr[j] == "R" {
                    if pos[1] == n - 1 { break }
                    pos[1] += 1
                } else if sArr[j] == "L" {
                    if pos[1] == 0 { break }
                    pos[1] -= 1
                } else {
                    if pos[0] == n - 1 { break }
                    pos[0] += 1
                }
                cnt += 1
            }
            ans.append(cnt)
        }
        return ans
    }
}
