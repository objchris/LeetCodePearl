/*
748. 最短补全词
https://leetcode-cn.com/problems/shortest-completing-word/

简单的字符串模拟题
*/
class Solution {
    func shortestCompletingWord(_ licensePlate: String, _ words: [String]) -> String {
        var chars = [Int](repeating: 0, count: 26)
        var ans = ""
        let baseAscii = Character("a").asciiValue!
        for c in licensePlate where c.isLetter {
            let idx = Int(Character(c.lowercased()).asciiValue! - baseAscii)
            if idx >= 0 && idx < 26 {
                chars[idx] += 1
            }
        }
        for word in words {
            var temp = chars
            for c in word {
                let idx = Int(c.asciiValue! - baseAscii)
                temp[idx] -= 1 
            }
            var match = true
            for i in temp.indices {
                if temp[i] > 0 { 
                    match = false 
                    break
                }
            }
            if match {
                if ans == "" { ans = word }
                else if word.count < ans.count {
                    ans = word
                }
            }
        }
        return ans
    }
}
