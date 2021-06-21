import collections

# Definition for a binary tree node.
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution_Recursive:
    def isSymmetric(self, root: TreeNode) -> bool:
        if not root:
            return True
        return self.isSymmetricR(root.left, root.right)
        
    def isSymmetricR(self, left: TreeNode, right: TreeNode) -> bool:
        if not left and not right:
            return True
        if not left or not right:
            return False
        return left.val == right.val and self.isSymmetricR(left.left, right.right) and self.isSymmetricR(left.right, right.left)


class Solution_Iterative:
    def isSymmetric(self, root: TreeNode) -> bool:
        nodes = collections.deque([])
        nodes.append(root)
        nodes.append(root)
        while nodes:
            n1 = nodes.popleft()
            n2 = nodes.popleft()
            if not n1 and not n2 :
                continue
            if not n1 or not n2:
                return False
            if n1.val != n2.val:
                return False
            nodes.append(n1.left)
            nodes.append(n2.right)
            nodes.append(n1.right)
            nodes.append(n2.left)
        return True
