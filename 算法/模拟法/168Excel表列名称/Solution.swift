/*
 168. Excel表列名称
 https://leetcode-cn.com/problems/excel-sheet-column-title/
 
 模拟求解
 */
class Solution {
    func convertToTitle(_ columnNumber: Int) -> String {
        var ans = ""
        let r = [
            "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
        ]
        var n = columnNumber
        while n != 0 {
            ans = r[(n - 1) % 26] + ans
            n = (n - 1) / 26
        }
        return ans
    }
}
