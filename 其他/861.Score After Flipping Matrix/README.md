# 861. Score After Flipping Matrix

[原题在此](https://leetcode.com/problems/score-after-flipping-matrix/)

简单描述一下题目：

给定一个二维数组，元素都是 1 或 0 ，可以对任一行或列的所有元素进行倒换（1变成0，0变成1），可进行无数次倒换，最后的结果中，每一行当做一个二进制数，所有行相加，求结果中最大的那个数。

Example ：

```
Input: [[0,0,1,1],[1,0,1,0],[1,1,0,0]]
Output: 39
Explanation:
第一轮：
[[1,1,0,0],[1,0,1,0],[1,1,0,0]]
第二轮：
[[1,1,0,1],[1,0,1,1],[1,1,0,1]]
第三轮：
[[1,1,1,1],[1,0,0,1],[1,1,1,1]]
结果：
0b1111 + 0b1001 + 0b1111 = 15 + 9 + 15 = 39
```

### 我的解题思路

#### C++ 🕊（ 0ms, beats 100% ）

代码：

```c++
auto __ = []{
    std::ios::sync_with_stdio(false);
    cin.tie(nullptr);
    return nullptr;
}();

class Solution {
public:
    int matrixScore(vector<vector<int>>& A) {
        // 先看每行的第一个数是否为1，不是则整行进行转换
        for (int i=0; i<A.size(); i++) {
            if(A[i][0] == 0) {
                toggle(A[i]);
            }
        }
        // 从行末往前到第二个数，看0的数量是否大于A.size()/2，进行第二轮转换
        int column = A[0].size();
        for(int j=column-1;j>=1;j--) {
            int zero_count = 0;
            for (int i=0; i<A.size(); i++)
                if(A[i][j] == 0) zero_count++;
            if (zero_count > A.size()/2)
                for (int i=0; i<A.size(); i++)
                    A[i][j] ^= 1;
        }
        // 转换二进制数变成十进制，并加起来赋值给rv
        int rv = 0;
        for (int i=0; i<A.size(); i++) {
            int temp = 1;
            for (int j=0; j<A[i].size(); j++) {
                if(A[i][j]==1) {
                    temp = temp << 1;
                } else {
                    temp = (temp << 1) - 1;
                }
            }
            rv += temp - 1;
        }
        return rv;
    }
private:
    void toggle(vector<int>& A) {
        for (int i=0; i<A.size(); i++) {
            // 1 变 0，0 变 1 。可以用位运算 ^1 来实现。
            A[i] = A[i] ^ 1;
        }
    }
};
```

这题有两个重点：

- **Point One**：

  首先，横着看：对于二进制数，第一位为 1 总是比第一位为 0 ，其他位为 1 的情况大。

  然后，竖着看：从第二列开始，到最后一列，每一列保证 1 的数量比 0 的数量大，就可以了。

  这个没什么好说的。

- **Point Two**：

  给定一个仅有 0 和 1 的数组，怎么计算这个数组转换而来的二进制对应的十进制数是多少？

  可以用 `<<` 来解，有两种方法：

  1. 设立一个初始值 `temp = 1` ，遍历数组，遇到 1 ，则让 `temp` 左移一位， 遇到 0 ，则让 `temp` 先左移，再减去 1 。最后减去初始值 1 就可以了。
  2. 遍历数组，第 i 位是 1 的对应的十进制是 `1 << (n - i - 1)` ，将所有是 1 的位对应的十进制相加就可以了。

参考本题的 Discuss 中的优秀代码时，发现了一份有着同样的算法思路，不一样的但是更简洁巧妙的代码 👑 ，拜服：

```c++
int matrixScore(vector<vector<int>> A) {
    int M = A.size(), N = A[0].size(), res = (1 << (N - 1)) * M;
    for (int j = 1; j < N; j++) {
        int cur = 0;
        for (int i = 0; i < M; i++) cur += A[i][j] == A[i][0];
        res += max(cur, M - cur) * (1 << (N - j - 1));
    }
    return res;
}
```

#### Python3 

和 C++ 一样，Python3 的代码如下：

```PYTHON
class Solution:
    def matrixScore(self, A):
        """
        :type A: List[List[int]]
        :rtype: int
        """
        for index in range(len(A)):
        	if A[index][0] == 0 :
        		A[index] = [0 if x == 1 else 1 for x in A[index]]
        column = len(A[0])
        for j in range(len(A)-1, 0, -1):
        	zero_count = 0
        	for i in range(len(A)):
        		if A[i][j] == 0:
        			zero_count += 1
        	if zero_count > len(A)/2:
        		for i in range(len(A)):
        			A[i][j] ^= 1
        rv = 0
        for i in range(len(A)):
        	temp = 1
        	for j in range(len(A[i])):
        		if A[i][j] == 1:
        			temp = temp <<1
        		else:
        			temp = (temp << 1) - 1
        	rv += temp - 1
        return rv
```

#### Swift

参考 C++ 那份简洁巧妙的方法，看完理解后用 Swift 重新写一遍 ：

```swift
class Solution {
    func matrixScore(_ A: [[Int]]) -> Int {
        let M = A.count, N = A[0].count
        var ans = M * (1 << (N - 1))
        for j in 1..<N {
            var cur = 0
            for i in 0..<M {
                cur += (A[i][j] == A[i][0]) ? 1 : 0
            }
            ans += max(cur, M - cur) * (1 << (N - j - 1))
        }
        return ans
    }
}
```

