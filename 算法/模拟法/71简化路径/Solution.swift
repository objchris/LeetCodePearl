/*
71. 简化路径
https://leetcode-cn.com/problems/simplify-path/

使用 Array 当栈。

1. 使用 / 将字符串进行分割，再用 map 或 compactMap 转成 String ，便于比较
2. 创建数组，保存结果，遍历得到的数组，有三种情况：
  a. "." : 当前位置，跳过
  b. ".." : 当前位置的上一个位置，删除结果数组的最后一个元素
  c. 其他 : 保存到结果数组
3. 组合成字符串返回

*/
class Solution {
    func simplifyPath(_ path: String) -> String {
        var components = path.split(separator: "/").compactMap { String($0) }
        var ans = [String]()
        for c in components {
            if c == "." { continue }
            else if c == ".." { ans.popLast() }
            else { ans.append(c) }
        }
        return "/\(ans.joined(separator: "/"))"
    }
}
