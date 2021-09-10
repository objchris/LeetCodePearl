/*
 1894. 找到需要补充粉笔的学生编号
 https://leetcode-cn.com/problems/find-the-student-that-will-replace-the-chalk/
 
 前缀和 + 二分法
 */
class Solution {
    func chalkReplacer(_ chalk: [Int], _ k: Int) -> Int {
        let n = chalk.count
        var sums = [Int](repeating: 0, count: n + 1)
        for i in 1...n {
        sums[i] = sums[i - 1] + chalk[i - 1]
        }
        let t = k % sums[n]

        var l = 0, r = n
        while l < r {
            let mid = (l + r + 1) >> 1
            if sums[mid] <= t {
                l = mid
            } else {
                r = mid - 1
            }
        }

        return l
    }
}
