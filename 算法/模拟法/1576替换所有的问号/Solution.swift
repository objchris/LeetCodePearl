/*
1576. 替换所有的问号
https://leetcode-cn.com/problems/replace-all-s-to-avoid-consecutive-repeating-characters/

简单字符串模拟
*/
class Solution {
    let back:[Character] = ["a","b","c"]
    func modifyString(_ s: String) -> String {
        var arr = Array(s)
        let n = arr.count
        for i in arr.indices {
            if arr[i] != "?" { continue }
            for j in back.indices {
                if (i > 0 && arr[i - 1] == back[j]) || (i < n - 1 && arr[i + 1] == back[j]) {
                    continue
                }
                arr[i] = back[j]
            }
        }
        return String(arr)
    }
}
