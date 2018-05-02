package sample

import "unsafe"

//go:noescape
func _sample_sum_sse4_2(addr unsafe.Pointer, len int64) (x int64)

//go:noescape
func _sample_max_sse4_2(addr unsafe.Pointer, len int64) (x int64)

//go:noescape
func _sample_min_sse4_2(addr unsafe.Pointer, len int64) (x int64)

func sample_sum_sse4_2(v []int64) int64 {
	x := (*slice)(unsafe.Pointer(&v))
	return _sample_sum_sse4_2(x.addr, x.len)
}

func sample_max_sse4_2(v []int64) int64 {
	x := (*slice)(unsafe.Pointer(&v))
	return _sample_max_sse4_2(x.addr, x.len)
}

func sample_min_sse4_2(v []int64) int64 {
	x := (*slice)(unsafe.Pointer(&v))
	return _sample_min_sse4_2(x.addr, x.len)
}
