/*
467. 环绕字符串中唯一的子字符串
https://leetcode.cn/problems/unique-substrings-in-wraparound-string/
*/
class Solution {
    func findSubstringInWraproundString(_ p: String) -> Int {
        let arr = Array(p)
        var k = 0, dp = [Int](repeating: 0, count: 26)
        for i in 0..<arr.count {
            if i > 0 && (arr[i].asciiValue! + 26 - arr[i - 1].asciiValue!) % 26 == 1 {
                k += 1
            } else {
                k = 1
            }
            dp[Int(arr[i].asciiValue! - Character("a").asciiValue!)] = max(dp[Int(arr[i].asciiValue! - Character("a").asciiValue!)], k)
        }
        return dp.reduce(0, +)
    }
}
