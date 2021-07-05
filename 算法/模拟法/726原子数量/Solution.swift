/**
 [模拟]726原子的数量
 https://leetcode-cn.com/problems/number-of-atoms/
 
 map 当前串的结果
 sub 当前串的子串结果
 
 创建一个队列，遍历字符串
 若是数字，存到count ，若后一个还是数字，count = count * 10 + newValue
 若是小写字母，入队列
 若是大写字母、(、 ) ，把队列中的元素取出，组合即是原子，存入到map中
 遇到 ( ，递归进入子串，返回值存在sub中
    
 */
class Solution {
    
    private var formula = ""
    private var index: String.Index!
    
    private func isUpperCase(_ c: Character) -> Bool {
        return c.asciiValue! >= 65 && c.asciiValue! <= 90
    }
    
    private func isLowerCase(_ c: Character) -> Bool {
        return c.asciiValue! >= 97 && c.asciiValue! <= 122
    }
    
    private func isDigit(_ c: Character) -> Bool {
        return c.asciiValue! >= 48 && c.asciiValue! <= 57
    }
    
    func countOfAtoms(_ f: String) -> String {
        
        formula = f
        index = f.startIndex
        let ret = handleElement().sorted { lhs, rhs in
            lhs.key < rhs.key
        }
        return ret.reduce(into: "") { ret, s in
            let k = s.key
            let v = s.value == 1 ? "" : "\(s.value)"
            ret += "\(k)\(v)"
        }
        
    }
    
    private func handleElement() -> [String: Int] {
        var map = [String: Int]()
        var sub = [String: Int]()
        var queue = [String]()
        var count = 0
        // for
        while (index < formula.endIndex) {
            let char = formula[index]
            let str = String(char)
            index = formula.index(after: index)
            
            if isLowerCase(char) {
                queue.append(str)
                if index != formula.endIndex {
                    continue
                }
            } else if isDigit(char) {
                count = count * 10 + Int(char.asciiValue!) - 48
                if index != formula.endIndex {
                    continue
                }
            }
            
            
            // 大写字母、（、）都计算现有队列中的数据
            if queue.count > 0 {
                // 取出队列中的所有元素，合起来就是一个原子
                var atom = ""
                let size = queue.count
                for _ in 0..<size {
                    atom += queue.removeFirst()
                }
                if count == 0 {
                    count = 1
                }
                if map[atom] == nil {
                    map[atom] = count
                } else {
                    map[atom]! += count
                }
                count = 0
            }
            if !sub.isEmpty {
                if count == 0 {
                    count = 1
                }
                for (k, v) in sub {
                    if map[k] == nil {
                        map[k] = (v * count)
                    } else {
                        map[k]! += (v * count)
                    }
                }
                count = 0
                sub.removeAll()
            }
            
            if isUpperCase(char) {
                queue.append(str)
            } else if char.asciiValue == 40 { // (
                sub = handleElement()
            } else if char.asciiValue == 41 { // )
                break
            }
        }
        // 兜底
        if queue.count > 0 {
            // 取出队列中的所有元素，合起来就是一个原子
            var atom = ""
            let size = queue.count
            for _ in 0..<size {
                atom += queue.removeFirst()
            }
            if count == 0 {
                count = 1
            }
            if map[atom] == nil {
                map[atom] = count
            } else {
                map[atom]! += count
            }
            count = 0
        }
        if !sub.isEmpty {
            if count == 0 {
                count = 1
            }
            for (k, v) in sub {
                if map[k] == nil {
                    map[k] = (v * count)
                } else {
                    map[k]! += (v * count)
                }
            }
            count = 0
            sub.removeAll()
        }
        return map
    }
}

let s = Solution()
s.countOfAtoms("Mg(OH)2")

