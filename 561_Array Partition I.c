// =================== 561. Hamming Distance =====================
/*
 * Given an array of 2n integers, your task is to group these integers into n pairs of integer,
 * say (a1, b1), (a2, b2), ..., (an, bn) which makes sum of min(ai, bi) for all i from 1 to n as large as possible.
 *
 * Input: [1,4,3,2]
 * Output: 4
 * Explanation: n is 2, and the maximum sum of pairs is 4 = min(1, 2) + min(3, 4).
 *
 * n is a positive integer, which is in the range of [1, 10000].
 * All the integers in the array will be in the range of [-10000, 10000].
 *
 */

// 先排序，然后取双数位值相加得结果 O(N^2)采用快排也只能到O(N * logN)
int arrayPairSum(int* nums, int numsSize) {
    for(int i = 1; i < numsSize; i ++) {
        if(nums[i] < nums[i-1]) {
            int j = i - 1;
            int x = nums[i];
            nums[i] = nums[i-1];
            while(j>=0 && x<nums[j]) {
                nums[j+1] = nums[j];
                j--;
            }
            nums[j+1] = x;
        }
    }
    int result = 0;
    for (int k = 0; k < numsSize;) {
        result += nums[k];
        k+=2;
    }
    return result;
}

// Fast Solution O(n)
// 题目说明了最多20000个数，每个数在-10000，10000
int arrayPairSum(int* nums, int numsSize) {
    int i, bucket[20001]={0};
    int Flag=1,reg=0,count=0;
    for(i=0;i<numsSize;i++)
        bucket[nums[i]+10000]++;    //将所有数字+10000作为下标存到数组中
    for(i=0;i<20001&&count<numsSize/2;)   // Use count variable can reduce iteration times
    {
        if(bucket[i]>0) //bucket[X]代表X-10000总共出现多少次
        {
            if(Flag)
            {
                Flag=0;
                reg+=i-10000;
                bucket[i]--;
                count++;
            }
            else
            {
                Flag=1;
                bucket[i]--;
            }

        }
        else i++;
    }
    return reg;
}