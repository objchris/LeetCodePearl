/*
 [位运算]1104. 二叉树寻路
 https://leetcode-cn.com/problems/path-in-zigzag-labelled-binary-tree/
 
 1. 先算出没有左右变换的树中，label对应的路径
 2. 对于不同的情况，对相应位置的值进行变换
 */
class Solution {
    func pathInZigZagTree(_ label: Int) -> [Int] {

        var label = label
        var ans = [Int]()
        while label != 0 {
            ans.append(label)
            label /= 2
        }
        ans = ans.reversed()
        let deep = ans.count % 2
        for i in ans.indices {
            if (deep & 1) != (i & 1) {
                continue
            }
            let t = (1 << (i + 1)) - 1 + (1 << i)
            ans[i] = t - ans[i]
        }

        return ans

    }
}
