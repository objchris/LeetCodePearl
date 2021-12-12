/*
 5952. 环和杆
 https://leetcode-cn.com/problems/rings-and-rods/
 
 模拟、位运算计数
 */
class Solution {
    func countPoints(_ rings: String) -> Int {
        var arr = [Int](repeating: 0, count: 10)
        var rArr = Array(rings)
        for i in stride(from: 0, to: rArr.count, by: 2) {
            let color = rArr[i]
            let num = Int(rArr[i + 1].asciiValue! - Character("0").asciiValue!)
            if color == "R" {
                arr[num] |= 1
            } else if color == "G" {
                arr[num] |= 2
            } else if color == "B" {
                arr[num] |= 4
            }
        }
        var ans = 0
        for i in arr.indices {
            if arr[i] == 7 {
                ans += 1
            }
        }
        return ans
    }
}
