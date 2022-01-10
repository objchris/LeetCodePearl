/*
306. 累加数
https://leetcode-cn.com/problems/additive-number/

DFS 暴力搜索
*/

/*  1. WA
  第一个DFS找第一个数字
  第二个DFS找第二个数字
  找到后通过第三个DFS函数找后续的所有数字
  问题是，如果使用 Int 存储数字，会有溢出的问题
*/
class Solution_WA {
    func isAdditiveNumber(_ num: String) -> Bool {
        let nums = Array(num).map { Int(String($0))! }
        return dfs(nums, 0, 0)
    }

    func dfs(_ nums: [Int], _ idx: Int, _ cur: Int) -> Bool {
        if idx >= nums.count - 2 { return false }
        let n = cur * 10 + nums[idx]
        if dfs2(nums, idx + 1, n, 0) { return true }
        return dfs(nums, idx + 1, n)
    }

    func dfs2(_ nums: [Int], _ idx: Int, _ fir: Int, _ sec: Int) -> Bool {
        if idx >= nums.count - 1 { return false }
        let n = sec * 10 + nums[idx]
        if dfs3(nums, idx + 1, fir, n, 0) { return true }
        return dfs2(nums, idx + 1, fir, n)
    }

    func dfs3(_ nums: [Int], _ idx: Int, _ fir: Int, _ sec: Int, _ thi: Int) -> Bool {
        if idx == nums.count { return false }
        let n = thi * 10 + nums[idx]
        if n == fir + sec {
            if idx == nums.count - 1 { return true }
            else { return dfs3(nums, idx + 1, sec, n, 0) }
        } else {
            return dfs3(nums, idx + 1, fir, sec, n)
        }
    }
}

/*
  2. 使用数组解决溢出的问题
  大数可以用数组来表示
*/

class Solution_AC {
    var nums: [Int]!
    var n: Int!
    var list = [[Int]]()

    func isAdditiveNumber(_ num: String) -> Bool {
        nums = Array(num).map { Int(String($0))! }
        n = nums.count
        return dfs(0)
    }

    func dfs(_ idx: Int) -> Bool {
        let m = list.count
        if idx == n { return m >= 3 }
        let maxV:Int = (nums[idx] == 0) ? idx + 1 : n
        var cur = [Int]()
        for i in idx..<maxV {
            cur.append(nums[i])
            if m < 2 || check(list[m - 2], list[m - 1], cur) {
                list.append(cur)
                if dfs(i + 1) { return true }
                list.popLast()
            }
        }
        return false
    }

    // 使用数组进行计算
    func check(_ a: [Int], _ b: [Int], _ c: [Int]) -> Bool {
        var ans = [Int]()
        var t = 0
        let maxCnt = max(a.count, b.count)
        for i in 0..<maxCnt {
            if i < a.count { t += a[i] }
            if i < b.count { t += b[i] }
            ans.append(t % 10)
            t /= 10 // 进位
        }
        if t > 0 { ans.append(t) }
        if ans.count != c.count { return false }
        for i in 0..<c.count {
            if ans[i] != c[i] { return false }
        }
        return true
    }
}
