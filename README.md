PM-tools
========

Small linux tools to manage processes.

To build them, just run `make`.




Waiter
------

Waiter waits for any pid, not just your children, with 0 overhead.

Usage:

    $ waiter 1234

Notes:
- Requires linux >= 3.4
- Works by attaching with `ptrace(PTRACE_SEIZE, ...)`, which still requires
  `CAP_SYS_PTRACE`, but unlike `PTRACE_SEIZE` it can't be prevented by
  `prctl(PR_SET_DUMPABLE, 0, ...)`



Nosudo
------

Nosudo runs a program and prevents it from gaining new privileges.

Usage:

    $        sudo whoami
    $ nosudo sudo whoami

Notes:
- Requires linux >= 3.5
- Works by calling `prctl(PR_SET_NO_NEW_PRIVS, 1, ...)`



Nochildren
----------

Nochildren runs a program until it exits, then it kills any leftovers.

Usage:

    $            bash -c 'sleep 1 & echo $!; sleep 1 & echo $!'; ps
    $ nochildren bash -c 'sleep 1 & echo $!; sleep 1 & echo $!'; ps

Notes:
- Requires linux >= 3.4
- Works by calling `prctl(PR_SET_CHILD_SUBREAPER, 1, ...)`


Subreaper
----------

Similar to nochildren, just waits for all the children.



Ptracer
-------

Ptracer runs a program and lets you specify a pid that will then be able to ptrace it.

Usage:

    $ ptracer 1234 sleep 1h

Notes:
- Requires linux >= 3.4
- Works by calling `prctl(PR_SET_PTRACER, pid, ...)`
- Using -1 as the pid makes it ptraceable by anyone
