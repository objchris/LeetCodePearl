/*
798. 得分最高的最小轮调
https://leetcode-cn.com/problems/smallest-rotation-with-highest-score/

题解也是难以理解的一题...
*/
class Solution{
    func bestRotation(_ A: [Int]) -> Int {
        let len = A.count
        var badArr = Array.init(repeating: 0, count: len)
        //badArr[1]代表移动一次时，得分变化量
        for i in 0..<len{
            let left = (i - A[i] + 1 + len) % len
            let right = (i + 1) % len
            //移动left次时，A[i]对分数的影响是-1，right反之
            badArr[left]-=1
            badArr[right]+=1
        }

        var best = -len
        var ans = 0
        var cur = 0
        for i in 0..<len{
            cur+=badArr[i]
            if cur>best{
                best = cur
                ans = i
            }
        }
        
        return ans
    }
}
