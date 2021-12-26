/*
 5966. 还原原数组
 https://leetcode-cn.com/problems/recover-the-original-array/
 
 1. 排序，得到lower[0]
 2. 遍历sorted，根据higher[0]计算d
 3. 根据d，双指针计算剩余的数中是否恰好两两配对
 */
class Solution {
    func recoverArray(_ nums: [Int]) -> [Int] {
        let sorted = nums.sorted()
        let n = sorted.count
        for i in 1..<n {
            let d = sorted[i] - sorted[0]   // higher[0]
            if d == 0 || d % 2 != 0 { continue } // 2k 不能为 0 或奇数
            var vis = [Bool](repeating: false, count: n)
            var ans = [Int]()
            ans.append(sorted[0] + d / 2)
            vis[i] = true
            var l = 1, r = i + 1
            while r < n {
                while l < n && vis[l] { l += 1 }
                while r < n && sorted[r] - sorted[l] < d { r += 1 } // 让 r 继续移动
                if sorted[r] - sorted[l] != d { break }
                vis[l] = true
                vis[r] = true
                ans.append(sorted[l] + d / 2)
                l += 1
                r += 1
            }
            if ans.count == n / 2 {
                return ans
            }
        }
        return []
    }
}
