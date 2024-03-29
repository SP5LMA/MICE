/*
File is based on unistd-eabi.h
from Raspbian at Raspberry Pi
*/

.ifdef SYSCALL_BASE
.error "syscalls already included"
.else
.set SYSCALL_BASE, 0
.set sys_restart_syscall, (SYSCALL_BASE + 0)
.set sys_exit, (SYSCALL_BASE + 1)
.set sys_fork, (SYSCALL_BASE + 2)
.set sys_read, (SYSCALL_BASE + 3)
.set sys_write, (SYSCALL_BASE + 4)
.set sys_open, (SYSCALL_BASE + 5)
.set sys_close, (SYSCALL_BASE + 6)
.set sys_creat, (SYSCALL_BASE + 8)
.set sys_link, (SYSCALL_BASE + 9)
.set sys_unlink, (SYSCALL_BASE + 10)
.set sys_execve, (SYSCALL_BASE + 11)
.set sys_chdir, (SYSCALL_BASE + 12)
.set sys_mknod, (SYSCALL_BASE + 14)
.set sys_chmod, (SYSCALL_BASE + 15)
.set sys_lchown, (SYSCALL_BASE + 16)
.set sys_lseek, (SYSCALL_BASE + 19)
.set sys_getpid, (SYSCALL_BASE + 20)
.set sys_mount, (SYSCALL_BASE + 21)
.set sys_setuid, (SYSCALL_BASE + 23)
.set sys_getuid, (SYSCALL_BASE + 24)
.set sys_ptrace, (SYSCALL_BASE + 26)
.set sys_pause, (SYSCALL_BASE + 29)
.set sys_access, (SYSCALL_BASE + 33)
.set sys_nice, (SYSCALL_BASE + 34)
.set sys_sync, (SYSCALL_BASE + 36)
.set sys_kill, (SYSCALL_BASE + 37)
.set sys_rename, (SYSCALL_BASE + 38)
.set sys_mkdir, (SYSCALL_BASE + 39)
.set sys_rmdir, (SYSCALL_BASE + 40)
.set sys_dup, (SYSCALL_BASE + 41)
.set sys_pipe, (SYSCALL_BASE + 42)
.set sys_times, (SYSCALL_BASE + 43)
.set sys_brk, (SYSCALL_BASE + 45)
.set sys_setgid, (SYSCALL_BASE + 46)
.set sys_getgid, (SYSCALL_BASE + 47)
.set sys_geteuid, (SYSCALL_BASE + 49)
.set sys_getegid, (SYSCALL_BASE + 50)
.set sys_acct, (SYSCALL_BASE + 51)
.set sys_umount2, (SYSCALL_BASE + 52)
.set sys_ioctl, (SYSCALL_BASE + 54)
.set sys_fcntl, (SYSCALL_BASE + 55)
.set sys_setpgid, (SYSCALL_BASE + 57)
.set sys_umask, (SYSCALL_BASE + 60)
.set sys_chroot, (SYSCALL_BASE + 61)
.set sys_ustat, (SYSCALL_BASE + 62)
.set sys_dup2, (SYSCALL_BASE + 63)
.set sys_getppid, (SYSCALL_BASE + 64)
.set sys_getpgrp, (SYSCALL_BASE + 65)
.set sys_setsid, (SYSCALL_BASE + 66)
.set sys_sigaction, (SYSCALL_BASE + 67)
.set sys_setreuid, (SYSCALL_BASE + 70)
.set sys_setregid, (SYSCALL_BASE + 71)
.set sys_sigsuspend, (SYSCALL_BASE + 72)
.set sys_sigpending, (SYSCALL_BASE + 73)
.set sys_sethostname, (SYSCALL_BASE + 74)
.set sys_setrlimit, (SYSCALL_BASE + 75)
.set sys_getrusage, (SYSCALL_BASE + 77)
.set sys_gettimeofday, (SYSCALL_BASE + 78)
.set sys_settimeofday, (SYSCALL_BASE + 79)
.set sys_getgroups, (SYSCALL_BASE + 80)
.set sys_setgroups, (SYSCALL_BASE + 81)
.set sys_symlink, (SYSCALL_BASE + 83)
.set sys_readlink, (SYSCALL_BASE + 85)
.set sys_uselib, (SYSCALL_BASE + 86)
.set sys_swapon, (SYSCALL_BASE + 87)
.set sys_reboot, (SYSCALL_BASE + 88)
.set sys_munmap, (SYSCALL_BASE + 91)
.set sys_truncate, (SYSCALL_BASE + 92)
.set sys_ftruncate, (SYSCALL_BASE + 93)
.set sys_fchmod, (SYSCALL_BASE + 94)
.set sys_fchown, (SYSCALL_BASE + 95)
.set sys_getpriority, (SYSCALL_BASE + 96)
.set sys_setpriority, (SYSCALL_BASE + 97)
.set sys_statfs, (SYSCALL_BASE + 99)
.set sys_fstatfs, (SYSCALL_BASE + 100)
.set sys_syslog, (SYSCALL_BASE + 103)
.set sys_setitimer, (SYSCALL_BASE + 104)
.set sys_getitimer, (SYSCALL_BASE + 105)
.set sys_stat, (SYSCALL_BASE + 106)
.set sys_lstat, (SYSCALL_BASE + 107)
.set sys_fstat, (SYSCALL_BASE + 108)
.set sys_vhangup, (SYSCALL_BASE + 111)
.set sys_wait4, (SYSCALL_BASE + 114)
.set sys_swapoff, (SYSCALL_BASE + 115)
.set sys_sysinfo, (SYSCALL_BASE + 116)
.set sys_fsync, (SYSCALL_BASE + 118)
.set sys_sigreturn, (SYSCALL_BASE + 119)
.set sys_clone, (SYSCALL_BASE + 120)
.set sys_setdomainname, (SYSCALL_BASE + 121)
.set sys_uname, (SYSCALL_BASE + 122)
.set sys_adjtimex, (SYSCALL_BASE + 124)
.set sys_mprotect, (SYSCALL_BASE + 125)
.set sys_sigprocmask, (SYSCALL_BASE + 126)
.set sys_init_module, (SYSCALL_BASE + 128)
.set sys_delete_module, (SYSCALL_BASE + 129)
.set sys_quotactl, (SYSCALL_BASE + 131)
.set sys_getpgid, (SYSCALL_BASE + 132)
.set sys_fchdir, (SYSCALL_BASE + 133)
.set sys_bdflush, (SYSCALL_BASE + 134)
.set sys_sysfs, (SYSCALL_BASE + 135)
.set sys_personality, (SYSCALL_BASE + 136)
.set sys_setfsuid, (SYSCALL_BASE + 138)
.set sys_setfsgid, (SYSCALL_BASE + 139)
.set sys__llseek, (SYSCALL_BASE + 140)
.set sys_getdents, (SYSCALL_BASE + 141)
.set sys__newselect, (SYSCALL_BASE + 142)
.set sys_flock, (SYSCALL_BASE + 143)
.set sys_msync, (SYSCALL_BASE + 144)
.set sys_readv, (SYSCALL_BASE + 145)
.set sys_writev, (SYSCALL_BASE + 146)
.set sys_getsid, (SYSCALL_BASE + 147)
.set sys_fdatasync, (SYSCALL_BASE + 148)
.set sys__sysctl, (SYSCALL_BASE + 149)
.set sys_mlock, (SYSCALL_BASE + 150)
.set sys_munlock, (SYSCALL_BASE + 151)
.set sys_mlockall, (SYSCALL_BASE + 152)
.set sys_munlockall, (SYSCALL_BASE + 153)
.set sys_sched_setparam, (SYSCALL_BASE + 154)
.set sys_sched_getparam, (SYSCALL_BASE + 155)
.set sys_sched_setscheduler, (SYSCALL_BASE + 156)
.set sys_sched_getscheduler, (SYSCALL_BASE + 157)
.set sys_sched_yield, (SYSCALL_BASE + 158)
.set sys_sched_get_priority_max, (SYSCALL_BASE + 159)
.set sys_sched_get_priority_min, (SYSCALL_BASE + 160)
.set sys_sched_rr_get_interval, (SYSCALL_BASE + 161)
.set sys_nanosleep, (SYSCALL_BASE + 162)
.set sys_mremap, (SYSCALL_BASE + 163)
.set sys_setresuid, (SYSCALL_BASE + 164)
.set sys_getresuid, (SYSCALL_BASE + 165)
.set sys_poll, (SYSCALL_BASE + 168)
.set sys_nfsservctl, (SYSCALL_BASE + 169)
.set sys_setresgid, (SYSCALL_BASE + 170)
.set sys_getresgid, (SYSCALL_BASE + 171)
.set sys_prctl, (SYSCALL_BASE + 172)
.set sys_rt_sigreturn, (SYSCALL_BASE + 173)
.set sys_rt_sigaction, (SYSCALL_BASE + 174)
.set sys_rt_sigprocmask, (SYSCALL_BASE + 175)
.set sys_rt_sigpending, (SYSCALL_BASE + 176)
.set sys_rt_sigtimedwait, (SYSCALL_BASE + 177)
.set sys_rt_sigqueueinfo, (SYSCALL_BASE + 178)
.set sys_rt_sigsuspend, (SYSCALL_BASE + 179)
.set sys_pread64, (SYSCALL_BASE + 180)
.set sys_pwrite64, (SYSCALL_BASE + 181)
.set sys_chown, (SYSCALL_BASE + 182)
.set sys_getcwd, (SYSCALL_BASE + 183)
.set sys_capget, (SYSCALL_BASE + 184)
.set sys_capset, (SYSCALL_BASE + 185)
.set sys_sigaltstack, (SYSCALL_BASE + 186)
.set sys_sendfile, (SYSCALL_BASE + 187)
.set sys_vfork, (SYSCALL_BASE + 190)
.set sys_ugetrlimit, (SYSCALL_BASE + 191)
.set sys_mmap2, (SYSCALL_BASE + 192)
.set sys_truncate64, (SYSCALL_BASE + 193)
.set sys_ftruncate64, (SYSCALL_BASE + 194)
.set sys_stat64, (SYSCALL_BASE + 195)
.set sys_lstat64, (SYSCALL_BASE + 196)
.set sys_fstat64, (SYSCALL_BASE + 197)
.set sys_lchown32, (SYSCALL_BASE + 198)
.set sys_getuid32, (SYSCALL_BASE + 199)
.set sys_getgid32, (SYSCALL_BASE + 200)
.set sys_geteuid32, (SYSCALL_BASE + 201)
.set sys_getegid32, (SYSCALL_BASE + 202)
.set sys_setreuid32, (SYSCALL_BASE + 203)
.set sys_setregid32, (SYSCALL_BASE + 204)
.set sys_getgroups32, (SYSCALL_BASE + 205)
.set sys_setgroups32, (SYSCALL_BASE + 206)
.set sys_fchown32, (SYSCALL_BASE + 207)
.set sys_setresuid32, (SYSCALL_BASE + 208)
.set sys_getresuid32, (SYSCALL_BASE + 209)
.set sys_setresgid32, (SYSCALL_BASE + 210)
.set sys_getresgid32, (SYSCALL_BASE + 211)
.set sys_chown32, (SYSCALL_BASE + 212)
.set sys_setuid32, (SYSCALL_BASE + 213)
.set sys_setgid32, (SYSCALL_BASE + 214)
.set sys_setfsuid32, (SYSCALL_BASE + 215)
.set sys_setfsgid32, (SYSCALL_BASE + 216)
.set sys_getdents64, (SYSCALL_BASE + 217)
.set sys_pivot_root, (SYSCALL_BASE + 218)
.set sys_mincore, (SYSCALL_BASE + 219)
.set sys_madvise, (SYSCALL_BASE + 220)
.set sys_fcntl64, (SYSCALL_BASE + 221)
.set sys_gettid, (SYSCALL_BASE + 224)
.set sys_readahead, (SYSCALL_BASE + 225)
.set sys_setxattr, (SYSCALL_BASE + 226)
.set sys_lsetxattr, (SYSCALL_BASE + 227)
.set sys_fsetxattr, (SYSCALL_BASE + 228)
.set sys_getxattr, (SYSCALL_BASE + 229)
.set sys_lgetxattr, (SYSCALL_BASE + 230)
.set sys_fgetxattr, (SYSCALL_BASE + 231)
.set sys_listxattr, (SYSCALL_BASE + 232)
.set sys_llistxattr, (SYSCALL_BASE + 233)
.set sys_flistxattr, (SYSCALL_BASE + 234)
.set sys_removexattr, (SYSCALL_BASE + 235)
.set sys_lremovexattr, (SYSCALL_BASE + 236)
.set sys_fremovexattr, (SYSCALL_BASE + 237)
.set sys_tkill, (SYSCALL_BASE + 238)
.set sys_sendfile64, (SYSCALL_BASE + 239)
.set sys_futex, (SYSCALL_BASE + 240)
.set sys_sched_setaffinity, (SYSCALL_BASE + 241)
.set sys_sched_getaffinity, (SYSCALL_BASE + 242)
.set sys_io_setup, (SYSCALL_BASE + 243)
.set sys_io_destroy, (SYSCALL_BASE + 244)
.set sys_io_getevents, (SYSCALL_BASE + 245)
.set sys_io_submit, (SYSCALL_BASE + 246)
.set sys_io_cancel, (SYSCALL_BASE + 247)
.set sys_exit_group, (SYSCALL_BASE + 248)
.set sys_lookup_dcookie, (SYSCALL_BASE + 249)
.set sys_epoll_create, (SYSCALL_BASE + 250)
.set sys_epoll_ctl, (SYSCALL_BASE + 251)
.set sys_epoll_wait, (SYSCALL_BASE + 252)
.set sys_remap_file_pages, (SYSCALL_BASE + 253)
.set sys_set_tid_address, (SYSCALL_BASE + 256)
.set sys_timer_create, (SYSCALL_BASE + 257)
.set sys_timer_settime, (SYSCALL_BASE + 258)
.set sys_timer_gettime, (SYSCALL_BASE + 259)
.set sys_timer_getoverrun, (SYSCALL_BASE + 260)
.set sys_timer_delete, (SYSCALL_BASE + 261)
.set sys_clock_settime, (SYSCALL_BASE + 262)
.set sys_clock_gettime, (SYSCALL_BASE + 263)
.set sys_clock_getres, (SYSCALL_BASE + 264)
.set sys_clock_nanosleep, (SYSCALL_BASE + 265)
.set sys_statfs64, (SYSCALL_BASE + 266)
.set sys_fstatfs64, (SYSCALL_BASE + 267)
.set sys_tgkill, (SYSCALL_BASE + 268)
.set sys_utimes, (SYSCALL_BASE + 269)
.set sys_arm_fadvise64_64, (SYSCALL_BASE + 270)
.set sys_pciconfig_iobase, (SYSCALL_BASE + 271)
.set sys_pciconfig_read, (SYSCALL_BASE + 272)
.set sys_pciconfig_write, (SYSCALL_BASE + 273)
.set sys_mq_open, (SYSCALL_BASE + 274)
.set sys_mq_unlink, (SYSCALL_BASE + 275)
.set sys_mq_timedsend, (SYSCALL_BASE + 276)
.set sys_mq_timedreceive, (SYSCALL_BASE + 277)
.set sys_mq_notify, (SYSCALL_BASE + 278)
.set sys_mq_getsetattr, (SYSCALL_BASE + 279)
.set sys_waitid, (SYSCALL_BASE + 280)
.set sys_socket, (SYSCALL_BASE + 281)
.set sys_bind, (SYSCALL_BASE + 282)
.set sys_connect, (SYSCALL_BASE + 283)
.set sys_listen, (SYSCALL_BASE + 284)
.set sys_accept, (SYSCALL_BASE + 285)
.set sys_getsockname, (SYSCALL_BASE + 286)
.set sys_getpeername, (SYSCALL_BASE + 287)
.set sys_socketpair, (SYSCALL_BASE + 288)
.set sys_send, (SYSCALL_BASE + 289)
.set sys_sendto, (SYSCALL_BASE + 290)
.set sys_recv, (SYSCALL_BASE + 291)
.set sys_recvfrom, (SYSCALL_BASE + 292)
.set sys_shutdown, (SYSCALL_BASE + 293)
.set sys_setsockopt, (SYSCALL_BASE + 294)
.set sys_getsockopt, (SYSCALL_BASE + 295)
.set sys_sendmsg, (SYSCALL_BASE + 296)
.set sys_recvmsg, (SYSCALL_BASE + 297)
.set sys_semop, (SYSCALL_BASE + 298)
.set sys_semget, (SYSCALL_BASE + 299)
.set sys_semctl, (SYSCALL_BASE + 300)
.set sys_msgsnd, (SYSCALL_BASE + 301)
.set sys_msgrcv, (SYSCALL_BASE + 302)
.set sys_msgget, (SYSCALL_BASE + 303)
.set sys_msgctl, (SYSCALL_BASE + 304)
.set sys_shmat, (SYSCALL_BASE + 305)
.set sys_shmdt, (SYSCALL_BASE + 306)
.set sys_shmget, (SYSCALL_BASE + 307)
.set sys_shmctl, (SYSCALL_BASE + 308)
.set sys_add_key, (SYSCALL_BASE + 309)
.set sys_request_key, (SYSCALL_BASE + 310)
.set sys_keyctl, (SYSCALL_BASE + 311)
.set sys_semtimedop, (SYSCALL_BASE + 312)
.set sys_vserver, (SYSCALL_BASE + 313)
.set sys_ioprio_set, (SYSCALL_BASE + 314)
.set sys_ioprio_get, (SYSCALL_BASE + 315)
.set sys_inotify_init, (SYSCALL_BASE + 316)
.set sys_inotify_add_watch, (SYSCALL_BASE + 317)
.set sys_inotify_rm_watch, (SYSCALL_BASE + 318)
.set sys_mbind, (SYSCALL_BASE + 319)
.set sys_get_mempolicy, (SYSCALL_BASE + 320)
.set sys_set_mempolicy, (SYSCALL_BASE + 321)
.set sys_openat, (SYSCALL_BASE + 322)
.set sys_mkdirat, (SYSCALL_BASE + 323)
.set sys_mknodat, (SYSCALL_BASE + 324)
.set sys_fchownat, (SYSCALL_BASE + 325)
.set sys_futimesat, (SYSCALL_BASE + 326)
.set sys_fstatat64, (SYSCALL_BASE + 327)
.set sys_unlinkat, (SYSCALL_BASE + 328)
.set sys_renameat, (SYSCALL_BASE + 329)
.set sys_linkat, (SYSCALL_BASE + 330)
.set sys_symlinkat, (SYSCALL_BASE + 331)
.set sys_readlinkat, (SYSCALL_BASE + 332)
.set sys_fchmodat, (SYSCALL_BASE + 333)
.set sys_faccessat, (SYSCALL_BASE + 334)
.set sys_pselect6, (SYSCALL_BASE + 335)
.set sys_ppoll, (SYSCALL_BASE + 336)
.set sys_unshare, (SYSCALL_BASE + 337)
.set sys_set_robust_list, (SYSCALL_BASE + 338)
.set sys_get_robust_list, (SYSCALL_BASE + 339)
.set sys_splice, (SYSCALL_BASE + 340)
.set sys_arm_sync_file_range, (SYSCALL_BASE + 341)
.set sys_tee, (SYSCALL_BASE + 342)
.set sys_vmsplice, (SYSCALL_BASE + 343)
.set sys_move_pages, (SYSCALL_BASE + 344)
.set sys_getcpu, (SYSCALL_BASE + 345)
.set sys_epoll_pwait, (SYSCALL_BASE + 346)
.set sys_kexec_load, (SYSCALL_BASE + 347)
.set sys_utimensat, (SYSCALL_BASE + 348)
.set sys_signalfd, (SYSCALL_BASE + 349)
.set sys_timerfd_create, (SYSCALL_BASE + 350)
.set sys_eventfd, (SYSCALL_BASE + 351)
.set sys_fallocate, (SYSCALL_BASE + 352)
.set sys_timerfd_settime, (SYSCALL_BASE + 353)
.set sys_timerfd_gettime, (SYSCALL_BASE + 354)
.set sys_signalfd4, (SYSCALL_BASE + 355)
.set sys_eventfd2, (SYSCALL_BASE + 356)
.set sys_epoll_create1, (SYSCALL_BASE + 357)
.set sys_dup3, (SYSCALL_BASE + 358)
.set sys_pipe2, (SYSCALL_BASE + 359)
.set sys_inotify_init1, (SYSCALL_BASE + 360)
.set sys_preadv, (SYSCALL_BASE + 361)
.set sys_pwritev, (SYSCALL_BASE + 362)
.set sys_rt_tgsigqueueinfo, (SYSCALL_BASE + 363)
.set sys_perf_event_open, (SYSCALL_BASE + 364)
.set sys_recvmmsg, (SYSCALL_BASE + 365)
.set sys_accept4, (SYSCALL_BASE + 366)
.set sys_fanotify_init, (SYSCALL_BASE + 367)
.set sys_fanotify_mark, (SYSCALL_BASE + 368)
.set sys_prlimit64, (SYSCALL_BASE + 369)
.set sys_name_to_handle_at, (SYSCALL_BASE + 370)
.set sys_open_by_handle_at, (SYSCALL_BASE + 371)
.set sys_clock_adjtime, (SYSCALL_BASE + 372)
.set sys_syncfs, (SYSCALL_BASE + 373)
.set sys_sendmmsg, (SYSCALL_BASE + 374)
.set sys_setns, (SYSCALL_BASE + 375)
.set sys_process_vm_readv, (SYSCALL_BASE + 376)
.set sys_process_vm_writev, (SYSCALL_BASE + 377)
.set sys_kcmp, (SYSCALL_BASE + 378)
.set sys_finit_module, (SYSCALL_BASE + 379)
.set sys_sched_setattr, (SYSCALL_BASE + 380)
.set sys_sched_getattr, (SYSCALL_BASE + 381)
.set sys_renameat2, (SYSCALL_BASE + 382)
.set sys_seccomp, (SYSCALL_BASE + 383)
.set sys_getrandom, (SYSCALL_BASE + 384)
.set sys_memfd_create, (SYSCALL_BASE + 385)
.set sys_bpf, (SYSCALL_BASE + 386)
.set sys_execveat, (SYSCALL_BASE + 387)
.set sys_userfaultfd, (SYSCALL_BASE + 388)
.set sys_membarrier, (SYSCALL_BASE + 389)
.set sys_mlock2, (SYSCALL_BASE + 390)
.set sys_copy_file_range, (SYSCALL_BASE + 391)
.set sys_preadv2, (SYSCALL_BASE + 392)
.set sys_pwritev2, (SYSCALL_BASE + 393)
.set sys_pkey_mprotect, (SYSCALL_BASE + 394)
.set sys_pkey_alloc, (SYSCALL_BASE + 395)
.set sys_pkey_free, (SYSCALL_BASE + 396)
.set sys_statx, (SYSCALL_BASE + 397)
.set sys_rseq, (SYSCALL_BASE + 398)
.set sys_io_pgetevents, (SYSCALL_BASE + 399)
.set sys_migrate_pages, (SYSCALL_BASE + 400)
.set sys_kexec_file_load, (SYSCALL_BASE + 401)
.set sys_clock_gettime64, (SYSCALL_BASE + 403)
.set sys_clock_settime64, (SYSCALL_BASE + 404)
.set sys_clock_adjtime64, (SYSCALL_BASE + 405)
.set sys_clock_getres_time64, (SYSCALL_BASE + 406)
.set sys_clock_nanosleep_time64, (SYSCALL_BASE + 407)
.set sys_timer_gettime64, (SYSCALL_BASE + 408)
.set sys_timer_settime64, (SYSCALL_BASE + 409)
.set sys_timerfd_gettime64, (SYSCALL_BASE + 410)
.set sys_timerfd_settime64, (SYSCALL_BASE + 411)
.set sys_utimensat_time64, (SYSCALL_BASE + 412)
.set sys_pselect6_time64, (SYSCALL_BASE + 413)
.set sys_ppoll_time64, (SYSCALL_BASE + 414)
.set sys_io_pgetevents_time64, (SYSCALL_BASE + 416)
.set sys_recvmmsg_time64, (SYSCALL_BASE + 417)
.set sys_mq_timedsend_time64, (SYSCALL_BASE + 418)
.set sys_mq_timedreceive_time64, (SYSCALL_BASE + 419)
.set sys_semtimedop_time64, (SYSCALL_BASE + 420)
.set sys_rt_sigtimedwait_time64, (SYSCALL_BASE + 421)
.set sys_futex_time64, (SYSCALL_BASE + 422)
.set sys_sched_rr_get_interval_time64, (SYSCALL_BASE + 423)
.set sys_pidfd_send_signal, (SYSCALL_BASE + 424)
.set sys_io_uring_setup, (SYSCALL_BASE + 425)
.set sys_io_uring_enter, (SYSCALL_BASE + 426)
.set sys_io_uring_register, (SYSCALL_BASE + 427)
.set sys_open_tree, (SYSCALL_BASE + 428)
.set sys_move_mount, (SYSCALL_BASE + 429)
.set sys_fsopen, (SYSCALL_BASE + 430)
.set sys_fsconfig, (SYSCALL_BASE + 431)
.set sys_fsmount, (SYSCALL_BASE + 432)
.set sys_fspick, (SYSCALL_BASE + 433)
.set sys_pidfd_open, (SYSCALL_BASE + 434)
.set sys_clone3, (SYSCALL_BASE + 435)
.set sys_close_range, (SYSCALL_BASE + 436)
.set sys_openat2, (SYSCALL_BASE + 437)
.set sys_pidfd_getfd, (SYSCALL_BASE + 438)
.set sys_faccessat2, (SYSCALL_BASE + 439)
.set sys_process_madvise, (SYSCALL_BASE + 440)
.set sys_epoll_pwait2, (SYSCALL_BASE + 441)
.set sys_mount_setattr, (SYSCALL_BASE + 442)
.set sys_quotactl_fd, (SYSCALL_BASE + 443)
.set sys_landlock_create_ruleset, (SYSCALL_BASE + 444)
.set sys_landlock_add_rule, (SYSCALL_BASE + 445)
.set sys_landlock_restrict_self, (SYSCALL_BASE + 446)
.set sys_process_mrelease, (SYSCALL_BASE + 448)
.endif
