/*
380. O(1) 时间插入、删除和获取随机元素
https://leetcode-cn.com/problems/insert-delete-getrandom-o1/
*/
class RandomizedSet {

    var nums = [Int]()
    var indices = [Int: Int]()

    init() {

    }
    
    func insert(_ val: Int) -> Bool {
        guard indices[val] == nil else { return false }
        indices[val] = nums.count
        nums.append(val)
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        guard let index = indices[val], let last = nums.last else { return false }
        nums[index] = last
        indices[last] = index
        nums.popLast()
        indices.removeValue(forKey: val)
        return true
    }
    
    func getRandom() -> Int {
        let random = Int.random(in: 0..<nums.count)
        return nums[random]
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */
