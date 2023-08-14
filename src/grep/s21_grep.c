#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#define buff_size 1024

typedef struct flags {
  int e;
  int i;
  int v;
  int c;
  int l;
  int n;
  int h;
  int s;
} flag;

int s21_read_grep(char *argv[], flag *flags, regex_t regex, int name, int e);
int main(int argc, char *argv[]) {
  struct flags flag = {0};
  int longindex = 0;
  int opt = 0;
  int e = 1;
  char search[buff_size] = {0};
  regex_t regex;
  int regflags = 0;
  while ((opt = getopt_long(argc, argv, "e:ivclnhs", NULL, &longindex)) != -1) {
    switch (opt) {
      case 'e':
        flag.e = 1;
        snprintf(search, buff_size, optarg);
        e = 0;
        break;
      case 'i':
        flag.i = 1;
        regflags = REG_ICASE;
        break;
      case 'v':
        flag.v = 1;
        break;
      case 'c':
        flag.c = 1;
        break;
      case 'l':
        flag.l = 1;
        break;
      case 'n':
        flag.n = 1;
        break;
      case 'h':
        flag.h = 1;
        break;
      case 's':
        flag.s = 1;
        break;
      default:
        break;
    }
  }
  if (e) {
    snprintf(search, buff_size, argv[optind]);
  }
  regcomp(&regex, search, regflags);
  int name;
  name = argc - optind;
  while (optind < argc) {
    s21_read_grep(argv, &flag, regex, name, e);
    optind++;
  }
  regfree(&regex);
  return 0;
}

int s21_read_grep(char *argv[], flag *flags, regex_t regex, int name, int e) {
  FILE *fp;
  ssize_t read;
  char *line = NULL;
  size_t len = 0;
  int success = REG_NOMATCH;
  int comp = 0;
  int count = 0;
  int i = 0;
  if ((fp = fopen(argv[optind], "r"))) {
    while ((read = getline(&line, &len, fp)) != EOF) {
      count++;
      success = regexec(&regex, line, 0, NULL, 0);
      if (success == 0 && (flags->v == 0)) {
        i++;
        if (name > 1 && !flags->l && !flags->c && !flags->h && e == 0) {
          printf("%s:", argv[optind]);
        }
        if (name > 2 && !flags->l && !flags->c && !flags->h && e == 1) {
          printf("%s:", argv[optind]);
        }
        if (flags->n) {
          printf("%d:", count);
        }
        if (flags->l) {
          printf("%s\n", argv[optind]);
          break;
        }
        if (flags->c) {
          continue;
        }
        printf("%s", line);
      }
      if (flags->v) {
        comp = REG_NOMATCH;
        if (success == comp) {
          if (name > 1 && !flags->l && e == 0) {
            printf("%s:", argv[optind]);
          }
          if (name > 2 && !flags->l && e == 1) {
            printf("%s:", argv[optind]);
          }
          printf("%s", line);
        }
      }
    }
    if (flags->c) {
      if (name > 1 && e == 0) {
        printf("%s:", argv[optind]);
      }
      if (name > 2 && e == 1) {
        printf("%s:", argv[optind]);
      }
      printf("%d\n", i);
    }
    fclose(fp);
  }
  if (line) {
    free(line);
  }

  return 0;
}
