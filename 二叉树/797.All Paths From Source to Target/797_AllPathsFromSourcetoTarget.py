"""
Example:
Input: [[1,2], [3], [3], []] 
Output: [[0,1,3],[0,2,3]] 
Explanation: The graph looks like this:
0--->1
|    |
v    v
2--->3
There are two paths: 0 -> 1 -> 3 and 0 -> 2 -> 3.

DFS

"""
class Solution:
    def allPathsSourceTarget(self, graph):
        """
        :type graph: List[List[int]]
        :rtype: List[List[int]]
        """
        ans = []
        def dfs(current, path):
        	if current==len(graph)-1:
        		ans.append(path)
        	else:
        		for i in graph[current]: 
        			dfs(i, path + [i])
        dfs(0, [0])
        return ans