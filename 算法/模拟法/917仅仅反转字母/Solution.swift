/*
917. 仅仅反转字母
https://leetcode-cn.com/problems/reverse-only-letters/
*/
class Solution {

    func reverseOnlyLetters(_ s: String) -> String {
        var arr = Array(s)
        var l = 0, r = arr.count - 1
        while l < r {
            while l < r && !arr[l].isLetter { l += 1 }
            while l < r && !arr[r].isLetter { r -= 1 }
            arr.swapAt(l, r)
            l += 1
            r -= 1
        }
        return String(arr)
    }

}
