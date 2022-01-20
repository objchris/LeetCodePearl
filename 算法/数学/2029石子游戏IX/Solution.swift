/*
2029. 石子游戏 IX
https://leetcode-cn.com/problems/stone-game-ix/
*/
class Solution {
    func stoneGameIX(_ stones: [Int]) -> Bool {
        var arr = [Int](repeating: 0, count: 3)
        for s in stones {
            arr[s % 3] += 1
        }
        if (arr[0] % 2 == 0) {
            return arr[1] >= 1 && arr[2] >= 1;
        }
        return arr[1] - arr[2] > 2 || arr[2] - arr[1] > 2;
    }
}
