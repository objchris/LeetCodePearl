/*
969. 煎饼排序
https://leetcode-cn.com/problems/pancake-sorting/

题解：
https://leetcode-cn.com/problems/pancake-sorting/solution/chriswift-tan-xin-by-objchris-rck4/
*/
class Solution {
    func pancakeSort(_ arr: [Int]) -> [Int] {
        var arr = arr
        let n = arr.count
        var cnt = n
        var ans = [Int]()
        while cnt > 0 {
            if (arr[cnt - 1] == cnt) { // 已在对应位置
                cnt -= 1
                continue 
            }
            var idx = 0
            for i in 0..<cnt where arr[i] == cnt {
                idx = i
                break
            }
            if idx != 0 {
                ans.append(idx + 1)
                rotate(&arr, 0, idx)
            }
            ans.append(cnt)
            rotate(&arr, 0, cnt - 1)
            cnt -= 1
        }
        return ans
    }

    func rotate(_ arr: inout [Int], _ l: Int, _ r: Int) {
        var l = l, r = r
        while l < r {
            arr.swapAt(l, r)
            l += 1
            r -= 1
        }
    }

}
