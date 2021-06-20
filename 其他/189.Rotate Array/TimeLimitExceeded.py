# Bad qnswer. Time limit exceeded
# Correct answer in 189_RotateArray.cpp
from typing import List
class Solution:
    def rotate(self, nums: List[int], k: int) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        numsLen = len(nums)
        if k >= numsLen:
            k = k % numsLen
        if k > numsLen/2:
            k = numsLen - k
            while k != 0:
                start = nums[0]
                for i in range(numsLen - 1):
                    nums[i] = nums[i + 1]
                nums[numsLen - 1] = start
                k -= 1
        else :
            while k != 0:
                end = nums[numsLen - 1]
                for i in range(numsLen - 1, 0, -1):
                    nums[i] = nums[i - 1]
                nums[0] = end 
                k -= 1;