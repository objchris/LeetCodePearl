/*
1305. 两棵二叉搜索树中的所有元素
https://leetcode-cn.com/problems/all-elements-in-two-binary-search-trees/

中序遍历 + 归并排序
*/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {

    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        var ans = [Int]()
        var list1 = [Int](), list2 = [Int]()
        tranverse(root1, &list1)
        tranverse(root2, &list2)
        var i = 0, j = 0
        while i < list1.count || j < list2.count {
            if i >= list1.count { 
                ans.append(list2[j]) 
                j += 1
                continue
            } else if j >= list2.count {
                ans.append(list1[i])
                i += 1
                continue
            } else if list1[i] < list2[j] {
                ans.append(list1[i])
                i += 1
            } else {
                ans.append(list2[j])
                j += 1
            }
        }
        return ans
    }

    func tranverse(_ node: TreeNode?, _ list: inout [Int]) {
        guard let node = node else { return }
        tranverse(node.left, &list)
        list.append(node.val)
        tranverse(node.right, &list)
    }
    
}
