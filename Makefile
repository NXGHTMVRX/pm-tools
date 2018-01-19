CFLAGS= -O2 -Wall -Wextra -std=c99

all: waiter nosudo nochildren subreaper ptracer
	
waiter: waiter.c
	uname -rs | awk -F'[ .]' '$$1 != "Linux" || $$2 < 3 || ($$2 == 3 && $$3 < 4) { exit 1 }'
	$(CC) $(CFLAGS) $(LDFLAGS) waiter.c -o waiter
	sudo setcap cap_sys_ptrace+ep waiter

nosudo: nosudo.c
	$(CC) $(CFLAGS) $(LDFLAGS) nosudo.c -o nosudo

nochildren: nochildren.c
	$(CC) $(CFLAGS) $(LDFLAGS) nochildren.c -o nochildren

subreaper: subreaper.c
	$(CC) $(CFLAGS) $(LDFLAGS) subreaper.c -o subreaper

ptracer: ptracer.c
	$(CC) $(CFLAGS) $(LDFLAGS) ptracer.c -o ptracer
