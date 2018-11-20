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

s = Solution()
rv = s.matrixScore([[0,1,1,0],[0,0,1,0],[0,1,0,1],[1,1,1,1]])
print(rv)