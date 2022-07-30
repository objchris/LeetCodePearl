/*
952. 按公因数计算最大组件大小
https://leetcode.cn/problems/largest-component-size-by-common-factor/
*/
class Solution {
    var p = [Int](repeating: 0, count: 20010)
    var sz = [Int](repeating: 0, count: 20010)
    var ans = 1

    func find(_ x: Int) -> Int {
        if p[x] != x { p[x] = find(p[x]) }
        return p[x]
    }

    func union(_ a: Int, _ b: Int) {
        if find(a) == find(b) { return }
        sz[find(a)] += sz[find(b)]
        p[find(b)] = p[find(a)]
        ans = max(ans, sz[find(a)])
    }

    func add(_ map: inout [Int: [Int]], _ key: Int, _ val: Int) {
        var arr = map[key, default: [Int]()]
        arr.append(val)
        map[key] = arr
    }

    func largestComponentSize(_ nums: [Int]) -> Int {
        let n = nums.count
        var map = [Int: [Int]]()
        for i in 0..<n {
            var cur = nums[i]
            var j = 2;
            while j * j <= cur {
                defer { j += 1 }
                if cur % j == 0 { add(&map, j, i) }
                while cur % j == 0 { cur /= j }
            }
            if cur > 1 { add(&map, cur, i) }
        }
        for i in 0...n {
            p[i] = i
            sz[i] = 1
        }
        for (k, v) in map {
            for i in 1..<v.count {
                union(v[0], v[i])
            }
        }
        return ans
    }
}
