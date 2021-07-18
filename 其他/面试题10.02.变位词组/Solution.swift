/*
 面试题 10.02. 变位词组
 https://leetcode-cn.com/problems/group-anagrams-lcci/
 
 本题考查的是如何将字符串转换成唯一的序列Key，然后用hash表记录，问题在于怎么求Key
 一开始使用的是将字符的ascii码做位运算，相加得到Key，这种方法存在问题：
 如 tit 和 huh 计算得到的值相同。
 
 第二种是将字符排序，作为Key
 
 第三种则是计算每个字符的个数，拼接成诸如：
 a0b0c0d0e0f0g0h0i0j0k0l0m0n1o1p0q0r1s0t0u0v0w0x0y0z0
 的字符串作为Key
 
 */

class Solution {
    func groupAnagrams_WA(_ strs: [String]) -> [[String]] {

        var map = [Int: [String]]()
        for s in strs {
            var i = 0
            for c in s {
                i += Int(c.asciiValue!) - 97
            }
            map[i, default:[]].append(s)
        }
        return Array(map.values)
        
    }
    
    func groupAnagrams_sort(_ strs: [String]) -> [[String]] {

        var map = [String: [String]]()
        for s in strs {
            let key = String(s.sorted())
            map[key, default:[]].append(s)
        }
        return Array(map.values)
        
    }
    
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        
        var map = [String: [String]]()
        for s in strs {
            let a = Int(Character("a").asciiValue!)
            var freq = [Int](repeating: 0, count: 26)
            for c in s {
                freq[Int(c.asciiValue!) - a] += 1
            }
            var key = ""
            for i in freq.indices {
                key += "\(Character(UnicodeScalar(i + a)!))\(freq[i])"
            }
            map[key, default:[]].append(s)
        }
        return Array(map.values)
        
    }
    
}

let s = Solution()
s.groupAnagrams(["ron","huh","gay","tow","moe","tie","who","ion","rep","bob","gte","lee","jay","may","wyo","bay","woe","lip","tit","apt","doe","hot","dis","fop","low","bop","apt","dun","ben","paw","ere","bad","ill","fla","mop","tut","sol","peg","pop","les"])

