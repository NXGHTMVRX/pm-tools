CFLAGS= -O2 -Wall -Wextra -std=c99

all: waiter nosudo
	
waiter: waiter.c
	uname -rs | awk -F'[ .]' '$$1 != "Linux" || $$2 < 3 || ($$2 == 3 && $$3 < 4) { exit 1 }'
	$(CC) $(CFLAGS) $(LDFLAGS) waiter.c -o waiter
	sudo setcap cap_sys_ptrace+ep waiter

nosudo: nosudo.c
	$(CC) $(CFLAGS) $(LDFLAGS) nosudo.c -o nosudo
