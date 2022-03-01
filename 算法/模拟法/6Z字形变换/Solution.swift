/*
6. Z 字形变换
https://leetcode-cn.com/problems/zigzag-conversion/
*/
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }
    	var store = [[Character]](repeating:[], count: numRows)
    	let arr = Array(s)
    	var cur = 0, down = true
    	for c in arr {
    		store[cur].append(c)
    		if down {
    			cur += 1
    			if cur == numRows {
    				down = false
    				cur = numRows - 2
    				if cur == 0 { down = true }
    			}
    		} else {
    			cur -= 1
    			if cur == 0 {
    				down = true
    			}
    		}
    	}
    	var ans = ""
    	for chars in store {
    		ans += String(chars)
    	}
    	return ans
    }
}
