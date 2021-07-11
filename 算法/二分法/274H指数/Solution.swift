/*
 [二分法]274. H 指数
 https://leetcode-cn.com/problems/h-index/
 */

class Solution {
    
    // O(nlogn):取决于排序算法
    func hIndex_sort(_ citations: [Int]) -> Int {

        let sorted = citations.sorted()
        var h = 0, i = sorted.count - 1
        while(i >= 0 && sorted[i] > h) {
            h += 1
            i -= 1
        }
        return h
        
    }
    
    // 二分法
    // 文献份数0...n满足二段性，且有序
    func hIndex(_ citations: [Int]) -> Int {
        
        func check(mid: Int) -> Bool {
            var count = 0
            for c in citations {
                count += c >= mid ? 1 : 0
            }
            return count >= mid
        }
        
        var l = 0
        var r = citations.count - 1
        while l <= r {
            let mid = (l + r) / 2
            if check(mid: mid) {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return r
        
    }
    
}

