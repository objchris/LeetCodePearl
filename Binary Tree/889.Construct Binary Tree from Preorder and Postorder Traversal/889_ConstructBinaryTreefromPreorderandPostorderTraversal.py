from typing import List

# Definition for a binary tree node.
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution:
    def constructFromPrePost(self, pre: List[int], post: List[int]) -> TreeNode:
        def recursive(l:int, r:int, N:int) -> TreeNode:
            if N == 0:
                return None
            root = TreeNode(pre[l])
            if N == 1:
                return root

            for L in range(N):
                if post[r + L - 1] == pre[l + 1]:
                    break

            root.left = recursive(l+1, r, L)
            root.right = recursive(l+1+L, r+L , N-1-L)
            return root
        return recursive(0, 0, len(pre))