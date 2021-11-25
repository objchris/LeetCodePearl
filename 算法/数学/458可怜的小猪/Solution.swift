/*
458. 可怜的小猪
https://leetcode-cn.com/problems/poor-pigs/

脑筋急转弯题，参考题解：
https://leetcode-cn.com/problems/poor-pigs/solution/liang-xing-dai-ma-chao-yue-100-xiang-xi-80gwg/
*/
class Solution {
    func poorPigs(_ buckets: Int, _ minutesToDie: Int, _ minutesToTest: Int) -> Int {
        let k = minutesToTest / minutesToDie
        return Int(ceil(log(Double(buckets)) / log(Double(k + 1)))) 
    }
}
