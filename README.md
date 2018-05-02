# dependencies
```sh
go get -u github.com/intel-go/cpuid
go get -u github.com/minio/asm2plan9s
go get -u github.com/klauspost/asmfmt/cmd/asmfmt
go get -u github.com/minio/c2goasm
```

# regenerate asm
```sh
go generate
```
# 目前遇见的问题
在生成`AVX2`汇编指令代码的时候，遇到问题。
[c2goasm/issues/8](https://github.com/minio/c2goasm/issues/8)

目前的解决方案，手动修改得到的汇编代码[`lib/sample_avx2.s`]成目前代码中的样子。目前可以正常工作。

# 关于需要注意的点
会在文章[golang 汇编](https://lrita.github.io/2017/12/12/golang-asm/)进行说明.
