Waiter
------

Waiter waits for any pid, not just your children, with 0 overhead.

Usage:

    $ waiter 1234

Notes:
- Requires linux >= 3.4
- Works by attaching with ptrace(PTRACE_SEIZE, ...), which is safer
  than PTRACE_ATTACH, but it still requires CAP_SYS_PTRACE
- PTRACE_SEIZE can't be prevented by prctl(PR_SET_DUMPABLE, 0, ...)



Nosudo
------

Nosudo runs a program and prevents it from gaining new privileges.

Usage:

    $        sudo whoami
    $ nosudo sudo whoami

Notes:
- Requires linux >= 3.5
- Works by calling prctl(PR_SET_NO_NEW_PRIVS, 1, ...)



Nochildren
----------

Nochildren runs a program until it exits, then it kills any leftovers

Usage:

    $            bash -c 'sleep 1 & echo $!; sleep 1 & echo $!'; ps
    $ nochildren bash -c 'sleep 1 & echo $!; sleep 1 & echo $!'; ps

Notes:
- Requires linux >= 3.4
- Works by calling prctl(PR_SET_CHILD_SUBREAPER, 1, ...)
