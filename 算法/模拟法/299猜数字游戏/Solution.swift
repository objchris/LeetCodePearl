/*
299. 猜数字游戏

https://leetcode-cn.com/problems/bulls-and-cows/
*/
class Solution {
    func getHint(_ secret: String, _ guess: String) -> String {
        var secArr = Array(secret)
    	var gueArr = Array(guess)
    	var a = 0, b = 0
    	var map = [Character: Int]()
    	for i in secArr.indices {
    		if (secArr[i] == gueArr[i]) {
    			a += 1
    			gueArr[i] = Character("*")
    		} else {
    			map[secArr[i], default: 0] += 1
    		}
    	}
    	for i in gueArr.indices where gueArr[i] != "*" {
    		if let count = map[gueArr[i]], count > 0 {
    			b += 1
    			map[gueArr[i]] = count - 1
    		}
    	}
    	return "\(a)A\(b)B"
    }
}
