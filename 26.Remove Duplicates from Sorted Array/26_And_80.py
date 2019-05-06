from typing import List
class Solution26:
    def removeDuplicates(self, nums: List[int]) -> int:
        if len(nums) <= 0:
            return 0
        val = nums[0]
        i = 1
        for j in range(1, len(nums)):
            if nums[j] != val:
                nums[i] = nums[j]
                i += 1
                val = nums[j]
        return i


class Solution80:
    def removeDuplicates(self, nums: List[int]) -> int:
        if len(nums) <= 2 :
            return len(nums)
        i = 2
        for j in range(2, len(nums)):
            if nums[j] != nums[i-2]:
                nums[i] = nums[j]
                i += 1
        return i