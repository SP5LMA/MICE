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
1. basicalu.s - examples of basic arithmetic

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

# GDB usage
I recommend installing [dashboard] to make usage of GDB more efficient.

[dashboard]: https://github.com/cyrus-and/gdb-dashboard
