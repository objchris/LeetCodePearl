from typing import List

class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution_Recursive:
    def preorderTraversal(self, root: TreeNode) -> List[int]:
        r = []
        if root == None or root.val == None:
            return r
        r = [root.val]
        if root.left != None:
            r += self.preorderTraversal(root.left)
        if root.right != None:
            r += self.preorderTraversal(root.right)
        return r

class Solution_Iteratively:
    def preorderTraversal(self, root: TreeNode) -> List[int]:
        r = []
        nodes = [] # stack 
        while True:
            if root is None:
                if len(nodes) == 0:
                    break
                else:
                    root = nodes.pop()
            r += [root.val]

            if root.right is not None:
                nodes.append(root.right)
            
            root = root.left
        return r
