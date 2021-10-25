/*
229. 求众数 II
https://leetcode-cn.com/problems/majority-element-ii/submissions/

摩尔计数法
*/
class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var a = 0, b = 0
        var c1 = 0, c2 = 0
        for i in nums {
            if c1 != 0 && a == i { c1 += 1}
            else if c2 != 0 && b == i { c2 += 1}
            else if c1 == 0 { 
                a = i
                c1 += 1
            } else if c2 == 0 {
                b = i
                c2 += 1
            } else {
                c1 -= 1
                c2 -= 1
            }
        }
        // 验证
        c1 = 0
        c2 = 0
        for i in nums {
            if a == i { c1 += 1 }
            else if b == i { c2 += 1}
        }
        var ans = [Int]()
        if c1 > n / 3 { ans.append(a) }
        if c2 > n / 3 { ans.append(b) }
        return ans
    }
}
