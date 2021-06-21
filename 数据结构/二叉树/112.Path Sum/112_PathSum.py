# Definition for a binary tree node.
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution:
    def hasPathSum(self, root: TreeNode, sum: int) -> bool:
        if not root :
            return False
        return self.hasPathSumR(root, 0, sum)
        
    def hasPathSumR(self, node: TreeNode, r:int, sum:int) -> bool:
        if not node:
            return False
        r += node.val
        if not node.left and not node.right:
            return True if r == sum else False
        return True if self.hasPathSumR(node.left, r, sum) or self.hasPathSumR(node.right, r, sum) else False