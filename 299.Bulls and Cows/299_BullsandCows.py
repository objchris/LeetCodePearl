class Solution:
    def getHint(self, secret: str, guess: str) -> str:
        A = 0
        B = 0
        marks_S = [0 for i in range(0, 10)]
        marks_G = [0 for i in range(0, 10)]
        secret_int_arr = [int(s) for s in list(secret)]
        guess_int_arr = [int(s) for s in list(guess)]
        for i in range(0, len(secret_int_arr)):
            if guess_int_arr[i] != secret_int_arr[i]:
                marks_S[secret_int_arr[i]] += 1
                marks_G[guess_int_arr[i]] += 1
            else:
                A += 1
        for i in range(0, 10):
            B += min(marks_S[i], marks_G[i])
        return str(A)+"A"+str(B)+"B"