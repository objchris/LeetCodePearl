from typing import List
# Definition for a binary tree node.
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution_1:
    def buildTree(self, inorder: List[int], postorder: List[int]) -> TreeNode:
        if not inorder:
            return None
        mid = postorder[-1]
        midIndex = inorder.index(mid)
        root = TreeNode(mid)
        if midIndex > 0:
            root.left = self.buildTree(inorder[0:midIndex], postorder[0:midIndex])
        if midIndex < len(inorder)-1:
            root.right = self.buildTree(inorder[midIndex+1:len(inorder)], postorder[midIndex:-1])
        return root


class Solution_2:
    def buildTree(self, inorder: List[int], postorder: List[int]) -> TreeNode:
        if not inorder:
            return None
        map_in = {v:i for i,v in enumerate(inorder)}
        def recursive(start:int, end:int) -> TreeNode:
            if start > end:
                return None
            node = TreeNode(postorder.pop())
            midIndex = map_in[node.val]
            node.right = recursive(midIndex + 1, end)
            node.left = recursive(start, midIndex - 1)
            return node
        return recursive(0, len(postorder) - 1)
