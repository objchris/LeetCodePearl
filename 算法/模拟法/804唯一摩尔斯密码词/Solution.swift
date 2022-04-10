/*
804. 唯一摩尔斯密码词
https://leetcode-cn.com/problems/unique-morse-code-words/
*/
class Solution {

    let morse = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
    let a = Character("a").asciiValue!

    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        func toMorse(_ s: String) -> String {
            var ret = ""
            for c in s {
                ret += morse[Int(c.asciiValue! - a)]
            }
            return ret
        }
        return Set(words.map{ toMorse($0) }).count
    }
    
}
