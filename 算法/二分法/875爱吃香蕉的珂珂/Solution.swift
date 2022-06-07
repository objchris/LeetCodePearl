/*
875. 爱吃香蕉的珂珂
https://leetcode.cn/problems/koko-eating-bananas/
*/
class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var l = 1, r = Int(1e9)
        while l < r {
            let m = (l + r) >> 1
            if check(piles, m, h) {
                r = m
            } else {
                l = m + 1
            }
        }
        return r
    }

    func check(_ p: [Int], _ k: Int, _ h: Int) -> Bool {
        var ans = 0
        for x in p {
            ans += Int(ceil(Double(x) / Double(k)))
        }
        return ans <= h
    }
}
