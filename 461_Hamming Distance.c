// =================== 461. Hamming Distance =====================
int hammingDistance(int x, int y) {
    int result = 0;
    for (int i = 0; i < 32; ++i) {
        int pows = (int)pow(2, i);
        int tx = x&pows;
        int ty = y&pows;
        if (tx != ty) {
            result ++;
        }
    }
    return result;
}
// Wonderful Solution
int hammingDistance_0MS(int x, int y) {

    int tmpInt=x^y;
    int dis=0;

    while(tmpInt)
    {
        if((tmpInt>>1)<<1 != tmpInt)
        {
            ++dis;
        }

        tmpInt>>=1;
    }

    return dis;
}

