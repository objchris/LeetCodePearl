/*
 5954. 给植物浇水 II
 https://leetcode-cn.com/problems/watering-plants-ii/
 
 双指针。需要注意题目中 A 和 B 是 同时 的，不存在某一个人浇完所有植物的情况
 */
class Solution {
    func minimumRefill(_ plants: [Int], _ capacityA: Int, _ capacityB: Int) -> Int {
        let n = plants.count
        var a = capacityA, b = capacityB
        var l = 0, r = n - 1
        var ans = 0
        while l <= r {
            while l < r && a >= plants[l] && b >= plants[r] {
                a -= plants[l]
                b -= plants[r]
                l += 1
                r -= 1
            }
            if l > r {
                break
            }
            if l == r {
                let maxv = max(a, b)
                if maxv < plants[l] { ans += 1 }
                break
            }
            if a < plants[l] {
                a = capacityA
                ans += 1
            }
            if b < plants[r] {
                b = capacityB
                ans += 1
            }
        }
        return ans
    }
}
