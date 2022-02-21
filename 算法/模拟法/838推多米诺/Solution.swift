/*
838. 推多米诺
https://leetcode-cn.com/problems/push-dominoes/

题解：https://leetcode-cn.com/problems/push-dominoes/solution/chriswift-jian-dan-mo-ni-by-objchris-eaz8/
*/
class Solution {
    func pushDominoes(_ dominoes: String) -> String {
        var arr = Array(dominoes)
        var mark = 0
        for i in arr.indices {
            let c = arr[i]
            if arr[mark] == "." {
                if c == "." { continue } // . -> . 
                else if c == "L" {  // . -> L : 设置arr[mark...i] = L
                    for j in mark..<i { 
                        arr[j] = "L"
                    }
                }
                mark = i // mark 前进一步
            } else if arr[mark] == "L" {
                mark = i // mark 前进一步
            } else { 
                if c == "R" { // R -> R ：mark 前进一步
                    mark = i
                    continue
                }
                if c == "." { // R -> . : 将当前位置设置为 R
                    arr[i] = "R"
                    continue
                }
                var l = mark, r = i
                while l < r { // R -> L  : 双指针夹逼赋值L和R
                    arr[l] = "R"
                    l += 1
                    arr[r] = "L"
                    r -= 1
                }
                if l == r { // 最中间的因为两端受力，所以不会倒下
                    arr[l] = "."
                }
                mark = i
            }
        }
        return String(arr)
    }
}
