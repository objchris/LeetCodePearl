/*
388. 文件的最长绝对路径
https://leetcode-cn.com/problems/longest-absolute-file-path/

1. 使用栈存储文件（夹）
2. 通过计算 \t 的数量确定层级，根据层级进行弹栈
3. 每遍历完一个文件（夹），入栈
4. 若遇到文件，则使用栈中元素计算最大路径长度

*/
class Solution {
    func lengthLongestPath(_ input: String) -> Int {
        let arr = Array(input)
        var stack = [String]()  // 按层级存放文件或文件夹
        var length = 0, i = 0   // length：不包含 / 的路径长度， i：索引
        var ans = 0
        while i < arr.count {
            let c = arr[i]
            if c == "\n" {  // 忽略 \n
                i += 1
                continue
            }
            var level = 0
            while i < arr.count && arr[i] == "\t" { level += 1; i += 1 }  // 计算当前文件（夹）的层级
            while stack.count > 0 && level < stack.count {  // 若小于栈中存储的文件（夹）数量，证明当前层级更高，需要弹栈
                if let str = stack.popLast() {
                    length -= str.count  // 减去弹栈的文件(夹)名称长度
                }
            }
            var str = "", isFile = false
            while i < arr.count && (arr[i].isLetter || arr[i].isNumber || arr[i] == " " || arr[i] == ".") {
                if arr[i] == "." { isFile = true }  // 包含"."，则为文件
                str += String(arr[i])
                length += 1 // 路径长度 + 1
                i += 1
            }
            stack.append(str) // 将当前文件（夹）名称入栈
            if isFile {
                ans = max(ans, length + stack.count - 1) // （栈中元素的数量 - 1）代表需要多少个 / 
            }
        }
        return ans
    }
}
