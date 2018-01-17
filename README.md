# digitprint
A tiny looping program which prints digits out, in AT&T syntax. My first x86-64 asm program.

## Background
Online tutorials for python are aplenty, but tutorials on x86 asm are rarer, and x86-64 even more so.
Digitprint was pieced together from a bunch of tutorials, mostly on 32-bit stuff. It prints digits from 0 to 100000000 out to stdout through the linux write system call (1 in rax; 1 in rdi; pointer to message in rsi; message length in rdx). Needless to say, it will only run on 64-bit linux.

It was also written in AT&T syntax, since I began reading ASM through debugging C code, and that's what the gdb spits out. 

I think of this as my hello world program.

