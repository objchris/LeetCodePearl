//
//  main.cpp
//  LeetcodeWithCPP
//
//  Created by Chris Cheung on 2018/11/12.
//  Copyright © 2018 OBJCHRIS. All rights reserved.
//

#include <stdio.h>
#include <string>
#include <iostream>
#include <vector>
#include <set>

using std::vector;
using std::string;
using std::set;

class Solution {
public:
    int numUniqueEmails(vector<string>& emails) {
        set<string> s;
        string temp = "";
        bool should_ignore;
        bool domain;
        for (int i=0; i<emails.size(); i++)
        {
            should_ignore = false;
            domain = false;
            string email = emails[i];
            for (int j=0; j<email.size(); j++)
            {
                if (email[j] == '+')
                {
                    should_ignore = true;
                }
                if (email[j] == '@')
                {
                    should_ignore = false;
                    domain = true;
                }
                if (!should_ignore)
                {
                    if (domain || email[j] != '.')
                    temp += email[j];
                }
            }
            s.insert(temp);
            temp = "";
        }
        return (int)s.size();
    }
};

