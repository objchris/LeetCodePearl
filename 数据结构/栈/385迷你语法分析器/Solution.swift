/*
385. 迷你语法分析器
https://leetcode-cn.com/problems/mini-parser/
*/
/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */
class Solution {
    func deserialize(_ s: String) -> NestedInteger {
        var arr = Array(s)
        if arr[0] != "[" { return NestedInteger(Int(s)!) }
        var stack = [NestedInteger]()
        var num = 0
        var negative = false
        for i in 0..<arr.count {
            let c = arr[i]
            if c == "-" { 
                negative = true 
            } else if c.isNumber {
                num = num * 10 + Int(String(c))!
            } else if c == "[" {
                stack.append(NestedInteger())
            } else if c == "," || c == "]" {
                if arr[i - 1].isNumber {
                    if negative { num *= -1 }
                    stack.last!.add(NestedInteger(num))
                }
                num = 0
                negative = false
                if c == "]" && stack.count > 1 {
                    let ni = stack.removeLast()
                    stack.last!.add(ni)
                }
            }
        }
        return stack.removeLast()
    }
}
