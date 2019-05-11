from typing import List
class Solution:
    def lengthOfLastWord(self, s: str) -> int:
        lis = s.split()
        try:
            return(len(lis[-1]))
        except:
            return 0 

s = Solution()
r = s.lengthOfLastWord("HELLO WORLD1")
print(r)

s = Solution()
r = s.lengthOfLastWord("HELLO ")
print(r)

s = Solution()
r = s.lengthOfLastWord("HELLO")
print(r)

s = Solution()
r = s.lengthOfLastWord("HELLO  ")
print(r)

s = Solution()
r = s.lengthOfLastWord("  ")
print(r)