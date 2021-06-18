// 483. Smallest Good Base
// 可以测试下"2251799813685247", "16035713712910627"这两个用例，答案是"2", "502"
// https://leetcode-cn.com/problems/smallest-good-base/solution/zui-xiao-hao-jin-zhi-er-fen-shu-xue-fang-frrv/
import Foundation

class Solution {
    func smallestGoodBase(_ n: String) -> String {
        
        let num = Double(n)!
        for i in (3...Int(log(num)/log(2.0) + 1)).reversed() {
            var left: Double = 0
            var right: Double = num - 1
            while left <= right {
                let mid = (left + right) / 2.0
                let s = 0
                let MaxVal = num / mid + 1
                for j in 0..<i {
                    
                }
            }
        }
        
        
        
    },
    
    
}

