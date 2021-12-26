/*
1078. Bigram 分词
https://leetcode-cn.com/problems/occurrences-after-bigram/

简单模拟题
*/
class Solution {
    func findOcurrences(_ text: String, _ first: String, _ second: String) -> [String] {
        let arr = text.split(separator: " ").map { String($0) }
        let n = arr.count
        var ans = [String]()
        for i in 0..<n-2 {
            if arr[i] == first && arr[i + 1] == second {
                ans.append(arr[i + 2])
            }
        }
        return ans
    }
}
