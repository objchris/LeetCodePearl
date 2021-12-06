/*
1816. 截断句子
https://leetcode-cn.com/problems/truncate-sentence/
*/
class Solution {
    func truncateSentence(_ s: String, _ k: Int) -> String {
        return s.split(separator: " ")[0..<k].joined(separator: " ")
    }
}
