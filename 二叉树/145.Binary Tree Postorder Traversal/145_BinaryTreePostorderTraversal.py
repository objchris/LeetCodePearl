from typing import List

class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

"""
class Solution(object):
    def postorderTraversal(self, root):
        ""
        :type root: TreeNode
        :rtype: List[int]
        ""
        rst = []
        stack = []
        while root or stack:
            if root:
                rst.insert(0, root.val)
                stack.append(root)
                root = root.right
            else:
                root = stack.pop().left
        return rst
"""

class Solution:
    def postorderTraversal(self, root: TreeNode) -> List[int]:
        r = []
        nodes = [] # Stack
        last = None
        while root or nodes:
            if root:
                nodes.append(root)
                root = root.left
                continue
            peek = nodes[-1]
            if not peek.right or last == peek.right:
                nodes.pop()
                r += [peek.val]
                last = peek
                root = None
            else:
                root = peek.right

        return r



f = TreeNode(1)
f.right = TreeNode(2)
f.right.left = TreeNode(3)
s = Solution()
r = s.postorderTraversal(f)
print(r)        
