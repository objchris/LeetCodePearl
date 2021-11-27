/*
519. 随机翻转矩阵
https://leetcode-cn.com/problems/random-flip-matrix/

考察点：
1. 二维下标 (i, j) 可转换为 一维 n：
    二维 -> 一维：n = i * c + j   // c 为 二维数组的列数 
    一维 -> 二维：i = n / c, j = n % c
2. 洗牌算法
*/

class Solution_One {
    /* 此做法构建了一个长度为 m * n 的二维数组，结合考察点1进行解答
       但根据题目的提示：
       1. 1 <= m, n <= 10^4
       2. 最多调用 1000 次 flip 和 reset 方法。
       这样构建出来的数组含有10^8个元素，有很多空间是浪费的。
    */
    var matrix: [[Int]]
    var m = 0
    var n = 0

    init(_ m: Int, _ n: Int) {
        self.m = m
        self.n = n
        matrix = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
    }
    
    func flip() -> [Int] {
        var i = 0, j = 0
        repeat {
            let random = Int.random(in: 0..<(m * n))
            i = random / n
            j = random - n * i
        } while matrix[i][j] == 1   // 拒绝采样的做法不合理
        matrix[i][j] = 1
        return [i, j]
    }
    
    func reset() {
        matrix = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
    }
}

// 使用洗牌算法
class Solution_Two {

    var d = [Int: Int]()
    var p = 0
    var m = 0
    var n = 0

    init(_ m: Int, _ n: Int) {
        self.m = m
        self.n = n
    }
    
    func flip() -> [Int] {
        // 对于位置 p ，每次都从 [p, m*n) 中求一枚随机数
        // 并将其在字典中对应的值与 p 在字典中对应的值交换
        let random = Int.random(in: p..<(m * n))
        if d[p] == nil { d[p] = p }
        if d[random] == nil { d[random] = random }
        let v = d[p]!
        d[p] = d[random]!
        d[random] = v
        let ans = [d[p]! / n, d[p]! % n]    // 考察点1
        p += 1 
        return ans
    }
    
    func reset() {
        d.removeAll()
        p = 0
    }

}
