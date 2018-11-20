//
//  861_Score After Flipping Matrix
//  LeetcodeWithSwift
//
//  Created by Chris Cheung on 2018/11/14.
//  Copyright © 2018 OBJCHRIS. All rights reserved.
//

import Foundation

class Solution {
    func matrixScore(_ A: [[Int]]) -> Int {
        let M = A.count, N = A[0].count, ans = M * (1 << (N - 1))
        for j in 1..<N {
            var cur = 0
            for i in 0..<M {
                cur += (A[i][j] == A[i][0]) ? 1 : 0
            }
            ans += max(cur, M - cur) * (1 << (N - j - 1))
        }
        return ans
    }
}
