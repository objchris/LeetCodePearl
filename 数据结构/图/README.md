# 图

## 存图方式
有时候，我们拿到的数据不是一个图，而是相互间有联系的一堆数据，我们需要将拿到的数据转换成图，再使用图算法进行计算。存图的方式有如下几种：
### 邻接矩阵
使用二维矩阵进行存图。适用于稠密图（边数量接近点的数量的平方）
``` swift
let N = 1000 // 已知的节点数
var graph = [[Int]](repeating: [Int]{repeating: 0, count: N), count: N)

func add(_ a: Int, _ b: Int, _ w: Int) {
    graph[a][b] = w // 代表从 a 到 b 有权重为 w 的边
}
```

### 邻接表
这也是一种在图论中十分常见的存图方式，与数组存储单链表的实现一致（头插法）。适用于稀疏图。     
这种存图方式又叫 **链式前向星存图**。
``` swift
let N = 1000 // 已知的节点数
let M = 1000 // 已知的边数量

var he = [Int](repeating: -1, count: N)
var e  = [Int](repeating: 0, count: M)
var ne = [Int](repeating: 0, count: M)
var w  = [Int](repeating: 0, count: M)

var idx = 0

func add(_ a: Int, _ b: Int, w: Int) {
    e[idx]  = b
    ne[idx] = he[a]
    he[a]   = idx
    w[idx]  = w
    idx     += 1
}
```
首先 `idx` 是用来对 **边** 进行编号的，然后对存图用到的几个数组作简单解释：

- `he` 数组：存储是某个节点所对应的 **边的集合（链表）** 的头结点；(head)
- `e`  数组：由于访问某一条边指向的节点；(end)
- `ne` 数组：由于是以链表的形式进行存边，该数组就是用于找到下一条边；(next)
- `w`  数组：用于记录某条边的权重为多少。(weight)

因此当我们想要遍历所有由 `a` 点发出的边时，可以使用如下方式：
``` swift
var i = he[a]
while i != -1 {
    let b = e[i]  // a 指向 b
    let w = w[i]  // 边的权重为 w
    i = ne[i]
}
```

## 图算法
### dijkstra
dijkstra 适用于加权图中前往 X 点的最短路径。**只适用于有向无环且没有负权边的图**。      
dijkstra 的思路如下：
1. 判断是否还有要处理的节点
2. 获取离终点最短距离的点
3. 更新其邻居「离终点的距离」
4. 将该节点标记为处理过，回到第一步

[例子 - 743.网络延迟时间](https://github.com/objchris/LeetCodePearl/blob/master/数据结构/图/743网络延迟时间/Solution.swift)

``` swift
let N = 1000 // 最大节点数
let n = 50   // 已知数据节点数

var graph = [[Int]](repeating: [Int](repeating: , count: N), count: N) // 邻接矩阵存图
var dist  = [Int](repeating: 0, count: N)
var vis   = [Bool](repeating: false, count: N)

func dijkstra(_ start: Int) {
    dist[start] = 0
    for _ in 0..<n {    
        // 每次都会遍历一个点，所以共需要遍历 n 次
        var t = -1
        for i in 0..<n where !vis[i] {
            // 每次找「未遍历过」且「最短距离最小」的点
            if t == -1 || dist[t] < dist[i] { t = i }
        }
        // 标记为已遍历
        vis[t] = true
        for i in 0..<n {
            // 用点 t 的「最小距离」更新其他点
            dist[i] = min(dist[i], dist[t] + graph[t][i])
        }
    }
}
```

## 参考
1.[【最短路/必背模板】涵盖所有的「存图方式」与「最短路算法（详尽注释）」](https://mp.weixin.qq.com/s?__biz=MzU4NDE3MTEyMA==&mid=2247488007&idx=1&sn=9d0dcfdf475168d26a5a4bd6fcd3505d&chksm=fd9cb918caeb300e1c8844583db5c5318a89e60d8d552747ff8c2256910d32acd9013c93058f&mpshare=1&scene=23&srcid=0311tjKy74JijYzXhHo8Qob7&sharer_sharetime=1646964421353&sharer_shareid=1221771780968b30ef07c3f22cd356ed%23rd)
