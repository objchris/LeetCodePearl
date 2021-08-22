/*
 443. 压缩字符串
 https://leetcode-cn.com/problems/string-compression/
 
 双指针求解，题目比较绕
 */
class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        var left = 0, right = 0, index = 0
        let len = chars.count

        while right < len {
            while right < len && chars[index] == chars[right] {
                right += 1
            }
            var count = right - index
            chars[left] = chars[index]
            if count != 1 {
                let countString = String(count)
                for c in countString {
                    left += 1
                    chars[left] = c
                }
            }
            index = right
            left += 1
        }
        return left
    }

}
