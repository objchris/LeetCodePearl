/*
 541. 反转字符串 II
 https://leetcode-cn.com/problems/reverse-string-ii/
 */
class Solution {
    func reverseStr(_ s: String, _ k: Int) -> String {
        var arr = [Character](s).map(String.init)
        var shouldReverse = true
        for i in stride(from: 0, to: arr.count, by: k) {
            let r = min(arr.count - 1, i + k)
            if shouldReverse {
                arr[i..<r].reverse()
            }
            shouldReverse.toggle()
        }
        return arr.joined()
    }
}
