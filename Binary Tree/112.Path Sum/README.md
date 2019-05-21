# 102. Path Sum

分类： Binary Tree

难易程度： Easy 

[题目地址](https://leetcode.com/problems/path-sum/)

题目大意如下：给定一棵二叉树，判断是否存在从根节点到叶子节点的路径，所有树相加等于 `sum` ，如：

Example 1：
``` 
sum = 22
      5
     / \
    4   8
   /   / \
  11  13  4
 /  \      \
7    2      1
```
返回 True ，路径 `5->4->11->2` 满足题干要求


## 思路
从根节点开始，深度遍历每一条路径，当遍历到叶子节点时，所有数相加的和等于 `sum` ，说明已经找到了。

用递归就可以了， `Top-down` 的方式：

Python3 代码如下： 🕊
``` python
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
            return r == sum
        return self.hasPathSumR(node.left, r, sum) or self.hasPathSumR(node.right, r, sum)
```

## 注意几个用例
Test Case 1
```
[5,4,8,11,null,13,4,7,2,null,null,null,1]
22
# 5->4->11->2 True
```
这个是常规用例，可以大致知道解法是否正确。

Test Case 2
```
[1,2]
1
# False
```
在非叶子节点时就已经与 `sum` 相同了，此时不能算一条合适的路径。

Test Case 3
```
[-2, null, -3]
-5
# -2->-3 True
```
我在解题是自作聪明了一下，在 
``` python
return self.hasPathSumR(node.left, r, sum) or self.hasPathSumR(node.right, r, sum)
``` 
之前加了一个判断：
``` python
if r > num :
    return False
```
没考虑到还有负数的存在 :[

Test Case 4
```
[]
0
# False
```
有这个测试用例，我们就需要在递归之前先判断根节点是否为空
``` python
if not root :
    return False
```