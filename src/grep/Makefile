CC = gcc

all: clean s21_grep

s21_grep:
	$(CC) s21_grep.c -o s21_grep

clean:
	rm -rf s21_grep
	rm -rf .clang-format
	
leaks: s21_grep
	CK_FORK=no leaks --atExit -- ./s21_grep 1.txt

test: s21_grep
	chmod +x s21_grep.sh
	./s21_grep.sh

check:
	cp ../../materials/linters/.clang-format .clang-format
	clang-format -n --verbose *.c