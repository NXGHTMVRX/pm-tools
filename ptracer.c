#include <sys/prctl.h>
#include <unistd.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  (void) argc;
  prctl(PR_SET_PTRACER, atoi(argv[1]), 0, 0, 0);
  execvp(argv[2], argv+2);
}
