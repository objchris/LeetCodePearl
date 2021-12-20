/*
475. 供暖器
https://leetcode-cn.com/problems/heaters/

1. 先进行排序
2. 遍历 houses 数组，找到 houses[i] 前后两个 heater ，各自计算其到 house[i] 的距离
3. 取其中的小值
4. 从所有的 house 的结果值中取最大值，即为结果
*/
class Solution {
    func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {
        var houses = houses.sorted()
        var heaters = heaters.sorted()
        let n = heaters.count
        var ans = 0, cur = 0
        for i in houses.indices {
            let house = houses[i]
            while cur < n && heaters[cur] < house { cur += 1 }
            if cur > 0 && cur < n {
                ans = max(ans, min(house - heaters[cur - 1], heaters[cur] - house))
            } else if cur == 0 {
                ans = max(ans, heaters[cur] - house)
            } else {
                ans = max(ans, house - heaters[cur - 1])
            }
        }
        return ans
    }
}
