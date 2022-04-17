/*
819. 最常见的单词
https://leetcode-cn.com/problems/most-common-word/
*/
class Solution {
    let symbols: [Character] = ["!", "?", "'", ",", ";", ".", " "]

    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
        paragraph.lowercased()
            .split{ symbols.contains($0) }
            .map{ String($0) }
            .filter{ !banned.contains($0) }
            .reduce(into: [String: Int]()) { $0[$1, default: 0] += 1 }
            .sorted { $0.1 > $1.1 }
            .first!
            .key
    }
}
