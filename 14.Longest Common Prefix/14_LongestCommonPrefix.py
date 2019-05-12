from typing import List
class Solution_Horizontal_Scanning:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        if len(strs) == 0:
            return ""
        prefix = strs[0]
        for s in strs:
            while not s.startswith(prefix):
                prefix = prefix[:-1]
                if prefix == "" :
                    return ""
        return prefix

class Solution_Vertical_Scanning:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        if len(strs) == 0:
            return ""
        for i in range(0, len(strs[0])):
            c = strs[0][i]
            for j in range(1, len(strs)):
                if i == len(strs[j]) or c != strs[j][i]:
                    return strs[0][:i]

class Solutio_Divide_And_Conquer:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        if len(strs) == 0:
            return ""
        return self.longestCommonPrefixA(strs, 0, len(strs) - 1)

    def longestCommonPrefixA(self, strs: List[str], start:int, end:int) -> str:
        if start == end:
            return strs[start]
        mid = int((start + end) / 2)
        prefix_l = self.longestCommonPrefixA(strs, start, mid)
        prefix_r = self.longestCommonPrefixA(strs, mid+1, end)
        return self.commonPrefix(prefix_l, prefix_r)
        
    def commonPrefix(self, left: str, right: str) -> str:
        l = min(len(left), len(right))
        for i in range(0, l):
            if left[i] != right[i]:
                return left[:i]
        return left[:l]


s = Solutio_Divide_And_Conquer()
r = s.longestCommonPrefix(["pre", "pr", "prefix"])
print(r)