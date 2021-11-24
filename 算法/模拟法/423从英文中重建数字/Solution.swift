/*
423. 从英文中重建数字
https://leetcode-cn.com/problems/reconstruct-original-digits-from-english/

首先想到暴力求解，结果超时。
本题考查的是找规律，通过单词的字符组成求解各个单词的数量
*/
class Solution_TLE {
    let words = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    func originalDigits(_ s: String) -> String {
        var chars = [Int](repeating: 0, count: 26)
        let arr = Array(s)
        let count = arr.count
        var ans = ""
        for c in arr {
            let index = Int(c.asciiValue! - Character("a").asciiValue!)
            chars[index] += 1
        }
        dfs(chars, count, &ans, 0)
        return ans
    }

    private func dfs(_ chars: [Int], _ left: Int, _ ans: inout String, _ index: Int) -> Bool {
        if (left == 0) {
            return true
        }
        for i in index...9 {
            let word = words[i]
            let wordArr = Array(word)
            var modifyChars = chars
            var modifyLeft = left
            var match = true
            for ch in wordArr {
                let index = Int(ch.asciiValue! - Character("a").asciiValue!)
                if modifyChars[index] == 0 {
                    match = false
                    break
                }
                modifyLeft -= 1
                modifyChars[index] -= 1
            }
            if match {
                if dfs(modifyChars, modifyLeft, &ans, i) {
                    ans = "\(i)" + ans
                    return true
                }
            }
        }
        return false
    }

}

class Solution_AC {

    func originalDigits(_ s: String) -> String {
        let arr = Array(s)
        var map = [Character: Int]()
        for ch in arr {
            map[ch, default: 0] += 1
        }
        var cnt = [Int](repeating: 0, count: 10)
        cnt[0] = map["z", default: 0]   // Just zero has 'z'
        cnt[2] = map["w", default: 0]   // Just two has 'w'
        cnt[4] = map["u", default: 0]   // Just four has 'u'
        cnt[6] = map["x", default: 0]   // Just six has 'x'
        cnt[8] = map["g", default: 0]   // Just eight has 'g'
        
        cnt[3] = map["h", default: 0] - cnt[8]
        cnt[5] = map["f", default: 0] - cnt[4]
        
        cnt[7] = map["v", default: 0] - cnt[5]
        cnt[9] = map["i", default: 0] - cnt[5] - cnt[6] - cnt[8]
        cnt[1] = map["o", default: 0] - cnt[0] - cnt[2] - cnt[4]
        
        var ans = ""
        for i in 0...9 {
            for _ in 0..<cnt[i] {
                ans += "\(i)"
            }
        }
        return ans
    }

}
