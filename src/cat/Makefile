CC = gcc -Wextra -Werror -Wall

all: clean s21_cat

s21_cat:
	$(CC) s21_cat.c -o s21_cat

clean:
	rm -rf s21_cat
	rm -rf .clang-format

test: s21_cat
	chmod +x s21_cat.sh
	./s21_cat.sh

leaks: s21_cat
	CK_FORK=no leaks --atExit -- ./s21_cat 1.txt

check:
	cp ../../materials/linters/.clang-format .clang-format
	clang-format -n --verbose *.c

