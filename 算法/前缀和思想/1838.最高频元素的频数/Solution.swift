/*
 1838. 最高频元素的频数
 https://leetcode-cn.com/problems/frequency-of-the-most-frequent-element/
 
 二分+前缀和
 */
class Solution {
    
    // O(n^2)
    func maxFrequency_TLE(_ nums: [Int], _ k: Int) -> Int {
        
        var map = [Int: Int]()
        for num in nums {
            map[num, default: 0] += 1
        }
        let list = map.keys
        let sortedKey = list.sorted()
        
        var ans = 1
        for i in sortedKey.indices {
            var x = sortedKey[i], cnt = map[x]!
            if i > 0 {
                var p = k
                for j in (0...i-1).reversed() {
                    let y = sortedKey[j]
                    let diff = x - y
                    if p >= diff {
                        let add = p / diff
                        let min = min(add, map[y]!)
                        p -= min * diff
                        cnt += min
                    } else {
                        break
                    }
                }
            }
            ans = max(ans, cnt)
        }
        return ans
    }
    
    func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
        
        let nums = nums.sorted(by:<)
        var total = 0, result = 1, left = 0
        for right in (1 ..< nums.count) {
            total += (nums[right] - nums[right - 1]) * (right - left)
            while total > k {
                total -= nums[right] - nums[left]
                left += 1
            }
            result = max(result, right - left + 1)
        }
        return result
        
    }
    
}

