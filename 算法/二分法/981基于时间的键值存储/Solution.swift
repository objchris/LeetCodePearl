/*
 [哈希表+二分法]981. 基于时间的键值存储
 https://leetcode-cn.com/problems/time-based-key-value-store/
 */
class TimeMap {
    
    struct Node {
        let value: String
        let time: Int
    }

    var map = [String: [Node]]()
    
    /** Initialize your data structure here. */
    init() {

    }
    // O(1)
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        if map[key] == nil {
            map[key] = [Node]()
        }
        let n = Node(value: value, time: timestamp)
        map[key]!.append(n)
    }
    // O(logn)
    func get(_ key: String, _ timestamp: Int) -> String {
        guard let m = map[key] else {
            return ""
        }
        var left = 0
        var right = m.count - 1
        var ans = ""
        while left <= right {
            let middle = (left + right) / 2
            if timestamp > m[middle].time {
                left = middle + 1
                ans = m[middle].value
            } else {
                right = middle - 1
            }
        }
        return ans
    }
}

/**
 * Your TimeMap object will be instantiated and called as such:
 * let obj = TimeMap()
 * obj.set(key, value, timestamp)
 * let ret_2: String = obj.get(key, timestamp)
 */

let s = TimeMap()
s.set("foo", "bar", 1)
s.get("foo", 1)
s.get("foo", 3)
s.set("foo", "bar2", 4)
s.get("foo", 2)
s.get("foo", 5)

