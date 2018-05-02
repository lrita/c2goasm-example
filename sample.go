//go:generate clang -S -DENABLE_SSE4_2 -target x86_64-unknown-none -masm=intel -mno-red-zone -mstackrealign -mllvm -inline-threshold=1000 -fno-asynchronous-unwind-tables -fno-exceptions -fno-rtti -O3 -fno-builtin -ffast-math -msse4 lib/sample.c -o lib/sample_sse4.s
//go:generate clang -S -DENABLE_AVX -target x86_64-unknown-none -masm=intel -mno-red-zone -mstackrealign -mllvm -inline-threshold=1000 -fno-asynchronous-unwind-tables -fno-exceptions -fno-rtti -O3 -fno-builtin -ffast-math -mavx lib/sample.c -o lib/sample_avx.s
//go:generate clang -S -DENABLE_AVX2 -target x86_64-unknown-none -masm=intel -mno-red-zone -mstackrealign -mllvm -inline-threshold=1000 -fno-asynchronous-unwind-tables -fno-exceptions -fno-rtti -O3 -fno-builtin -ffast-math -mavx2 lib/sample.c -o lib/sample_avx2.s
//go:generate c2goasm -a -f lib/sample_sse4.s sample_sse4_amd64.s
//go:generate c2goasm -a -f lib/sample_avx.s sample_avx_amd64.s
//go:generate c2goasm -a -f lib/sample_avx2.s sample_avx2_amd64.s
package sample

import (
	"math"
	"unsafe"

	"github.com/intel-go/cpuid"
)

var (
	// SampleSum returns the sum of the slice of int64.
	SampleSum func(values []int64) int64
	// SampleMax returns the maximum value of the slice of int64.
	SampleMax func(values []int64) int64
	// SampleMin returns the minimum value of the slice of int64.
	SampleMin func(values []int64) int64
)

type slice struct {
	addr unsafe.Pointer
	len  int64
	cap  int64
}

func init() {
	switch {
	case cpuid.EnabledAVX && cpuid.HasExtendedFeature(cpuid.AVX2):
		SampleSum = sample_sum_avx2
		SampleMax = sample_max_avx2
		SampleMin = sample_min_avx2
	case cpuid.EnabledAVX && cpuid.HasFeature(cpuid.AVX):
		SampleSum = sample_sum_avx
		SampleMax = sample_max_avx
		SampleMin = sample_min_avx
	case cpuid.HasFeature(cpuid.SSE4_2):
		SampleSum = sample_sum_sse4_2
		SampleMax = sample_max_sse4_2
		SampleMin = sample_min_sse4_2
	default:
		SampleSum = sampleSum
		SampleMax = sampleMax
		SampleMin = sampleMin
	}
}

func sampleSum(values []int64) int64 {
	var sum int64
	for _, v := range values {
		sum += v
	}
	return sum
}

func sampleMax(values []int64) int64 {
	if 0 == len(values) {
		return 0
	}
	var max int64 = math.MinInt64
	for _, v := range values {
		if max < v {
			max = v
		}
	}
	return max
}

func sampleMin(values []int64) int64 {
	if 0 == len(values) {
		return 0
	}
	var min int64 = math.MaxInt64
	for _, v := range values {
		if min > v {
			min = v
		}
	}
	return min
}
