#include <stdint.h>
#include <assert.h>

int main(int argc, char **argv){
    (void)argc;
    (void)argv;
    int64_t slice[4];
    slice[0] = 1;
    slice[1] = 2;
    slice[2] = 3;
    slice[3] = 4;

    assert(sample_sum_avx2(slice, 1, 1) == 1);
    assert(sample_sum_avx2(slice, 2, 2) == 3);
    assert(sample_sum_avx2(slice, 3, 3) == 6);
    assert(sample_sum_avx2(slice, 4, 4) == 10);
	
    assert(sample_max_avx2(slice, 1, 1) == 1);
    assert(sample_max_avx2(slice, 2, 2) == 2);
    assert(sample_max_avx2(slice, 3, 3) == 3);
    assert(sample_max_avx2(slice, 4, 4) == 4);
	
    assert(sample_min_avx2(slice, 1, 1) == 1);
    assert(sample_min_avx2(slice, 2, 2) == 1);
    assert(sample_min_avx2(slice, 3, 3) == 1);
    assert(sample_min_avx2(slice, 4, 4) == 1);

    return 0;
}
