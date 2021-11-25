# _*_ MakeFile _*_
.POSIX:
.SUFFIX:
CC=gcc
FLAGS=-Wall -Wextra -g -pedantic
LDLIBS=

all: main

main: main.o
	${CC} ${FLAGS} -o a main.o ${LDLIBS}

main.o: main.c
	${CC} -c main.c

clean:
	rm -f *.o main
