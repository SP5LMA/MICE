; =====================================================
; consts.inc
; Constants used in examples.
; =====================================================

%define STDIN	0
%define STDOUT	1
%define STDERR	2

%define	EXIT_SUCCESS	0
%define	EXIT_FAILURE	1

; =====================================================
; File permissions
; =====================================================
%define S_IRWXU	0o700
%define	S_IRUSR	0o400
%define	S_IWUSR	0o200
%define	S_IXUSR	0o100

%define	S_IRWXG	0o070
%define	S_IRGRP	0o040
%define	S_IWGRP	0o020
%define	S_IXGRP	0o010

%define	S_IRWXO	0o007
%define	S_IROTH	0o004
%define	S_IWOTH	0o002
%define	S_IXOTH	0o001

; =====================================================
; File status flags
; =====================================================
%define	O_RDONLY	0o0000
%define	O_WRONLY	0o0001
%define	O_RDWR		0o0002
%define	O_ACCMODE	0o0003

%define	O_CREAT		0o0100
%define	O_EXCL		0o0200
%define O_NOCTTY	0o0400

%define	O_TRUNC		0o1000
%define	O_APPEND	0o2000
%define	O_NONBLOCK	0o4000
