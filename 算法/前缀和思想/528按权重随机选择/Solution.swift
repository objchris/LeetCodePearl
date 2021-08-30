/*
 528. 按权重随机选择
 https://leetcode-cn.com/problems/random-pick-with-weight/
 
 前缀和+二分法
 */
class Solution {

    var store: [Int]?

    init(_ w: [Int]) {
        store = [Int](repeating: 0, count: w.count + 1)
        for i in w.indices {
            store![i + 1] = store![i] + w[i]
        }
    }
    
    func pickIndex() -> Int {
        let random = Int.random(in: 1...store!.last!)
        var left = 0, right = store!.count - 1
        while left < right {
            let mid = (left + right) >> 1
            if store![mid] >= random {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return right - 1
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(w)
 * let ret_1: Int = obj.pickIndex()
 */
