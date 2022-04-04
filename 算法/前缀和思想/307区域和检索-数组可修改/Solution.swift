/*
307. 区域和检索 - 数组可修改
https://leetcode-cn.com/problems/range-sum-query-mutable/
*/
class NumArray {
    var tree: [Int]
    var nums: [Int]
    var n: Int

    func lowbit(_ x: Int) -> Int {
        return x & (-x)
    }

    func query(_ x: Int) -> Int {
        var ans = 0, i = x
        while i > 0 {
            ans += tree[i]
            i -= lowbit(i)
        }
        return ans
    }

    func add(_ x: Int, _ u: Int) {
        var i = x
        while i <= n {
            tree[i] += u
            i += lowbit(i)
        }
    }

    init(_ _nums: [Int]) {
        nums = _nums
        n = nums.count
        tree = [Int](repeating: 0, count: n + 1)
        for i in 0..<n {
            add(i + 1, nums[i])
        }
    }
    
    func update(_ index: Int, _ val: Int) {
        add(index + 1, val - nums[index])
        nums[index] = val
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        return query(right + 1) - query(left)
    }
}
