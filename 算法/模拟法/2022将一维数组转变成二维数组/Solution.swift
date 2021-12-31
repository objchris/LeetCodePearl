/*
2022. 将一维数组转变成二维数组
https://leetcode-cn.com/problems/convert-1d-array-into-2d-array/
*/
class Solution {
    func construct2DArray(_ original: [Int], _ m: Int, _ n: Int) -> [[Int]] {
        guard original.count == m * n else { return [] }
        var ans = [[Int]]()
        for i in 0..<m {
            var row = [Int]()
            for j in 0..<n {
                row.append(original[i * n  + j])
            }
            ans.append(row)
        }
        return ans
    }
}
