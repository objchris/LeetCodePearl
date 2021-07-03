/**
 451. 根据字符出现频率排序
 https://leetcode-cn.com/problems/sort-characters-by-frequency/

 桶排序
 */
class Solution {
    func frequencySort(_ s: String) -> String {

        var mark = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 128)
        for (i, _) in mark.enumerated() {
            mark[i][0] = i
        }
        for (_, c) in s.enumerated() {
            let ascii = Int(c.asciiValue!)
            mark[ascii][1] += 1
        }
        
        mark.sort { a, b in
            return a[1] > b[1]
        }
        var ans = ""
        for i in mark {
            let s = String(Character(UnicodeScalar(i[0])!))
            for _ in 0..<i[1] {
                ans += s
            }
        }
        return ans
        
    }
}

