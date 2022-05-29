/*
468. 验证IP地址
https://leetcode.cn/problems/validate-ip-address/
*/
class Solution {
    func validIPAddress(_ queryIP: String) -> String {
        if isIPv4(queryIP) {
            return "IPv4"
        }
        if isIPv6(queryIP) {
            return "IPv6"
        }
        return "Neither"
    }

    func isIPv4(_ queryIP: String) -> Bool {
        let components = queryIP.split(separator: ".", omittingEmptySubsequences: false).map{ Array($0) }
        guard components.count == 4 else { 
            return false
        }
        for com in components {
            if com.count > 1 && com[0] == "0" {
                return false
            }
            if let n = Int(String(com)), n >= 0 && n <= 255 {
                continue
            }
            return false
        }
        return true
    }

    func isIPv6(_ queryIP: String) -> Bool {
        let components = queryIP.split(separator: ":", omittingEmptySubsequences: false).map{ Array($0) }
        guard components.count == 8 else { 
            return false 
        }
        for com in components {
            if com.count < 1 || com.count > 4 {
                return false
            }
            for c in com {
                if !c.isNumber && !betweenLowerCaseAToF(c) && !betweenUpperCaseAToF(c)  {
                    return false
                }
            }
        }
        return true
    }

    func betweenLowerCaseAToF(_ c: Character) -> Bool {
        return c.asciiValue! >= Character("a").asciiValue! && c.asciiValue! <= Character("f").asciiValue!
    }

    func betweenUpperCaseAToF(_ c: Character) -> Bool {
        return c.asciiValue! >= Character("A").asciiValue! && c.asciiValue! <= Character("F").asciiValue!
    }
}
