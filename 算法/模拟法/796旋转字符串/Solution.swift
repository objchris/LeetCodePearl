/*
796. 旋转字符串
https://leetcode-cn.com/problems/rotate-string/
*/
class Solution {
    func rotateString(_ s: String, _ goal: String) -> Bool {
        s.count == goal.count && (s + s).contains(goal)
    }
}
