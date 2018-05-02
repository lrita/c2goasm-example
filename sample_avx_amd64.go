package sample

import "unsafe"

//go:noescape
func _sample_sum_avx(addr unsafe.Pointer, len int64) (x int64)

//go:noescape
func _sample_max_avx(addr unsafe.Pointer, len int64) (x int64)

//go:noescape
func _sample_min_avx(addr unsafe.Pointer, len int64) (x int64)

func sample_sum_avx(v []int64) int64 {
	x := (*slice)(unsafe.Pointer(&v))
	return _sample_sum_avx(x.addr, x.len)
}

func sample_max_avx(v []int64) int64 {
	x := (*slice)(unsafe.Pointer(&v))
	return _sample_max_avx(x.addr, x.len)
}

func sample_min_avx(v []int64) int64 {
	x := (*slice)(unsafe.Pointer(&v))
	return _sample_min_avx(x.addr, x.len)
}
