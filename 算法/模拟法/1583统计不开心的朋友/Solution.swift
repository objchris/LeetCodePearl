/*
 [模拟]1583. 统计不开心的朋友
 https://leetcode-cn.com/problems/count-unhappy-friends/
 
 模拟题，先将所有的 preferencespreferences 使用「哈希表套哈希表」的形式进行存储，存储格式为 {x : {y : score1}, {z : score2}, ... }。

 如果 x 和 y 的亲密度要比 x 和 z 的亲密度要高，则有 score1 > score2。利用原本 preferences[i] 就是按照亲密度进行排序，我们可以对下标进行转换作为亲密数得分即可。

 */
class Solution {

    var map = [Int: [Int: Int]]()
    func unhappyFriends(_ n: Int, _ preferences: [[Int]], _ pairs: [[Int]]) -> Int {
        let m = pairs.count
        for i in 0 ..< n {
            let p = preferences[i]
            var cur = [Int: Int]()
            for j in 0 ..< n-1 {
                cur[p[j]] = n - j
            }
            map[i] = cur
        }
        var ans = 0
        for i in 0 ..< m {
            let x = pairs[i][0], y = pairs[i][1]
            var xok = false, yok = false
            for j in 0 ..< m {
                if i == j {
                    continue
                }
                let u = pairs[j][0], v = pairs[j][1]
                if !xok && check(x, y, u, v) {
                    xok = true
                }
                if !yok && check(y, x, u, v) {
                    yok = true
                }
                if xok && yok {
                    break
                }
            }
            if xok {
                ans += 1
            }
            if yok {
                ans += 1
            }
        }
        return ans

    }
    
    func check(_ x: Int, _ y: Int, _ u: Int, _ v: Int) -> Bool {
        let xMap = map[x]!, uMap = map[u]!, vMap = map[v]!
        if xMap[u]! > xMap[y]! && uMap[x]! > uMap[v]! {
            return true
        }
        if xMap[v]! > xMap[y]! && vMap[x]! > vMap[u]! {
            return true
        }
        return false
    }

}

