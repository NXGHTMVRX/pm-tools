#define _GNU_SOURCE
#include <sys/prctl.h>
#include <unistd.h>
#include <sys/wait.h>
#include <errno.h>

int main(int argc, char *argv[]) {
  (void) argc;

  prctl(PR_SET_CHILD_SUBREAPER, 1, 0, 0, 0, 0);

  pid_t p;
  switch ((p = fork())) {
    case -1: return 255;
    case  0: execvp(argv[1], argv+1); _exit(127);
  }

  int status;
  do { wait(&status); } while (errno != ECHILD);

  return WEXITSTATUS(status);
}
