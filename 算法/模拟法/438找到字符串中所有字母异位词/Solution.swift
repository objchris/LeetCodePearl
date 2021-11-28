/*
438. 找到字符串中所有字母异位词
https://leetcode-cn.com/problems/find-all-anagrams-in-a-string/
*/
class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let arr1 = Array(s)
        let arr2 = Array(p)
        guard arr1.count >= arr2.count else { return [] }
        var chars1 = [Int](repeating: 0, count: 26)
        var chars2 = [Int](repeating: 0, count: 26)
        for c in arr2 {
            chars2[Int(c.asciiValue! - Character("a").asciiValue!)] += 1
        }
        var l = 0 , r = 0
        var ans = [Int]()
        while r < arr1.count {
            chars1[Int(arr1[r].asciiValue! - Character("a").asciiValue!)] += 1
            if r - l == arr2.count - 1 {
                if check(chars1, chars2) {
                    ans.append(l)
                }
                chars1[Int(arr1[l].asciiValue! - Character("a").asciiValue!)] -= 1
                l += 1
            }
            r += 1
        }
        return ans
    }

    private func check(_ l: [Int], _ r: [Int]) -> Bool {
        for i in l.indices {
            if l[i] != r[i] { return false }
        }
        return true
    }
}
