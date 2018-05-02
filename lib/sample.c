#include <stdint.h>

#if defined ENABLE_AVX2
#define NAME(x) x##_avx2
#elif defined ENABLE_AVX
#define NAME(x) x##_avx
#elif defined ENABLE_SSE4_2
#define NAME(x) x##_sse4_2
#endif

int64_t NAME(sample_sum)(int64_t *beg, int64_t len) {
    int64_t sum = 0;
    int64_t *end = beg + len;
    while (beg < end) {
        sum += *beg++;
    }
    return sum;
}

int64_t NAME(sample_max)(int64_t *beg, int64_t len) {
    int64_t max = 0x8000000000000000;
    int64_t *end = beg + len;
	if (len == 0) {
        return 0;
    }
    while (beg < end) {
        if (*beg > max) {
            max = *beg;
        }
        beg++;
    }
    return max;
}

int64_t NAME(sample_min)(int64_t *beg, int64_t len) {
    if (len == 0) {
        return 0;
    }
    int64_t min = 0x7FFFFFFFFFFFFFFF;
    int64_t *end = beg + len;
    while (beg < end) {
        if (*beg < min) {
            min = *beg;
        }
        beg++;
    }
    return min;
}
