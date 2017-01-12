#include <sys/prctl.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  (void) argc;
  prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
  execvp(argv[1], argv+1);
}
