/*
 * consts.s
 * Constants used in examples.
*/
.ifdef CONSTS_BASE
.error "consts already included"
.else
/*
 * Standard basic constants
 */
.set CONSTS_BASE, 0
.set STDIN,  0
.set STDOUT, 1
.set STDERR, 2

.set EXIT_SUCCESS, 0
.set EXIT_FAILURE, 1

/*
 * File permissions
 */
.set S_IRWXU, 0700
.set S_IRUSR, 0400
.set S_IWUSR, 0200
.set S_IXUSR, 0100

.set S_IRWXG, 0070
.set S_IRGRP, 0040
.set S_IWGRP, 0020
.set S_IXGRP, 0010

.set S_IRWXO, 0007
.set S_IROTH, 0004
.set S_IWOTH, 0002
.set S_IXOTH, 0001

/*
 * File status flags
 */
.set O_RDONLY,   00000
.set O_WRONLY,   00001
.set O_RDWR,     00002
.set O_ACCMODE,  00003

.set O_CREAT,    00100
.set O_EXCL,     00200
.set O_NOCTTY,   00400

.set O_TRUNC,    01000
.set O_APPEND,   02000
.set O_NONBLOCK, 04000

/*
 * File location
 */
.set SEEK_SET,   0
.set SEEK_CUR,   1
.set SEEK_END,   2
.set SEEK_DATA,  3
.set SEEK_HOLE,  4
.endif
