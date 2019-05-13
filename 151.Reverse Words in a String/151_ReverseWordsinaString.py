class Solution:
    def reverseWords(self, s: str) -> str:
        return " ".join(s.split()[::-1])

s = Solution()
r = s.reverseWords("the sky is blue")
print(r)

r = s.reverseWords("  hello world!  ")
print(r)

r = s.reverseWords("a good   example")
print(r)