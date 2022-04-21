/*
824. 山羊拉丁文
https://leetcode-cn.com/problems/goat-latin/
*/
class Solution {
    let vowel = Set<Character>(["a","A","e","E","i","I","o","O","u","U"])

    func toGoatLatin(_ sentence: String) -> String {
        let arr = Array(sentence)
        var ans = ""
        var i = 0, a = 1
        while i < arr.count {
            var isVowel = vowel.contains(arr[i]) 
            var chars = [Character]()
            var t = i
            i += 1
            while i < arr.count && arr[i] != " " {
                chars.append(arr[i])
                i += 1
            }
            if isVowel {
                ans += "\(String(arr[t]))\(String(chars))ma"
            } else {
                ans += "\(String(chars))\(String(arr[t]))ma"
            }
            for _ in 0..<a {
                ans += "a"
            }
            a += 1
            if i < arr.count {
                ans += " "
                i += 1
            }
        }
        return ans
    }
}
