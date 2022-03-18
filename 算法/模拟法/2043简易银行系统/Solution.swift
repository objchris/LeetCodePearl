/*
2043. 简易银行系统
https://leetcode-cn.com/problems/simple-bank-system/
*/
class Bank {

    var balance: [Int]
    var n: Int

    init(_ ba: [Int]) {
        balance = ba
        n = ba.count
    }
    
    func transfer(_ account1: Int, _ account2: Int, _ money: Int) -> Bool {
        guard account1 >= 1, account1 <= n, account2 >= 1, account2 <= n else { return false }
        guard balance[account1 - 1] >= money else { return false }
        balance[account1 - 1] -= money
        balance[account2 - 1] += money
        return true
    }
    
    func deposit(_ account: Int, _ money: Int) -> Bool {
        guard account >= 1, account <= n else { return false }
        balance[account - 1] += money
        return true
    }
    
    func withdraw(_ account: Int, _ money: Int) -> Bool {
        guard account >= 1, account <= n, balance[account - 1] >= money else { return false }
        balance[account - 1] -= money
        return true
    }
  
}
