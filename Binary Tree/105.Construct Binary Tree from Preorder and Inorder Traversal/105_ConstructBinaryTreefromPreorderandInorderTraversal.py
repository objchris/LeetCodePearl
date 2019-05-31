from typing import List
import collections

# Definition for a binary tree node.
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution:
    def buildTree(self, preorder: List[int], inorder: List[int]) -> TreeNode:
        if not preorder:
            return None
        map_in = {v:i for i,v in enumerate(inorder)}
        preorder_queue = collections.deque(preorder)
        def recursive(start:int, end:int) -> TreeNode:
            if start > end:
                return None
            mid = TreeNode(preorder_queue.popleft())
            midIndex = map_in[mid.val]
            mid.left = recursive(start, midIndex-1)
            mid.right = recursive(midIndex+1, end)
            return mid
        return recursive(0, len(preorder) - 1)

