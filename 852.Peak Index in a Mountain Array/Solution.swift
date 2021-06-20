// 852 https://leetcode-cn.com/problems/peak-index-in-a-mountain-array/
/*
 符合下列属性的数组 arr 称为 山脉数组 ：
 arr.length >= 3
 存在 i（0 < i < arr.length - 1）使得：
 arr[0] < arr[1] < ... arr[i-1] < arr[i]
 arr[i] > arr[i+1] > ... > arr[arr.length - 1]
 给你由整数组成的山脉数组 arr ，返回任何满足 arr[0] < arr[1] < ... arr[i - 1] < arr[i] > arr[i + 1] > ... > arr[arr.length - 1] 的下标 i 。
 
 */

// 从头遍历整个数组
class Solution_Bad {
    
    // O(n)
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        for i in 0..<arr.count {
            if (arr[i] > arr[i + 1]) {
                return i
            }
        }
        return 0
    }
    
}

// 二分法遍历数组
class Solution_Good {
    
    // O(log(n))
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        var min = 0
        var max = arr.count - 1
        while min != max {
            let middle = (min + max) / 2
            if arr[middle] > arr[middle + 1] {
                max = middle
            } else {
                min = middle + 1
            }
        }
        return max
    }
    
}

let s = Solution()
s.peakIndexInMountainArray([24,100,99,79,78,69,67,36,26,19])
