#include <getopt.h>
#include <stdio.h>
#include <unistd.h>

typedef struct flags {
  int b;
  int e;
  int n;
  int s;
  int t;
  int v;
} flag;

int s21_read(char *argv[], flag *flags);

int main(int argc, char *argv[]) {
  struct flags flag = {0};
  int longindex = 0;
  int opt = 0;
  struct option longopts[] = {{"number-nonblank", 0, 0, 'b'},
                              {"number", 0, 0, 'n'},
                              {"squeeze-blank", 0, 0, 's'},
                              {0, 0, 0, 0}};
  while ((opt = getopt_long(argc, argv, "beEnstTv", longopts, &longindex)) !=
         -1) {
    switch (opt) {
      case 'b':
        flag.b = 1;
        break;
      case 'e':
        flag.e = 1;
        flag.v = 1;
        break;
      case 'E':
        flag.e = 1;
        break;
      case 'n':
        flag.n = 1;
        break;
      case 's':
        flag.s = 1;
        break;
      case 't':
        flag.t = 1;
        flag.v = 1;
        break;
      case 'T':
        flag.t = 1;
        break;
      case 'v':
        flag.v = 1;
        break;
    }
  }
  if (flag.b == 1) {
    flag.n = 0;
  }
  while (optind < argc) {
    s21_read(argv, &flag);
    optind++;
  }
  return 0;
}

int s21_read(char *argv[], flag *flags) {
  FILE *fp;
  char ch;
  int i = 0;
  char before = '\n';
  int cout = 1;
  fp = fopen(argv[optind], "r");
  if (fp != NULL) {
    while ((ch = getc(fp)) != EOF) {
      if (flags->s) {
        if (ch == '\n') {
          i++;
          if (i == 3) {
            i--;
            continue;
          }
        } else {
          i = 0;
        }
      }
      if (flags->n && before == '\n') {
        printf("%6d\t", cout++);
      }
      if (flags->b && ch != '\n' && before == '\n') {
        printf("%6d\t", cout++);
      }
      if (flags->t && ch == '\t') {
        printf("^");
        ch = 'I';
      }
      if (flags->e && ch == '\n') {
        printf("$");
      }
      if (flags->v) {
        if ((ch >= 0 && ch < 9) || (ch > 10 && ch < 32)) {
          printf("^");
          ch = ch + 64;
        }
      }
      printf("%c", ch);
      before = ch;
    }
  }
  fclose(fp);
  return 0;
}
