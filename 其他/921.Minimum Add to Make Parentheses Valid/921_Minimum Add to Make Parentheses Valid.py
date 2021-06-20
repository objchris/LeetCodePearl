class Solution(object):
    def minAddToMakeValid(self, S):
        """
            :type S: str
            :rtype: int
            """
        
        while "()" in S:
            S = S.replace("()", "")
        
        return len(S)
