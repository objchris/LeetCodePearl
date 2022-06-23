/*
30. 串联所有单词的子串
https://leetcode.cn/problems/substring-with-concatenation-of-all-words/
*/
fileprivate class WordsMaps {
    typealias Word = String
    
    var maps: [Word: Int]
    
    init(_ words: [String] = []) {
        self.maps = [:]
        for word in words {
            self.push(word)
        }
    }
    
    convenience init(_ s: String, _ len: Int) {
        var words: [String] = []
        for i in stride(from: 0, to: s.count, by: len) {
            let begin = s.index(s.startIndex, offsetBy: i)
            let end = s.index(begin, offsetBy: len)
            let word = String(s[begin..<end])
            words.append(word)
        }
        self.init(words)
    }
    
    func push(_ word: String) {
        let count = maps[word] ?? 0
        maps[word] = count + 1
    }
    
    func pop(_ word: String, count: Int = 1) {
        if let num = maps[word] {
            if num <= count {
                maps.removeValue(forKey: word)
            } else {
                maps[word] = num - count
            }
        }
    }
}

extension WordsMaps: Equatable {
    static func == (lhs: WordsMaps, rhs: WordsMaps) -> Bool {
        lhs.maps == rhs.maps
    }
}

class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        if words.isEmpty { return [] }
        let len = words[0].count
        let n = len * words.count
        if s.count < n { return [] }
        var res: [Int] = []
        let maps: WordsMaps = WordsMaps(words)
        for i in  0..<len {
            var tempMaps: WordsMaps!
            for j in stride(from: i, through: s.count - n, by: len) {
                let begin = s.index(s.startIndex, offsetBy: j)
                let end = s.index(begin, offsetBy: n)
                let str = String(s[begin..<end])
                if tempMaps == nil {
                    tempMaps = WordsMaps(str, len)
                } else {
                    tempMaps.pop((s as NSString).substring(with: NSMakeRange(j - len, len)))
                    tempMaps.push((s as NSString).substring(with: NSMakeRange(j + n - len, len)))
                }
                if tempMaps == maps {
                    res.append(j)
                }
            }
        }
        return res.sorted()
    }

}
