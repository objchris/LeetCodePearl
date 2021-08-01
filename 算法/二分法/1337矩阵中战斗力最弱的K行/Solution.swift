/*
 1337. 矩阵中战斗力最弱的 K 行
 https://leetcode-cn.com/problems/the-k-weakest-rows-in-a-matrix/
 */
class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {

        var map = [Int: Int]()

        func numberOfOnes(_ arr: [Int]) -> Int {
            guard arr.count > 1 else {
                return 0
            }
            if arr.count == 1 {
                return arr[0]
            }
            var l = 0, r = arr.count - 1
            while l < r {
                let mid = (l + r + 1) >> 1
                if arr[mid] > 0 {
                    l = mid
                } else {
                    r = mid - 1
                }
            }
            return arr[l] == 1 ? l + 1 : l
        }

        for i in mat.indices {
            let nums = numberOfOnes(mat[i])
            map[i] = nums
        }

        let ans = map.keys.sorted().sorted{ map[$0]! < map[$1]! }
        return ans[0..<k].map{ $0 }
    }
}

let s = Solution()
s.kWeakestRows([[1,0],[0,0],[1,0]], 2)
