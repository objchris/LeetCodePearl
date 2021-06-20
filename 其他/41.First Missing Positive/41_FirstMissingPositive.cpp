#include <vector>

using namespace std;

class Solution_O_n {
public:
    int firstMissingPositive(vector<int>& nums) {
        int len = nums.size();
        vector<int> newNums(len, 0);
        for(int i=0; i<len; i++) {
            if(nums[i] > 0 && nums[i] <= len) {
                newNums[nums[i] - 1] = nums[i];
            }
        }
        for(int i=0;i<len;i++) {
            if(newNums[i] != i + 1) {
                return i + 1;
            }
        }
        return len + 1;
    }
};

class Solution_O_1 {
public:
    int firstMissingPositive(vector<int>& nums) {
        int len = nums.size();
        for(int i=0; i<len; i++) {
            while(nums[i] <= len && nums[i] > 0 && nums[nums[i] - 1] != nums[i]) {
                swap(nums[i], nums[nums[i] - 1]);
            }
        }
        for(int i=0;i<len;i++) {
            if(nums[i] != i + 1) {
                return i + 1;
            }
        }
        return len + 1;
    }
};