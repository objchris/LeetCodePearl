/*
762. 二进制表示中质数个计算置位
https://leetcode-cn.com/problems/prime-number-of-set-bits-in-binary-representation/
*/
class Solution {

    var hash = [Bool](repeating: false, count: 32)

    init() {
        let indices = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31]
        for idx in indices {
            hash[idx] = true
        }
    }

    func countPrimeSetBits(_ left: Int, _ right: Int) -> Int {
        var ans = 0
        for n in left...right {
            var x = n, count = 0 
            while x != 0 { 
                x &= (x - 1)
                count += 1
            }
            if hash[count] { ans += 1 }
        }
        return ans
    }
    
}
