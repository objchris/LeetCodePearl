/*
 165. 比较版本号
 https://leetcode-cn.com/problems/compare-version-numbers/
 */
class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        var v1c = version1.split(separator: ".").map{ String($0) }
        var v2c = version2.split(separator: ".").map{ String($0) }
        let maxCount = max(v1c.count, v2c.count)
        for _ in 0..<maxCount-v1c.count {
            v1c.append("")
        }
        for _ in 0..<maxCount-v2c.count {
            v2c.append("")
        }
        for i in 0..<maxCount {
            let t1 = Int(v1c[i]) ?? 0
            let t2 = Int(v2c[i]) ?? 0
            if t1 < t2 {
                return -1
            }
            if t1 > t2 {
                return 1
            }
        }
        return 0
    }
}
