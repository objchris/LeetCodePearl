from typing import List
import collections

# Definition for a binary tree node.
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution_Recursive:
    def levelOrder(self, root: TreeNode) -> List[List[int]]:
        r = []
        self.lo(r, root, 0)
        return r

    def lo(self, order:List[List[int]] , node: TreeNode, depth: int):
        if node is not None:
            if depth >= len(order):
                order.append([])
            order[depth].append(node.val)
            self.lo(order, node.left,depth+1)
            self.lo(order, node.right,depth+1)


class Solution_Iteratively:
    def levelOrder(self, root: TreeNode) -> List[List[int]]:
        r = []
        if not root:
            return []
        nodes = collections.deque([]) # Queue
        nodes.append(root)
        while nodes:
            arr = []
            size = len(nodes)
            for i in range(0, size):
                temp = nodes.popleft()
                arr.append(temp.val)
                if temp.left:
                    nodes.append(temp.left)
                if temp.right:
                    nodes.append(temp.right)
            r += [arr]
        return r