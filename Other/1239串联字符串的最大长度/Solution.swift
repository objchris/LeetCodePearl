// 1239 串联字符串的最大长度
// https://leetcode-cn.com/problems/maximum-length-of-a-concatenated-string-with-unique-characters/
// 递归、回溯法

class Solution {
    
    var ans = 0
    var masks = [Int]()
    
    func maxLength(_ arr: [String]) -> Int {
        
        for s in arr {
            var mask = 0
            for c in s {
                let ch = c.asciiValue! - Character("a").asciiValue!
                if (mask >> ch) & 1 != 0 {
                    mask = 0
                    break
                }
                mask |= 1 << ch
            }
            if mask > 0 {
                masks.append(mask)
            }
        }
        backtrack(pos: 0, mask: 0)
        return ans
        
    }
    
    func backtrack(pos: Int, mask: Int) {
        if pos == masks.count {
            ans = max(ans, mask.nonzeroBitCount)
            return
        }
        if (mask & masks[pos]) == 0 {
            backtrack(pos: pos + 1, mask: mask | masks[pos])
        }
        backtrack(pos: pos + 1, mask: mask)
    }
    
}

let s = Solution()
s.maxLength(["un","iq","ue"])



