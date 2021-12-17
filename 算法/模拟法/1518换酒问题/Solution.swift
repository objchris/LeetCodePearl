/*
1518. 换酒问题
https://leetcode-cn.com/problems/water-bottles/
*/
class Solution {
    func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
        var numBottles = numBottles
        var ans = numBottles
        while numBottles >= numExchange {
            ans += numBottles / numExchange
            numBottles = numBottles / numExchange + numBottles % numExchange
        }
        return ans
    }
}
