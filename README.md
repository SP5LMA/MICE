# Samples
ARM Cortex-A examples for laboratory meetings.

Tested on Raspberry Pi 3.

List of exemplary codes in order of discussion.

1. starter.s - learn how to compile
1. uglywrite.s - basic ABI
1. cleanwrite.s - more programmer-friendly use of syscalls
1. interact.s - basic I/O using kernel syscalls
1. functions.s - consolidate returns to one method, write only one word to output file
1. functions-errorcontrol.s - add error control to other syscalls
1. bitops.s - experiment with different values, practice memory and registers examination
1. loops.s - examples of loops
1. rhyme-while-do.s - simple while loop with changing text
1. rhyme-do-while.s - do-while loop with example of post-indexing
1. libtest.s - test compilation with dynamic library
1. hello.s - interaction using libc
1. getdents.s - obtain and traverse more complex data structure
1. basicalu.s - examples of basic arithmetic
1. factorial.s - factorial function
1. factest.s - main program to test factorial function

# Proposed exercise scenario

 * bitops.s

Revise instructions. Add your own test cases. Analyze flags after
execution of Boolean operations.

 * loops.s

Revise various loop structures.

 * rhyme-while-do.s

Increase number of iterations (add more verses).
Change loop from down-counting to up-counting.
Analyze .data section and observe how the memory is organized. Propose
an improvement. Try to implement such improvement using your own design.

 * rhyme-do-while.s

Investigate post-indexing feature. Can it be used more extensively in
the code to traverse the other table?
Analyze .data section. Observe that it can be improved in terms of
memory usage and implement such change.
Can the hard-coded number of loop iterations be improved to version that
is counted automatically during compilation? Implement such
modification.
Add more verses to prove the above change was implemented properly.
Change loop from up-counting do down-counting.

 * libtest.s

Try to compile libtest as usual.

What is the meaning of these error messages? Explain using references to the code.

Improve compilation with linking against C library. Does it help to compile? Does the program work?

Improve compilation by using dynamic linker against linux shared library. What new features can be observed in this program using tools such as file, nm, readelf?

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

 * factorial.s and factest.s

Functions are in factorial.s while factest.s is a helper program to test them. 

Analyze factorial function. Test it against extreme cases using the helper program and improve the function within your capabilities.

Write and test a function that will sum results of 1 000 000/n! for n in range from 0 to 10. Constant numeratorD is already declared in .data section, use it. Why using n > 9 is pointless in this case? Can you improve resolution of the result?

# GDB usage
I recommend installing [dashboard] to make usage of GDB more efficient.

[dashboard]: https://github.com/cyrus-and/gdb-dashboard
