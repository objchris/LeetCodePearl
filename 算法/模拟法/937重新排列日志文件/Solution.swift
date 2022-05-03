/*
937. 重新排列日志文件
https://leetcode-cn.com/problems/reorder-data-in-log-files/
*/
class Solution {
    func reorderLogFiles(_ logs: [String]) -> [String] {
        var numLogs = [String]()
        var charLogs = [String]()
        for i in logs.indices {
            let log = logs[i]
            if log.split(separator: " ").map{ Array($0)[0] }[1].isNumber {
                numLogs.append(log)
            } else {
                charLogs.append(log)
            }
        }

        var ans = charLogs.sorted { lhs, rhs in 
            let arrL = lhs.split(separator: " ").map{ String($0) }
            let arrR = rhs.split(separator: " ").map{ String($0) }
            let s1 = arrL[1..<arrL.count].joined(separator: " ")
            let s2 = arrR[1..<arrR.count].joined(separator: " ")
            if s1 == s2 {
                return arrL[0] < arrR[0]
            } else {
                return s1 < s2
            }
        }
        return ans + numLogs
    }
}
