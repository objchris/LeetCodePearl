/*
806. 写字符串需要的行数
https://leetcode-cn.com/problems/number-of-lines-to-write-string/
*/
class Solution {
    let a = Int(Character("a").asciiValue!)

    func numberOfLines(_ widths: [Int], _ s: String) -> [Int] {
    	var row = 1, cnt = 0
    	for c in s {
    		let width = widths[Int(c.asciiValue!) - a]
    		if cnt + width > 100 {
    			row += 1
    			cnt = width
    		} else {
    			cnt += width
    		}
    	}
    	return [row, cnt]
    }
}
