/*
 剑指Offer 38 题
 https://leetcode-cn.com/problems/zi-fu-chuan-de-pai-lie-lcof/
 输入一个字符串，打印出该字符串中字符的所有排列。
 */
class Solution {
    
    func permutation(_ s: String) -> [String] {
        guard s.count > 1 else {
            return [s]
        }
        
        var chars = [Character]()
        for c in s {
            chars.append(c)
        }
        var ans = [String]()
        
        func dfs(_ i: Int) {
            if (i == chars.count - 1) {
                ans.append(String(chars))
                return
            }
            var doneSet = Set<Character>()
            for j in i..<chars.count {
                if doneSet.contains(chars[j]) {
                    continue
                }
                doneSet.insert(chars[j])
                (chars[i], chars[j]) = (chars[j], chars[i])
                dfs(i + 1)
                (chars[i], chars[j]) = (chars[j], chars[i])
            }
        }
        
        dfs(0)
        return ans
        
    }
    
}

let s = Solution()
s.permutation("abc")
