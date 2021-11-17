/*
318. 最大单词长度乘积
https://leetcode-cn.com/problems/maximum-product-of-word-lengths/
*/
class Solution {
    func maxProduct(_ words: [String]) -> Int {
        let baseAscii = Character("a").asciiValue!
		let newWords = words.map{ word -> (Int, Int) in 
			let chars = Array(word)
			let count = chars.count
			var mask = 0
			for c in chars {
				let i = c.asciiValue! - baseAscii
				mask |= (1 << i)
			}
			return (mask, count)
		}
		let n = newWords.count
        var ans = 0
        for i in 0..<n - 1 {
            for j in i..<n {
                if (newWords[i].0 & newWords[j].0) == 0 {
                    ans = max(ans, newWords[i].1 * newWords[j].1)
                }
            }
        }
        return ans
    }
}
