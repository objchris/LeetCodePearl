/*
 2032. 至少在两个数组中出现的值
 https://leetcode-cn.com/problems/two-out-of-three/
 
 直接暴力求解
 */
class Solution {
    func twoOutOfThree(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int]) -> [Int] {
        var ans = Set<Int>()
        for n1 in nums1 {
            for n2 in nums2 {
                for n3 in nums3 {
                    if n1 == n2 || n1 == n3 {
                        ans.insert(n1)
                        continue
                    }
                    if n2 == n3 {
                        ans.insert(n2)
                        continue
                    }
                }
            }
        }
        return Array(ans)
    }
}
