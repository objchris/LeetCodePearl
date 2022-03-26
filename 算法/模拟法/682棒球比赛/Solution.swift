/*
682. 棒球比赛
https://leetcode-cn.com/problems/baseball-game/
*/
class Solution {
    func calPoints(_ ops: [String]) -> Int {
        var score = [Int]()
        for i in ops.indices {
            let op = ops[i]
            if op == "+" {
                let cnt = score.count
                score.append(score[cnt - 1] + score[cnt - 2]) 
            }
            else if op == "D" { score.append(score.last! * 2) }
            else if op == "C" { score.popLast() }
            else { score.append(Int(op)!) }
        }
        return score.reduce(0, +)
    }
}
