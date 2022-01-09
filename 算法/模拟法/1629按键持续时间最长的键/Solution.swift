/*
1629. 按键持续时间最长的键
https://leetcode-cn.com/problems/slowest-key/
*/
class Solution {
    func slowestKey(_ releaseTimes: [Int], _ keysPressed: String) -> Character {
        var times = [Int](repeating: 0, count: 26)
        let n = keysPressed.count
        let arr = Array(keysPressed)
        let b = Character("a").asciiValue!
        times[Int(arr[0].asciiValue! - b)] = releaseTimes[0]
        var maxV = releaseTimes[0]
        for i in 1..<n {
            let idx = Int(arr[i].asciiValue! - b)
            times[idx] = max(times[idx], releaseTimes[i] - releaseTimes[i - 1])
            maxV = max(maxV, times[idx])
        }
        for i in (0..<26).reversed() {
            if times[i] == maxV {
                return Character(UnicodeScalar(Int(b) + i)!)
            }
        }
        return "a"
    }
}
