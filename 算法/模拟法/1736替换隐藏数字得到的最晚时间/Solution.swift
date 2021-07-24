/*
 1736. 替换隐藏数字得到的最晚时间
 https://leetcode-cn.com/problems/latest-time-by-replacing-hidden-digits/
 */
class Solution {
    var temp = [Int]()

    func maxValueAt(_ index: Int) -> Int {
        switch index {
            case 0: return 2
            case 1: return temp[0] < 2 ? 9 : 3
            case 2: return 5
            case 3: return 9
            default: return 0
        }
    }

    func maximumTime(_ time: String) -> String {
        
        for i in time.indices {
            if time[i] == ":" {
                continue
            }
            if time[i] != "?" {
                temp.append(Int(time[i].asciiValue! - Character("0").asciiValue!))
            } else {
                temp.append(maxValueAt(temp.count))
            }
        }

        if (temp[1] >= 4 && temp[0] == 2) {
            temp[0] = 1
        }

        return "\(temp[0])\(temp[1]):\(temp[2])\(temp[3])"
    }

}
