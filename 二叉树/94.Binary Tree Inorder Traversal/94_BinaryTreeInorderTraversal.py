from typing import List

class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution_Recursive:
    def inorderTraversal(self, root: TreeNode) -> List[int]:
        r = []
        if root is None or root.val is None:
            return r
        if root.left is not None:
            r += self.inorderTraversal(root.left)
        r += [root.val]
        if root.right is not None:
            r += self.inorderTraversal(root.right)
        return r


class Solution_Iteratively:
    def inorderTraversal(self, root: TreeNode) -> List[int]:
        r = []
        nodes = []
        while root is not None or len(nodes) != 0:
            if root is not None:
                nodes.append(root)
                root = root.left
                continue
            root = nodes.pop()
            r += [root.val]
            root = root.right
        return r

f = TreeNode(1)
f.right = TreeNode(2)
f.right.left = TreeNode(3)
s = Solution_Iteratively()
r = s.inorderTraversal(f)
print(r)        

            

