//
// Created by Chris Cheung.
//
/* 797. All Paths From Source to Target
 * Example:
 * Input: [[1,2], [3], [3], []]
 * Output: [[0,1,3],[0,2,3]]
 * Explanation: The graph looks like this:
 * 0--->1
 * |    |
 * v    v
 * 2--->3
 * There are two paths: 0 -> 1 -> 3 and 0 -> 2 -> 3.
 */

#include <iostream>
#include <vector>
using namespace std;

class Solution {
public:
    vector<vector<int>> allPathsSourceTarget(vector<vector<int>>& graph) {
        vector<vector<int>> ans;
        dfs(0, graph, ans, {});
        return ans;
    }

    void dfs(int current, vector<vector<int>>& graph, vector<vector<int>>& ans, vector<int> path) {
        path.push_back(current);
        if (current == graph.size() - 1) {
            ans.push_back(path);
        } else {
            for (int i : graph[current]) {
                dfs(i, graph, ans, path);
            }
        }
    }
};