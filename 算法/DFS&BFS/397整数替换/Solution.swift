/*
397. 整数替换
https://leetcode-cn.com/problems/integer-replacement/
*/
class Solution {
    func integerReplacement(_ n: Int) -> Int {
		var ans = 0
		replaceNumber(n, &ans)
		return ans
	}

	func replaceNumber(_ n: Int, _ ans: inout Int) {
		if n <= 3 { 
			ans += (n - 1)
		} else if n % 2 == 0 {
			ans += 1
			replaceNumber(n / 2, &ans)
		} else {
			ans += 1
			if ((n + 1) / 2) % 2 == 0 {
				replaceNumber(n + 1, &ans)
			} else {
				replaceNumber(n - 1, &ans)
			}
		}
	}
}
