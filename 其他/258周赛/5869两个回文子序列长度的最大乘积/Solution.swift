/*
 5869. 两个回文子序列长度的最大乘积
 https://leetcode-cn.com/problems/maximum-product-of-the-length-of-two-palindromic-subsequences/
 
 题目要求数据量 N <= 12
 尝试使用状态压缩，回文序列的数据量最多有 2 ^ 12 = 4096
 然后求最大乘积，由于 4096 ^ 2 = 16777216 ，所以直接暴力求解
 */
class Solution {

    func check(_ s: [String], _ state: Int) -> Bool {
        var l = 0, r = s.count - 1

        // 检查 state 对应的子字符串是不是回文串
        while l < r {
            // 将 left 和 right 对应上 「状态所对应的字符」 位置
            while l < r && ((state >> l) & 1) == 0 {
                l += 1
            }
            while l < r && ((state >> r) & 1) == 0 {
                r -= 1
            }
            if s[l] != s[r] {
                return false
            }
            l += 1
            r -= 1
        }

        return true
    }

    func maxProduct(_ s: String) -> Int {
        let `s` = Array(s).map{ String($0) }
        let n = s.count
        // 状态压缩
        let m = 1 << n
        var arr = [[Int]]()
        
        for i in 1..<m {
            if check(s, i) {
                arr.append([i, i.nonzeroBitCount])
            }
        }

        var ans = 0
        var cnt = arr.count
        for i in 0..<cnt-1 {
            let x = arr[i][0], len_x = arr[i][1]
            for j in i+1..<cnt {
                let y = arr[j][0], len_y = arr[j][1]
                // 状态之间没有字符相交，满足题意
                if (x & y) == 0 {
                    ans = max(ans, len_x * len_y)
                }
            }
        }
        return ans
    }
}
