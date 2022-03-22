/*
2038. 如果相邻两个颜色均相同则删除当前颜色
https://leetcode-cn.com/problems/remove-colored-pieces-if-both-neighbors-are-the-same-color/
*/
class Solution {
    func winnerOfGame(_ colors: String) -> Bool {
        guard colors.count > 2 else { return false }
        var na = 0, nb = 0
        var arr = Array(colors)
        var prev: Character? = arr[0]
        for i in 1..<arr.count - 1 {
            let c = arr[i]
            let next = arr[i + 1]
            if prev == "A" && c == "A" && next == "A" {
                na += 1
            }
            if prev == "B" && c == "B" && next == "B"  {
                nb += 1
            }
            prev = c
        }
        return na > nb   
    }
}
