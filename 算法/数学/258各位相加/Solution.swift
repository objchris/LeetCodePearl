/*
258. 各位相加
https://leetcode-cn.com/problems/add-digits/
*/
class Solution {
    func addDigits(_ num: Int) -> Int {
        return (num - 1) % 9 + 1;
    }
}
