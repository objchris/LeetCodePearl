/*
 5870. 每棵子树内缺失的最小基因值
 https://leetcode-cn.com/problems/smallest-missing-genetic-value-in-each-subtree/
 
 使用两次DFS求解，此题在打周赛时做不出来，题解参看大佬的解析：
 https://leetcode-cn.com/problems/smallest-missing-genetic-value-in-each-subtree/solution/dfs-liang-bian-dfs-de-xian-xing-zuo-fa-d-s5dd/
 
 */
class Solution {

    var e = [[Int]](repeating: [Int](), count: 100010)
    var nums: [Int]!
    var ans: [Int]!

    var now = 1
    var has1 = [Bool](repeating: false, count: 100010)
    var vis = [Bool](repeating: false, count: 100010)

    // DFS子树，计算当前节点为根结点的子树是否包含1
    func dfs1(_ sn: Int) {
        has1[sn] = nums[sn] == 1
        for fn in e[sn] {
            dfs1(fn)
            has1[sn] = has1[sn] || has1[fn]
        }
        if (!has1[sn]) {
            ans[sn] = 1
        }
    }

    // 每个人的基因值都唯一，所以子树与子树之间是隔离开的
    func dfs2(_ sn: Int) {
        if !has1[sn] {
            return
        }
        for fn in e[sn] {
            if has1[fn] {
                dfs2(fn)
            }
        }
        for fn in e[sn] {
            if !has1[fn] {
                dfs3(fn)
            }
        }
        vis[nums[sn]] = true
        while vis[now] == true {
            now += 1
        }
        ans[sn] = now
    }

    func dfs3(_ sn: Int) {
        for fn in e[sn] {
            dfs3(fn)
        }
        vis[nums[sn]] = true
    }

    func smallestMissingValueSubtree(_ parents: [Int], _ ns: [Int]) -> [Int] {
        ans = [Int](repeating: 0, count: parents.count)
        nums = ns
        for i in 1..<parents.count {
            e[parents[i]].append(i)
        }
        dfs1(0)
        dfs2(0)
        return ans
    }
}
