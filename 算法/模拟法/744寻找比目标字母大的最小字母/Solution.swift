/*
744. 寻找比目标字母大的最小字母
https://leetcode-cn.com/problems/find-smallest-letter-greater-than-target/
*/
class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        for c in letters {
            if c.asciiValue! > target.asciiValue! { return c }
        }
        return letters.first!
    }
}
