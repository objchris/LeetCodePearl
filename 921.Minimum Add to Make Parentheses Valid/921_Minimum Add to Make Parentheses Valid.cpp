//
//  main.cpp
//  LeetcodeWithCPP
//
//  Created by Chris Cheung on 2018/11/13.
//  Copyright © 2018 OBJCHRIS. All rights reserved.
//

#include <stdio.h>
#include <iostream>
#include <string>
#include <stack>

using namespace std;

class Solution {
public:
    int minAddToMakeValid(string S) {
        stack<char> ans;
        for (int i=0; i<S.size(); i++) {
            if(ans.empty()) {
                ans.push(S[i]);
                continue;
            }
            if(S[i] == ')' && ans.top() == '(') {
                ans.pop();
                continue;
            }
            ans.push(S[i]);
        }
        return ans.size();
    }
    
private:
    int minAddToMakeValid_fast(string S) {
        stack<int> ss;
        int res = 0;
        for(int i=0;i<S.size();i++){
            if(S[i] == '('){
                ss.push(S[i]);
            }else if(S[i] == ')' && !ss.empty()){
                ss.pop();
            }else{
                res++;
            }
        }
        res = res + ss.size();
        return res;
    }
};


int main() {
    Solution s = Solution();
    int i = s.minAddToMakeValid("()))((");
    cout << i;
}
