package sample

import (
	"math/rand"
	"testing"
	"time"
)

func TestSampleSum(t *testing.T) {
	var tt = []struct {
		sum     int64
		samples []int64
	}{
		{1, []int64{1}},
		{3, []int64{1, 2}},
		{6, []int64{1, 2, 3}},
		{10, []int64{1, 2, 3, 4}},
	}

	for i, v := range tt {
		if SampleSum(v.samples) != v.sum {
			t.Error(i, "failed")
		}
	}
}

func TestSampleMax(t *testing.T) {
	var tt = []struct {
		max     int64
		samples []int64
	}{
		{1, []int64{1}},
		{2, []int64{1, 2}},
		{3, []int64{1, 2, 3}},
		{4, []int64{1, 2, 3, 4}},
	}

	for i, v := range tt {
		if SampleMax(v.samples) != v.max {
			t.Error(i, "failed")
		}
	}
}

func TestSampleMin(t *testing.T) {
	var tt = []struct {
		min     int64
		samples []int64
	}{
		{1, []int64{1}},
		{2, []int64{2, 3, 4, 5}},
		{2, []int64{3, 4, 5, 8, 6, 7, 4, 2, 3}},
		{1, []int64{10, 23, 221, 33, 112, 22, 1, 2, 3, 4}},
	}

	for i, v := range tt {
		if SampleMin(v.samples) != v.min {
			t.Error(i, "failed")
		}
	}
}

var samples [1024]int64

func init() {
	rand.Seed(time.Now().UnixNano())
	for i := 0; i < 1024; i++ {
		samples[i] = rand.Int63()
	}
}

func BenchmarkSampleSum(b *testing.B) {
	for i := 0; i < b.N; i++ {
		SampleSum(samples[:])
	}
}

func BenchmarkSampleMax(b *testing.B) {
	for i := 0; i < b.N; i++ {
		SampleMax(samples[:])
	}
}

func BenchmarkSampleMin(b *testing.B) {
	for i := 0; i < b.N; i++ {
		SampleMin(samples[:])
	}
}
