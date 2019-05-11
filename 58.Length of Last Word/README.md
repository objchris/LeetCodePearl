# 58. Length of Last Word
分类： String

[题目的地址](https://leetcode.com/problems/length-of-last-word/)，简单说一下大意：

使用 `' '` 将字符串分割，返回最后一个字符串的长度。

这道题的难易程度是 EASY 。 基础题

## 解法
基础，就不多说了 🐎
``` python
from typing import List
class Solution:
    def lengthOfLastWord(self, s: str) -> int:
        l = s.split()
        if len(l) == 0 :
            return 0
        return len(l[-1])
```
查看 `Discuss` 时发现更加快速( Faster than 99,20% )的解法，用 `try-except` 方式解决字符串中只有空格字符的情况。🕊
``` python
class Solution:
    def lengthOfLastWord(self, s: str) -> int:
        lis = s.split()
        try:
            return(len(lis[-1]))
        except:
            return 0 
```