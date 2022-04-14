/*
1672. 最富有客户的资产总量
https://leetcode-cn.com/problems/richest-customer-wealth/
*/
class Solution {
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        accounts.map{ $0.reduce(0, +) }.max()!
    }
}
