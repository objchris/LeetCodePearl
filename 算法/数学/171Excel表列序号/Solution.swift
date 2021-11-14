/*
 171. Excel 表列序号
 https://leetcode-cn.com/problems/excel-sheet-column-number/
 
 */
class Solution {
    func titleToNumber(_ columnTitle: String) -> Int {

        var ans = 0
        var i = columnTitle.count - 1
        for c in columnTitle {
            let m = Int(c.asciiValue! - Character("A").asciiValue!) + 1
            ans += m * Int(pow(Double(26), Double(i)))
            i -= 1
        }
        return ans

    }
}
