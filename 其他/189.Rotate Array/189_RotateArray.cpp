#include <vector>

using namespace std;

/// 1.Cyclic Replacements
class Solution_Cyclic_Replacements {
public:
    void rotate(vector<int>& nums, int k) {
        k = k % nums.size();
        if(k == 0) {
            return ;
        }
        int count = 0;
        for (int start = 0; count < nums.size(); start++) {
            int current = start;
            int prev = nums[current];
            do {
                int next = (current + k) % nums.size();
                int temp = nums[next];
                nums[next] = prev;
                prev = temp;
                count++;
                current = next;
            } while(start != current);
        }
    }
};

/// 2.Reverse
class Solution_Reverse {
public:
    void rotate(vector<int>& nums, int k) {
        k = k % nums.size();
        reverse(nums, 0, nums.size() - 1);
        reverse(nums, 0, k-1);
        reverse(nums, k, nums.size() - 1);
    }

    void reverse(vector<int>& nums, int start, int end) {
        while (start < end) {
            int temp = nums[start];
            nums[start] = nums[end];
            nums[end] = temp;
            start++;
            end--;
        }
    }
};
