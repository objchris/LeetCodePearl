/*
 5873. 考试的最大困扰度
 https://leetcode-cn.com/problems/maximize-the-confusion-of-an-exam/
 
 题目要求「 最长连续子区间 」
 滑动窗口代码思路（如下 `solve` 方法）：
 1. 使用 left 和 right 两个指针，分别指向滑动窗口的左右边界。
 2. right 主动右移：right 指针每次移动一步。当 A[right] 为 0，说明滑动窗口内增加了一个 0；
 3. left 被动右移：判断此时窗口内 0 的个数，如果超过了 K，则 left 指针被迫右移，直至窗口内的 0 的个数小于等于 K 为止。
 滑动窗口长度的最大值就是所求。

 */
class Solution {
    func maxConsecutiveAnswers(_ answerKey: String, _ k: Int) -> Int {
        let arr = Array(answerKey)
        return max(solve(arr, k, "T"), solve(arr, k, "F"))
    }

    func solve(_ answers: [Character], _ k: Int, _ t: Character) -> Int {
        var ans = 0
        let n = answers.count
        var l = 0, r = 0, z = 0
        while r < n {
            if answers[r] != t { z += 1 }
            while z > k {
                if answers[l] != t { z -= 1 }
                l += 1
            }
            ans = max(ans, r - l + 1)
            r += 1
        }
        return ans
    }
}
