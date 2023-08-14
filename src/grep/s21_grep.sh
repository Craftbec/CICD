#!/bin/bash
    echo "TEST e"
    ./s21_grep -e A 1.txt >s21_grep_result
    grep -e A 1.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST ie"
    ./s21_grep -ie A 1.txt >s21_grep_result
    grep -ie A 1.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST ve"
    ./s21_grep -ve A 1.txt >s21_grep_result
    grep -ve A 1.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST ce"
    ./s21_grep -ce A 1.txt >s21_grep_result
    grep -ce A 1.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST le"
    ./s21_grep -le A 1.txt >s21_grep_result
    grep -le A 1.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST ne"
    ./s21_grep -ne A 1.txt >s21_grep_result
    grep -ne A 1.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST he"
    ./s21_grep -he A 1.txt >s21_grep_result
    grep -he A 1.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST se"
    ./s21_grep -se A 1.txt >s21_grep_result
    grep -se A 1.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST i"
    ./s21_grep -i A 1.txt >s21_grep_result
    grep -ie A 1.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST v"
    ./s21_grep -v A 1.txt >s21_grep_result
    grep -ve A 1.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST c"
    ./s21_grep -c A 1.txt >s21_grep_result
    grep -ce A 1.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST l"
    ./s21_grep -le A 1.txt >s21_grep_result
    grep -le A 1.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST n"
    ./s21_grep -n A 1.txt >s21_grep_result
    grep -ne A 1.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST h"
    ./s21_grep -h A 1.txt >s21_grep_result
    grep -he A 1.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST s"
    ./s21_grep -s A 1.txt >s21_grep_result
    grep -s A 1.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST2 ie"
    ./s21_grep -ie A 1.txt 2.txt >s21_grep_result
    grep -ie A 1.txt 2.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST2 ve"
    ./s21_grep -ve A 1.txt 2.txt >s21_grep_result
    grep -ve A 1.txt 2.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST2 ce"
    ./s21_grep -ce A 1.txt 2.txt >s21_grep_result
    grep -ce A 1.txt 2.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST2 le"
    ./s21_grep -le A 1.txt 2.txt >s21_grep_result
    grep -le A 1.txt 2.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST2 ne"
    ./s21_grep -ne A 1.txt 2.txt >s21_grep_result
    grep -ne A 1.txt 2.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST he"
    ./s21_grep -he A 1.txt >s21_grep_result
    grep -he A 1.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST se"
    ./s21_grep -se A 1.txt >s21_grep_result
    grep -se A 1.txt >grep_result
    diff -s s21_grep_result grep_result
    

    echo "TEST2 i"
    ./s21_grep -i A 1.txt 2.txt >s21_grep_result
    grep -i A 1.txt 2.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST2 v"
    ./s21_grep -v A 1.txt 2.txt >s21_grep_result
    grep -ve A 1.txt 2.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST2 c"
    ./s21_grep -c A 1.txt 2.txt >s21_grep_result
    grep -c A 1.txt 2.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST2 l"
    ./s21_grep -l A 1.txt 2.txt >s21_grep_result
    grep -l A 1.txt 2.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST2 n"
    ./s21_grep -n A 1.txt 2.txt >s21_grep_result
    grep -n A 1.txt 2.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST2 h"
    ./s21_grep -h A 1.txt 2.txt >s21_grep_result
    grep -h A 1.txt 2.txt >grep_result
    diff -s s21_grep_result grep_result

    echo "TEST2 s"
    ./s21_grep -s A 1.txt 2.txt >s21_grep_result
    grep -s A 1.txt 2.txt >grep_result
    diff -s s21_grep_result grep_result

rm -rf s21_grep_result grep_result