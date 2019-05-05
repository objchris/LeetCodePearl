from typing import List

# class Solution:
#     def removeElement(self, nums: List[int], val: int) -> int:
#         while val in nums:
#             nums.remove(val)
#         return len(nums)

# class Solution:
#     def removeElement(self, nums: List[int], val: int) -> int:
#         i = 0
#         for j in range(0, len(nums)):
#             if nums[j] != val:
#                 nums[i] = nums[j]
#                 i+=1
#             else :
#                 j+=1
#         return i


class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        i = 0
        n = len(nums)
        while i < n :
            if nums[i] == val :
                nums[i] = nums[n - 1]
                n -= 1
            else :
                i += 1
        return n