CC      = gcc
CFLAGS  = -g3 -std=gnu99 -pedantic -Wall
LFLAGS  = -L/usr/local/lib/cairo/ -lcairo  
IFLAGS  = -I/usr/local/include/cairo/
RM      = rm -f

default: all

all: main

main: main.o
	${CC} ${CFLAGS} -o $@ $^ 

main.o: main.c

valgrind: main
	valgrind -q —-tool=memcheck —leak-check=yes ./main

clean:
	$(RM) main *.o
	