# 二叉树
二叉树遍历方式：前序遍历、中序遍历、后序遍历
对于二叉搜索树而言，中序遍历之后就是 sorted array
后序遍历对于删除操作很有作用，因为在删除节点时，需要先删除它的左节点和右节点。
还有就是将数学表达式转换成二叉树的形式进行计算：
![mathematical_expression](Photos/mathematical_expression.png)
使用中序遍历可以输出表达式：4 * 7 - 2 + 5 ，但是计算的优先级已经没有了
使用后序遍历就保留了计算优先级： ( ( 4 ( 7 2 + )  * )  5 + ) 

以下展示三种遍历的代码：
代码中使用到的树节点的结构如下：

``` python
# Definition for a binary tree node.
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
```
## 前序遍历
### 递归方式
``` python
class Solution_Recursive:
    def preorderTraversal(self, root: TreeNode) -> List[int]:
        r = []
        if root is None or root.val is None:
            return r
        r = [root.val]
        if root.left is not None:
            r += self.preorderTraversal(root.left)
        if root.right is not None:
            r += self.preorderTraversal(root.right)
        return r
```
### 循环方式
循环的方式需要使用到栈，若有右节点，将右节点压入栈中，当左节点为 `null` 时，从栈中取出右节点继续遍历。
``` python
class Solution_Iteratively:
    def preorderTraversal(self, root: TreeNode) -> List[int]:
        r = []
        nodes = [] # stack 
        while root or nodes:
            if not root:
                root = nodes.pop()
            r += [root.val]
            if root.right:
                nodes.append(root.right)
            root = root.left
        return r
```
见  [LeetCode.144. Binary Tree Preorder Traversal](https://leetcode.com/problems/binary-tree-preorder-traversal/)
## 中序遍历
### 递归方式
``` python
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
```
没什么好说的，跟前序遍历一样，只是 `r += [root.val]` 的位置不同而已。
### 循环方式
中序遍历的循环方式相对复杂些：
0. 添加变量 `nodes` 用作栈。 
1. 判断当前节点是否为 `null` ，是则将当前节点入栈，进入左节点，直至左节点为 `null` ，进入第 2 步。
2. 从栈中取出节点，将节点的值添加到结果中。
3. 进入右节点，重新到第 1 步循环。
``` python
class Solution_Iteratively:
    def inorderTraversal(self, root: TreeNode) -> List[int]:
        r = []
        nodes = []
        while root or nodes:
            if root:
                nodes.append(root)
                root = root.left
                continue
            root = nodes.pop()
            r += [root.val]
            root = root.right
        return r
```
见[LeetCode.94.Binary Tree Inorder Traversal - LeetCode](https://leetcode.com/problems/binary-tree-inorder-traversal/)
## 后序遍历
### 递归方式
``` python
class Solution_Recursive:
    def inorderTraversal(self, root: TreeNode) -> List[int]:
        r = []
        if root is None or root.val is None:
            return r
        if root.left is not None:
            r += self.inorderTraversal(root.left)
        if root.right is not None:
            r += self.inorderTraversal(root.right)
        r += [root.val]
        return r
```
### 循环方式
``` python
class Solution_Iteratively:
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
```
方法二：
``` python
class Solution_Iteratively:
    def postorderTraversal(self, root: TreeNode) -> List[int]:
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
```
见 [LeetCode.145.Binary Tree Postorder Traversal - LeetCode](https://leetcode.com/problems/binary-tree-postorder-traversal/)

