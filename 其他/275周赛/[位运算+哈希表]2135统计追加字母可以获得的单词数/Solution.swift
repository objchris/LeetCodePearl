/*
 2135. 统计追加字母可以获得的单词数
 https://leetcode-cn.com/problems/count-words-obtained-after-adding-a-letter/
 */
class Solution {
    func wordCount(_ startWords: [String], _ targetWords: [String]) -> Int {
        var set = Set<Int>()
        for w in startWords {
            let m = mask(w)
            // 将startWord所有可以符合的状态都计算出来，加入到set中
            for i in 0..<26 {
                if (m >> i) & 1 == 0 {
                    set.insert(m | (1 << i))
                }
            }
        }
        var ans = 0
        for w in targetWords {
            let m = mask(w)
            // 判断set中是否有targetWord
            if set.contains(m) {
                ans += 1
            }
        }
        return ans
    }

    func mask(_ word: String) -> Int {
        // 将字符串转换为26位的二进制数
        let a = Int(Character("a").asciiValue!)
        var ret = 0
        for c in word {
            ret |= (1 << (Int(c.asciiValue!) - a))
        }
        return ret
    }
}
