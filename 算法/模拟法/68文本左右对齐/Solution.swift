/*
 68. 文本左右对齐
 https://leetcode-cn.com/problems/text-justification/
 
 一步步模拟出来即可
 */
class Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var lines = [[String]]()
        var lineWidth = 0
        var line = [String]()
        for word in words {
            let width = word.length
            if lineWidth + width <= maxWidth {
                lineWidth += width + 1
                line.append(word)
            } else {
                lines.append(line)
                line = [word]
                lineWidth = width + 1
            }
        }
        lines.append(line)

        var ans = [String]()
        for i in lines.indices {
            let line = lines[i]
            var width = 0
            for word in line {
                width += word.length
            }
            var n = line.count - 1
            var leftWidth = maxWidth - width
            var mod = n == 0 ? leftWidth : leftWidth % n
            var spaceBaseCount = n == 0 ? 0 : leftWidth / n
            if i == lines.count - 1 {
                mod = 0
                spaceBaseCount = 1
            }
            var lineString = ""
            for j in line.indices {
                lineString += line[j]
                if lineString.length >= maxWidth {
                    break
                }
                for _ in 0..<spaceBaseCount {
                    lineString += " "
                }
                if mod > 0 {
                    lineString += " "
                    mod -= 1
                }
            }
            let bWidth = maxWidth - lineString.length
            if bWidth > 0 {
                for _ in 0 ..< bWidth {
                    lineString += " "
                }
            }
            ans.append(lineString)
        }
        return ans
    }
}
