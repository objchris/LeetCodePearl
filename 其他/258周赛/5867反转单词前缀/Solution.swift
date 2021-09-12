/*
 5867. 反转单词前缀
 https://leetcode-cn.com/problems/reverse-prefix-of-word/
 
 1、找到下标
 2、调换位置
 */
class Solution {
    func reversePrefix(_ word: String, _ ch: Character) -> String {
        
        var wordArray = Array(word).map{ String($0) }
        guard let index = wordArray.firstIndex(of: String(ch)) else {
            return word
        }
        
        var l = 0, r = index
        while l <= r {
            let temp = wordArray[l]
            wordArray[l] = wordArray[r]
            wordArray[r] = temp
            l += 1
            r -= 1
        }
        return wordArray.joined()
        
    }
    
    
}
