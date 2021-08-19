/*
 345. 反转字符串中的元音字母
 https://leetcode-cn.com/problems/reverse-vowels-of-a-string/
 */
import Foundation

class Solution {
    func reverseVowels(_ s: String) -> String {

        func isVowel(_ s: String) -> Bool {
            let lowercase = s.lowercased()
            return lowercase == "a" ||
                    lowercase == "e" ||
                    lowercase == "i" ||
                    lowercase == "o" ||
                    lowercase == "u"
        }

        var arr = Array(s).map { String($0) }
        var l = 0, r = arr.count - 1
        while l < r {
            if isVowel(arr[l]) && isVowel(arr[r]) {
                let temp = arr[l]
                arr[l] = arr[r]
                arr[r] = temp
                l += 1
                r -= 1
                continue
            }
            if !isVowel(arr[l]) {
                l += 1
            }
            if !isVowel(arr[r]) {
                r -= 1
            }
        }
        return arr.joined()

    }
}

let s = Solution()
s.reverseVowels("hello")
