/*
剑指 Offer II 114. 外星文字典
https://leetcode.cn/problems/Jf1JuT/
*/
class Solution {

    enum State: Any {
        case visited
        case visiting 
    }

    var edges = [Character: [Character]]()
    var states = [Character: State]()
    var valid = true
    var order = [Character]()
    var index = 0

    func alienOrder(_ words: [String]) -> String {
        let n = words.count
        for word in words {
            let arr = Array(word)
            for i in arr.indices {
                edges[arr[i]] = [Character]()
            }
        }
        for i in 1..<n {
            if !valid { break }
            addEdge(words[i - 1], words[i])
        }
        order = [Character](repeating: Character(" "), count: edges.count)
        index = edges.count - 1
        let keys = edges.keys
        for u in keys {
            if states[u] == nil {
                dfs(u)
            }
        }
        if !valid {
            return ""
        }
        return String(order)
    }

    func addEdge(_ before: String, _ after: String) {
        let arr1 = Array(before), arr2 = Array(after)
        let n1 = before.count, n2 = after.count
        let n = min(n1, n2)
        var idx = 0
        while idx < n {
            let c1 = arr1[idx], c2 = arr2[idx] 
            if c1 != c2 {
                edges[c1]!.append(c2)
                break
            }
            idx += 1
        }
        if idx == n && n1 > n2 {
            valid = false
        }
    }

    func dfs(_ u: Character) {
        states[u] = .visiting
        let adjacent = edges[u]!
        for v in adjacent {
            if states[v] == nil {
                dfs(v)
                if !valid { return }
            } else if states[v]! == .visiting {
                valid = false
                return 
            }
        }
        states[u] = .visited
        order[index] = u
        index -= 1
    }

}
