//
//  861_Score After Flipping Matrix
//  LeetcodeWithCPP
//
//  Created by Chris Cheung on 2018/11/13.
//  Copyright © 2018 OBJCHRIS. All rights reserved.
//

#include <stdio.h>
#include <iostream>
#include <string>
#include <vector>

using namespace std;

auto __ = []{
    std::ios::sync_with_stdio(false);
    cin.tie(nullptr);
    return nullptr;
}();

class Solution {
public:
    int matrixScore(vector<vector<int>>& A) {
        for (int i=0; i<A.size(); i++) {
            if(A[i][0] == 0) {
                toggle(A[i]);
            }
        }
        int column = A[0].size();
        for(int j=column-1;j>=1;j--) {
            int zero_count = 0;
            for (int i=0; i<A.size(); i++)
                if(A[i][j] == 0) zero_count++;
            if (zero_count > A.size()/2)
                for (int i=0; i<A.size(); i++)
                    A[i][j] ^= 1;
        }
        int rv = 0;
        for (int i=0; i<A.size(); i++) {
            int temp = 1;
            for (int j=0; j<A[i].size(); j++) {
                if(A[i][j]==1) {
                    temp = temp << 1;
                } else {
                    temp = (temp << 1) - 1;
                }
            }
            rv += temp - 1;
        }
        return rv;
    }
private:
    void toggle(vector<int>& A) {
        for (int i=0; i<A.size(); i++) {
            A[i] = A[i] ^ 1;
        }
    }
};

