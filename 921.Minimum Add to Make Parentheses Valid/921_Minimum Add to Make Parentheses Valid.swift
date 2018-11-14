//
//  test.swift
//  LeetcodeWithSwift
//
//  Created by Chris Cheung on 2018/11/14.
//  Copyright © 2018 OBJCHRIS. All rights reserved.
//

import Foundation

class Solution {
    func minAddToMakeValid(_ S: String) -> Int {
        var ans = 0;
        var arr = [Character]()
        for c in S {
            if c == '(' {
                arr.append(c)
            } else if c == ')' && !arr.isEmpty {
                arr.popLast()
            } else {
                ans += 1
            }
        }
        ans += arr.count
        return ans
    }
}
