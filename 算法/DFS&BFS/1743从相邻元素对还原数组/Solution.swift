/*
 1743. 从相邻元素对还原数组
 https://leetcode-cn.com/problems/restore-the-array-from-adjacent-pairs/
 
 分三步：

 遍历数组，使用哈希表 map 将所有点的左右邻居存起来
 找到邻居数组仅有一个元素的点，即为结果数组的端点
 以端点为始，递归执行以下操作：将该点放进 ans ，通过 map 得到左右邻居i，j，若其已经处理过了，跳过，否则，以该邻居为操作点，进入下一步递归
 时间复杂度: O(n)
 空间复杂度: O(n)

 作者：objchris
 链接：https://leetcode-cn.com/problems/restore-the-array-from-adjacent-pairs/solution/swift-shuang-100-by-objchris-fliq/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

class Solution {
    func restoreArray(_ adjacentPairs: [[Int]]) -> [Int] {
        var map = [Int: [Int]]()
        for pair in adjacentPairs {
            map[pair[0], default:[Int]()].append(pair[1])
            map[pair[1], default:[Int]()].append(pair[0])
        }
        var begin = 0;
        for key in map.keys {
            if (map[key]!.count == 1) {
                begin = key
                break
            }
        }

        var done = Set<Int>()
        var ans = [Int]()
        func restore(_ key: Int) {
            ans.append(key)
            done.insert(key)
            let nearbys = map[key]!
            for i in nearbys {
                if (done.contains(i)) {
                    continue
                }
                restore(i)
            }
        }
        restore(begin)

        return ans

    }
}

