from typing import List
class Solution:
    def canCompleteCircuit(self, gas: List[int], cost: List[int]) -> int:
        result = -1
        if len(gas) == 1:
            return  0 if gas[0] >= cost[0] else -1
        count = 0 
        i = 0
        while count < len(gas) :
            current = i
            tank = gas[i]
            while result == -1:
                tank -= cost[current]
                if tank < 0 :
                    i = (current + 1) % len(gas)
                    break
                current = (current + 1) % len(gas)
                tank += gas[current]
                count += 1
                if current == i:
                    result = i
        return result

s = Solution()
r = s.canCompleteCircuit([1,2,3,4,5], [3,4,5,1,2])
print("gas:[1,2,3,4,5], cost:[3,4,5,1,2], result:%d" % r) # gas:[1,2,3,4,5], cost:[3,4,5,1,2], result:3

r = s.canCompleteCircuit([2,3,4], [3,4,2])
print("gas:[2,3,4], cost:[3,4,2], result:%d" % r) # gas:[2,3,4], cost:[3,4,2], result:2

r = s.canCompleteCircuit([2,3,4], [3,4,3])
print("gas:[2,3,4], cost:[3,4,3], result:%d" % r) # gas:[2,3,4], cost:[3,4,3], result:-1

r = s.canCompleteCircuit([2,3], [3,2])
print("gas:[2,3], cost:[3,2], result:%d" % r) # gas:[2,3], cost:[3,2], result:1

r = s.canCompleteCircuit([2], [3])
print("gas:[2], cost:[3], result:%d" % r) # gas:[2], cost:[3], result:-1

r = s.canCompleteCircuit([3], [2])
print("gas:[3], cost:[2], result:%d" % r) # gas:[3], cost:[2], result:0

r = s.canCompleteCircuit([2], [2])
print("gas:[2], cost:[2], result:%d" % r) # gas:[2], cost:[2], result:0

r = s.canCompleteCircuit([3,2,4,1,5,6,7], [1,3,2,9,6,3,2])
print("gas:[3,2,4,1,5,6,7], cost:[1,3,2,9,6,3,9], result:%d" % r) # gas:[3,2,4,1,5,6,7], cost:[1,3,2,9,6,3,9], result:5