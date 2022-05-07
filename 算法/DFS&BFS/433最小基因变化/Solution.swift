/*
433. 最小基因变化
https://leetcode-cn.com/problems/minimum-genetic-mutation/
*/
class Solution {
    var bank: Set<String>!
    var ans = Int.max
    let maybe: [Character] = ["A","C","G","T"]

    func minMutation(_ start: String, _ end: String, _ b: [String]) -> Int {
        bank = Set<String>(b)
        var visited = Set<String>()
        dfs(Array(start), Array(end), &visited, 0)
        return ans == Int.max ? -1 : ans
    }

    func dfs(_ lhs: [Character], _ rhs: [Character], _ visited: inout Set<String>, _ ret: Int) {
    	if isGenEqual(lhs, rhs) {
            ans = min(ans, ret)
            return 
    	}

    	for i in 0..<8 {
            var temp = lhs
            for gen in maybe {
                temp[i] = gen
                let s = String(temp)
                if bank.contains(s) && !visited.contains(s) {
                    visited.insert(s)
                    dfs(temp, rhs, &visited, ret + 1)
                    visited.remove(s)
                }
            }
    	}
    }

    func isGenEqual(_ lhs: [Character], _ rhs: [Character]) -> Bool {
    	for i in 0..<8 {
            if lhs[i] != rhs[i] { return false }
    	}
    	return true
    }
}
