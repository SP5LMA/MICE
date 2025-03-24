# Samples
ARM Cortex-A examples for laboratory meetings.

Tested on Raspberry Pi 4.

List of sample codes in order of discussion.

1. starter.s - learn how to compile, link and run programs
1. gccstarters.s - learn linking with gcc
1. uglywrite.s - basics of ABI
1. cleanwrite.s - more programmer-friendly use of syscalls
1. interact.s - basic I/O using kernel syscalls
1. bitops.s - experiment with different values, practice memory and registers examination
1. loops.s - examples of loops
1. checksum.s - protect the data with checksum
1. rhyme-while-do.s - simple while loop with changing text
1. rhyme-do-while.s - do-while loop with example of post-indexing
1. functions.s - ways to return from function, file interface
1. functions-errorcontrol.s - add error control to other syscalls
1. title.s - Makes A Piece Of Text Looking More Like A Title
1. libtest.s - test compilation with dynamic library
1. hello.s - version of interact.s using libc functions
1. getdents.s - obtain and traverse more complex data structure
1. cmdargs.s - command line arguments from within "main" function
1. basicalu.s - examples of basic arithmetic
1. factorial.s - factorial function
1. factest.s - main program to test factorial function
1. fibonacci.s - recursive and iterative version of Fibonacci series calculation
1. addfloats.s - add two single-precision floating point values
1. muldoubles.s - multiply two double-precision floating point values
1. escape.s - calculate escape velocity from Earth
1. dotproduct.s - calculate dot product of two vectors
1. crossproduct.s - simple example of cross product calculation

# Proposed exercise scenaria

## Basics

* starter.s

Simply to test the toolchain: compilation (as), linking (ld), and other tools.

* gccstarter.s

Similar to above but with "main" as user's first function. Compilation with as but linking with gcc.

## Kernel-provided functions

* uglywrite.s

Compile, link and make the program run. Modify the code and observe outcome. Test it with debugger to see what does it do.

* cleanwrite.s

Analyze the code, figure out what are other functions provided by the kernel. Investigate manuals for C functions corresponding to kernel functions. Compare with "uglywrite.s".

* interact.s

Analyze this interactive program using the command line and using the gdb debugger. Adapt the program so that it "asks" different question. Expand it with another question using additional variables and constant strings.

* bitops.s

Revise instructions. Adapt the code with your own test cases. Analyze flags after execution of Boolean operations.


## Flow control

* loops.s

Revise various loop structures.

* checksum.s

This program should calculate the checksum of an ASCIZ string. The checksum is the total count of all bits set to 1 in the string. The checksum is 1 byte in size and wraps around (i.e., after 0xFF, it goes back to 0x00). The program is missing some parts. Fix it.

Further development proposals:

- return the checksum value to the OS shell (instead of EXIT\_SUCCESS),
- print the string followed by the value of its checksum (as it is,
or in hexadecimal mode, or decimal if feeling brave),
- count number of bits in the checksum to compute checksum level 2,
- use the lookup table where table has 16 precomputed values.

* rhyme-while-do.s

Increase number of iterations (add more verses). Change loop from down-counting to up-counting. Analyze .data section and observe how the memory is organized. Propose an improvement. Try to implement such improvement using your own design.

* rhyme-do-while.s

Investigate post-indexing feature. Can it be used more extensively in the code to traverse the other table? Analyze .data section. Observe that it can be improved in terms of memory usage and implement such change. Can the hard-coded number of loop iterations be improved to version that is counted automatically during compilation? Implement such modification. Add more verses to prove the above change was implemented properly. Change loop from up-counting do down-counting.

* functions.s

Examine usage of functions using debugger. Determine what data does it provide.
* functions-errorcontrol.s

Identify differences between this and previous codes. Develop a plan to make this application "crash". Evaluate boundary conditions at which error control takes place using debugger.

* title.s

Analyze function title and its main loop. Observe conditional branches. Observe workings of stack, how memory is populated. Develop function islower that checks if provided value represents lowercase character. Discuss whether is it better to modyfy text character by character or would it be better to modify more characters at a time. Propose an upgrade to the function so that particular words (e.g.: a, the) are not made uppercase.

## Using standard C library

* libtest.s

If possible, link with ld. What is the meaning of error messages? Explain using references to the code.

Improve compilation with linking against dynamic C library. Does it help to compile? Does the program work?

Improve compilation by using dynamic linker against linux shared library. What new features can be observed in this program using tools such as file, nm, readelf?

Modify this program so that using loop it writes a dynamic text with a counter, like:
```
1. Hello, World
2. Hello, World
...
```

* hello.s

Properly compile hello.s and test the program.

Does the buffer has enough size? Why do you think so?

Make the program greet user using formatting string labeled "hello" and the user name that was entered.

Using existing code as an example add another question. Its answer should be stored in a buffer adjacent to "username". Show buffer usage when entered strings use as many characters as it may be expected.

Improve the code to avoid buffer overflows.

* getdents.s

Test the program and analyze data structure obtained from getdents function.

Consult getdents manual to understand getdents data structure.

Improve output of the program so that it will print i-node from getdents structure.

Improve output of the program so that it will print type of the file (8 is for "regular" file, 4 is for "directory" and so on). Consult /usr/include/dirent.h and values DT_ defined there for further improvement.

* cmdargs.s

Using command-line arguments becomes non-trivial from the "main" function due to stack frame managament applied by gcc. With this sample it should be easier to tackle the issue.

Thanks to this sample and the getdents.s, it should be possible to prepare a program similar to "ls". It should let user to provide the directory name to be listed in the command line argument.

## Integer arithmetics

* basicalu.s

Analyze the example in step-by-step manner

* factorial.s and factest.s

Functions are in factorial.s while factest.s is a helper program to test them. 

Analyze factorial function. Test it against extreme cases using the helper program and improve the function within your capabilities.

Write and test a function that will sum results of 1 000 000/n! for n in range from 0 to 10. Constant numeratorD is already declared in .data section, use it. Why using n > 9 is pointless in this case? Can you improve resolution of the result?

* fibonacci.s

Analyze how recursive version works using the debugger.

Analyze how iterative version works using the debugger.

Measure execution times of both versions using the *time* command line program.

Discuss execution times.

Find out if the Fibonacci number can be calculated faster.

Take out fibonacci calculation functions into a separate file, like in
factorial example

## Floating point

* addfloats.s

Simple example of FPU operation.
Using GDB and step-by-step execution observe changes in registers.

* muldoubles.s

Simple example of FPU operation.
Using GDB and step-by-step execution observe changes in registers.

* escape.s

A toy program that for celestial body parameters given in .data section calculates escape velocity from it.
Modify the program so that it will provide result in [km/s] and [km/h].

## NEON

* dotproduct.s

Calculate dot product of two single-precision vectors hard-coded in memory using vector (NEON) instructions.
Test the code using debugger.
Turn part of the code that calculates dot product into a function and test it.

* crossproduct.s

Calculate cross product of two 3-dimensional vectors hard-coded in the memory using vector (NEON) instructions.
Test the code using debugger.
Change vext instructions into vrev where applicable.
Consider calculation of the cross product without vext, vrev etc. but using vld3, vmul, vmls and vstr3 instructions.

# GDB usage

I recommend installing [dashboard] to make usage of GDB more efficient.

My [fork of dashboard] for ARM training with some changes:

 - shows opcodes,
 - provides my-source-profile and my-assembly-profile setups
 - changed colorscheme

[dashboard]: https://github.com/cyrus-and/gdb-dashboard
[fork of dashboard]: https://github.com/SP5LMA/gdb-dashboard

