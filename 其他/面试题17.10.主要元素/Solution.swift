/**
 面试题 17.10. 主要元素
 https://leetcode-cn.com/problems/find-majority-element-lcci/
 */

class Solution {
    // 哈希表
    func majorityElement(_ nums: [Int]) -> Int {
        let count = nums.count / 2
        var map = [Int: Int]()
        for num in nums {
            map[num, default:0] += 1
            if (map[num]! > count) {
                return num
            }
        }
        return -1
    }
    
    // 摩尔计票法
    // count = 0 时，赋值给candidate
    // 遇到与candidate不同的值时，count -= 1，否则 count += 1
    func majorityElement_Moore(_ nums: [Int]) -> Int {
        var count = 0
        var candidate = -1
        for num in nums {
            if count == 0 {
                candidate = num
            }
            if candidate == num {
                count += 1
            } else {
                count -= 1
            }
        }
        count = 0
        for num in nums {
            if candidate == num {
                count += 1
            }
        }
        return count > nums.count / 2 ? candidate : -1
    }
}

