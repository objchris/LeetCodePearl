/*
 5871. 将一维数组转变成二维数组
 https://leetcode-cn.com/problems/convert-1d-array-into-2d-array/
 */
class Solution {
    func construct2DArray(_ original: [Int], _ m: Int, _ n: Int) -> [[Int]] {
        guard m * n == original.count else {
            return []
        }
        var ans = [[Int]]()
        for i in 0..<m {
            let temp = Array(original[i * n...i * n + n - 1])
            ans.append(temp)
        }
        return ans
    }
}
