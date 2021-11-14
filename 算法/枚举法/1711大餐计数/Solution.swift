/**
 [枚举]1711.大餐计数
 https://leetcode-cn.com/problems/count-good-meals/solution/
 */
class Solution {
    // 暴力TLE，O(n^2)
    func countPairs_TLE(_ deliciousness: [Int]) -> Int {

        var count = 0
        for i in deliciousness.indices {
            for j in (i+1)..<deliciousness.count {
                let sum = deliciousness[i] + deliciousness[j]
                if sum != 0 && (sum & (sum - 1) == 0) {
                    sum
                    count = (count + 1) % Int(1e9 + 7)
                }
            }
        }
    
        return count
        
    }
    
    func countPairs(_ deliciousness: [Int]) -> Int {
        
        // 题干说明： 0 < deliciousness[i] <= 2^20
        // 因此两数相加最大为 2^21
        let max = 1<<22
        let mod = Int(1e9 + 7)
        
        var ans = 0
        var map = [Int: Int]()
        for i in deliciousness {
            var j = 1
            while j < max {
                let t = j - i
                if let n = map[t] {
                    ans += n
                }
                j <<= 1
            }
            map[i] = map[i] == nil ? 1 : map[i]! + 1
        }
        return ans % mod
        
    }
    
}

let s = Solution()
s.countPairs([2160,1936,3,29,27,5,2503,1593,2,0,16,0,3860,28908,6,2,15,49,6246,1946,23,105,7996,196,0,2,55,457,5,3,924,7268,16,48,4,0,12,116,2628,1468])
