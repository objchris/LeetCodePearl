/*
2047. 句子中的有效单词数
https://leetcode-cn.com/problems/number-of-valid-words-in-a-sentence/
*/
class Solution {
    let zero = Character("0").asciiValue!
    let nine = Character("9").asciiValue!
    let a = Character("a").asciiValue!
    let z = Character("z").asciiValue!

    func countValidWords(_ sentence: String) -> Int {
        let words = sentence.split(separator: " ").map { String($0) }
        var ans = 0
        for word in words {
            if check(word) {
                ans += 1
            }
        }
        return ans
    }

    func check(_ word: String) -> Bool {
        var barCount = 0
        let chars = Array(word)
        for i in chars.indices {
            let c = chars[i]
            if isNum(c) { return false }
            if isSymbol(c) && i != chars.count - 1 { return false }
            if isBar(c) {
                barCount += 1
                if i == 0 || i == chars.count - 1 || !isChar(chars[i - 1]) || !isChar(chars[i + 1]) { 
                    return false 
                }
            }
        }
        return barCount <= 1
    }

    func isChar(_ c: Character) -> Bool {
        return c.asciiValue! >= a && c.asciiValue! <= z
    }

    func isNum(_ c: Character) -> Bool {
        return c.asciiValue! >= zero && c.asciiValue! <= nine
    }

    func isSymbol(_ c: Character) -> Bool {
        return c == "!" || c == "." || c == ","
    }

    func isBar(_ c: Character) -> Bool {
        return c == "-"
    }
}
