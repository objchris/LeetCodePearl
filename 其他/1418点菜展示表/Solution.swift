/**
 [哈希表]1418点菜展示表
 https://leetcode-cn.com/problems/display-table-of-food-orders-in-a-restaurant/
 
 处理输入并输出即可
 */
class Solution {
    func displayTable(_ orders: [[String]]) -> [[String]] {
        
        var nameSet = Set<String>()
        var map = [String: [String: Int]]() // 桌号 菜名 数量
        
        for order in orders {
            let table = order[1]
            let food = order[2]
            nameSet.insert(food)
            if (map[table] == nil) {
                map[table] = [String: Int]()
            }
            if (map[table]![food] == nil) {
                map[table]![food] = 0
            }
            map[table]![food]! += 1
        }
        
        let nameArr = nameSet.sorted(by: <) // 菜名排序
        let tableArr = map.keys.sorted { a, b in Int(a)! < Int(b)! }
        
        var table = [[String]](repeating: [String](), count: tableArr.count + 1)
        table[0].append("Table")
        for name in nameArr {
            table[0].append(name)
        }
        for i in 1...tableArr.count {
            table[i].append("\(tableArr[i-1])")
            for j in nameArr.indices {
                if let num = map[tableArr[i - 1]]![nameArr[j]] {
                    table[i].append("\(num)")
                } else {
                    table[i].append("0")
                }
            }
        }
        
        return table
    }
}


let s = Solution()
s.displayTable([["David","3","Ceviche"],["Corina","10","Beef Burrito"],["David","3","Fried Chicken"],["Carla","5","Water"],["Carla","5","Ceviche"],["Rous","3","Ceviche"]])
