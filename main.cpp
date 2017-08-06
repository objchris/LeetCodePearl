#include <stdio.h>

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

int main() {
    int nums[6] = {1,4,2,6,12,5};
    printf("%d ",arrayPairSum(nums, 6));
    return 0;
}

