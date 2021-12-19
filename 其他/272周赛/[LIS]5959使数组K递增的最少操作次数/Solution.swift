/*
 5959. 使数组 K 递增的最少操作次数
 https://leetcode-cn.com/problems/minimum-operations-to-make-the-array-k-increasing/
 
 计算子数组的最长上升序列(LIS)的长度，使用子数组长度减去该长度即为结果
 需要注意的是：用二分法找下标的时候，需要找的是比 n 大的值的下标
 */
class Solution {
    func kIncreasing(_ arr: [Int], _ k: Int) -> Int {
        var ans = 0
        for i in 0..<k {
            var a = [Int]()
            for j in stride(from: i, to: arr.count, by: k) {
                a.append(arr[j])
            }
            ans += solved(a)
        }
        return ans
    }
    
    func solved(_ arr: [Int]) -> Int {
        var d = [Int]()
        let cnt = arr.count
        for n in arr {
            let idx = e(d, n)
            if idx == d.count {
                d.append(n)
                continue
            }
            d[idx] = n
        }
        return cnt - d.count
    }
    
    func e(_ d: [Int], _ n: Int) -> Int {
        // 找到比 n 大的第一个下标
        var l = 0, r = d.count - 1
        while l <= r {
            let mid = (l + r) >> 1
            if d[mid] > n {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return l
    }
}
