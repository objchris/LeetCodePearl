/*
391. 完美矩形
https://leetcode-cn.com/problems/perfect-rectangle/

扫描线问题
*/
class Solution {
    func isRectangleCover(_ rectangles: [[Int]]) -> Bool {
        // (x, y1, y2, f) 保存一条边
        var n = rectangles.count
        var rs = [(Int, Int, Int, Int)]()
        for i in 0..<n {
            let rect = rectangles[i]
            rs.append((rect[0], rect[1], rect[3], 1))
            rs.append((rect[2], rect[1], rect[3], -1))
        }
        rs.sort { a, b in
            if a.0 != b.0 { return a.0 < b.0 }
            return a.1 < b.1
        }
        // 每个矩形变成两条边
        n *= 2
        var l1 = [(Int, Int)](), l2 = [(Int, Int)]()
        var i = 0
        while i < n {
            var j = i
            // 找位于同一个X坐标位置的线段
            while j < n && rs[j].0 == rs[i].0 {
                j += 1
            }
            l1.removeAll()
            l2.removeAll()
            for k in i..<j {
                let cur = (rs[k].1, rs[k].2)
                var list = rs[k].3 == 1 ? l1 : l2
                if list.isEmpty {
                    list.append(cur)
                } else {
                    var prev = list.last!
                    if cur.0 < prev.1 { return false }  // 交叉
                    else if cur.0 == prev.1 {
                        prev.1 = cur.1
                        list[list.count - 1].1 = cur.1
                    }  // 整合成一条线
                    else { list.append(cur) }
                }
                if rs[k].3 == 1 {
                    l1 = list
                } else {
                    l2 = list
                }
            }
            if i > 0 && j < n {
                if l1.count != l2.count { return false }
                for k in l1.indices {
                    if l1[k].0 == l2[k].0 && l1[k].1 == l2[k].1 { continue }
                    return false
                }
            } else {
                if l1.count + l2.count != 1 { return false }
            }
            i = j
        }
        return true
    }
}
