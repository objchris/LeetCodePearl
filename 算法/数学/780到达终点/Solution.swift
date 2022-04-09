/*
780. 到达终点
https://leetcode-cn.com/problems/reaching-points/
*/
class Solution {
    func reachingPoints(_ sx: Int, _ sy: Int, _ tx: Int, _ ty: Int) -> Bool {
        var tx = tx, ty = ty 
        while tx > sx && ty > sy && tx != ty {
            if tx > ty { tx %= ty }
            else { ty %= tx }
        }
        if tx == sx && ty == sy { return true }
        else if tx == sx { return ty > sy && (ty - sy) % tx == 0 }
        else if ty == sy { return tx > sx && (tx - sx) % ty == 0 }
        else { return false }
    }
}
