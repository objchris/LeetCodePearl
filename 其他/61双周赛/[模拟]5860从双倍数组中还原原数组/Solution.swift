/*
 5860. 从双倍数组中还原原数组
 https://leetcode-cn.com/problems/find-original-array-from-doubled-array/
 */
class Solution {
    func findOriginalArray(_ changed: [Int]) -> [Int] {
        guard changed.count % 2 == 0 else {
            return []
        }
        var arrays = [Int](repeating: 0, count: 100001)
        for i in changed {
            arrays[i] += 1
        }
        let sorted = changed.sorted()
        var ans = [Int]()
        for i in sorted {
            if i * 2 > 100000 {
                break
            }
            if arrays[i] <= 0 {
                continue
            }
            arrays[i] -= 1
            if arrays[i * 2] == 0 {
                return []
            }
            ans.append(i)
            arrays[i * 2] -= 1
        }
        return ans.count == changed.count / 2 ? ans : []
    }
}


class Solution2 {
    func findOriginalArray(_ changed: [Int]) -> [Int] {
        let sorted = changed.sorted()
        var ans = [Int]()
        var list = [Int]()
        for i in sorted {
            if !list.isEmpty && list.first == i {
                list.removeFirst()
            } else {
                ans.append(i)
                list.append(i * 2)
            }
        }
        if !list.isEmpty {
            return []
        }
        return ans
    }
}
