class Solution:
    def numUniqueEmails(self, emails):
        """
        :type emails: List[str]
        :rtype: int
        """
        s = set()
        for email in emails:
        	should_ignore = False
        	domain = False
        	temp = ""
        	for char in email:
        		if char == '+':
        			should_ignore = True
        		if char == '@':
        			should_ignore = False
        			domain = True
        		if not should_ignore:
        			if domain or char != '.':
        				temp += char
        	s.add(temp)
        	temp = ""
        return len(s)
