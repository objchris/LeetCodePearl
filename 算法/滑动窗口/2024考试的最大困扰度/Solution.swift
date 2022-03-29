/*
2024. 考试的最大困扰度
https://leetcode-cn.com/problems/maximize-the-confusion-of-an-exam/
*/
class Solution {
    func maxConsecutiveAnswers(_ answerKey: String, _ k: Int) -> Int {
        let arr = Array(answerKey)
        return max(solve(arr, k, "T"), solve(arr, k, "F"))
    }

    func solve(_ arr: [Character], _ k: Int, _ t: Character) -> Int {
        var ans = 0
        var l = 0, r = 0, z = 0
        while r < arr.count {
            if arr[r] != t { z += 1 }
            while z > k {
                if arr[l] != t { z -= 1 }
                l += 1
            }
            ans = max(ans, r - l + 1)
            r += 1
        }
        return ans
    }
}
