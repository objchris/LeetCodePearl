/*
 5969. 摧毁小行星
 https://leetcode-cn.com/problems/destroying-asteroids/
 */
class Solution {
    func asteroidsDestroyed(_ mass: Int, _ asteroids: [Int]) -> Bool {
        var sorted = asteroids.sorted()
        var mass = mass
        for i in sorted {
            if mass >= i { mass += i }
            else { return false }
        }
        return true
    }
}
