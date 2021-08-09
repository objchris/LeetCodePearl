/*
 313. 超级丑数
 https://leetcode-cn.com/problems/super-ugly-number/
 */
class Solution {
    func nthSuperUglyNumber(_ n: Int, _ primes: [Int]) -> Int {
        var superUglyNumbers = [1]
        superUglyNumbers.reserveCapacity(n)
        var primesWithCountIndex = primes.map { (prime: $0, countIndex: 0) }
        for _ in 1..<n {
            let candidates = primesWithCountIndex.map { $0.prime * superUglyNumbers[$0.countIndex] }
            let nextNumber = candidates.min()!
            for index in candidates.enumerated().filter({ $0.element == nextNumber }).map(\.offset) {
                primesWithCountIndex[index].countIndex += 1
            }
            superUglyNumbers.append(nextNumber)
        }
        return superUglyNumbers.last!
    }
}
