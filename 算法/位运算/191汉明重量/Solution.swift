
/* 汉明重量(位运算)
 剑指 Offer 15. 二进制中1的个数 https://leetcode-cn.com/problems/er-jin-zhi-zhong-1de-ge-shu-lcof/
 191.位1的个数 https://leetcode-cn.com/problems/number-of-1-bits/
 
 * 使用 n & (n - 1) 或 n & -n 可以消除 n 的最低位 1
 
 */


import Foundation

class Solution {
    // O(logN)
    func hammingWeight1(_ n: Int) -> Int {
        
        var number = n
        var counter = 0
        while number > 0 {
            for i in 0...32 {
                let m = Int(pow(2, Double(i)))
                if m == number {
                    counter += 1
                    number = 0
                    break
                }
                if m > number {
                    counter += 1
                    number -= Int(pow(2, Double(i-1)))
                    break
                }
            }
        }
        
        return counter
    }
    
    // 以下均为O(k), k 为 int 的位数 -- 32
    func hammingWeight_2(_ n: Int) -> Int {
        var ans = 0
        for i in 0..<32 {
            if (n & (1 << i)) != 0 {
                ans += 1
            }
        }
        return ans
    }
    
    func hammingWeight(_ n: Int) -> Int {
        var ans = 0
        var num = n
        while num > 0 {
            num &= num - 1
            ans += 1
        }
        return ans
    }
    
    /*
     
     O(logk)，k 为 int 的位数，固定为 32 位
     n = (n & 0x55555555) + ((n >>> 1)  & 0x55555555);
     n = (n & 0x33333333) + ((n >>> 2)  & 0x33333333);
     n = (n & 0x0f0f0f0f) + ((n >>> 4)  & 0x0f0f0f0f);
     n = (n & 0x00ff00ff) + ((n >>> 8)  & 0x00ff00ff);
     n = (n & 0x0000ffff) + ((n >>> 16) & 0x0000ffff);

     作者：AC_OIer
     链接：https://leetcode-cn.com/problems/er-jin-zhi-zhong-1de-ge-shu-lcof/solution/gong-shui-san-xie-yi-ti-si-jie-wei-shu-j-g9w6/
     
     */
}

let s = Solution()
s.hammingWeight(1200)
