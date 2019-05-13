# 151. Reverse Words in a String
分类： String

[题目的地址](https://leetcode.com/problems/reverse-words-in-a-string/)，简单说一下大意：

给定一个有多个单词，用不等量个空格分隔开的字符串，将其中的单词倒序，组成一个新的字符串。

Example 1
```
Input: "the sky is blue"
Output: "blue is sky the"
```

Example 2
```
Input: "  hello world!  "
Output: "world! hello"
注意前后的空格
```

Example 3
```
Input: "a good   example"
Output: "example good a"
注意中间的空格
```

这道题的难易程度是 MEDIUM

## 解决方法

代码如下（Python）：
``` python
class Solution:
    def reverseWords(self, s: str) -> str:
        return " ".join(s.split()[::-1])
```
一行 Python 解决问题，还挺快的。🕊
![python](Photos/151_Python.png)
时间复杂度和空间复杂度都是 `O(n)` 。

这一题的难度是中等，但似乎并不是那么难..

