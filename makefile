.DEFAULT_GOAL: all

.SILENT:

all:	Test2a Test2b Test2c Test3


CC = g++
CFLAGS = -Wall -std=c++17
DEBUG_FLAGS = -DDEBUG 

Test2a:	Test2a.cpp Car.o Model.o Option.o
		g++ Test2a.cpp Car.o Model.o  Option.o -o Test2a
		$(CC) $(CFLAGS) $(DEBUG_FLAGS) Test2a.cpp Car.o Model.o Option.o -o Test2a
		echo compilation Test2a.cpp


Test2b:	Test2b.cpp Car.o Model.o Option.o
		g++ Test2b.cpp Car.o Model.o  Option.o -o Test2b
		$(CC) $(CFLAGS) $(DEBUG_FLAGS) Test2b.cpp Car.o Model.o Option.o -o Test2b
		echo compilation Test2b.cpp

Test2c:	Test2c.cpp Car.o Model.o Option.o
		g++ Test2c.cpp Car.o Model.o Option.o -o Test2c
		$(CC) $(CFLAGS) $(DEBUG_FLAGS) Test2b.cpp Car.o Model.o Option.o -o Test2c
		echo compilation Test2c.cpp

Test3:	Test3.cpp Model.o Car.o Option.o
		g++ Test3.cpp Model.o Car.o Option.o -o Test3
		$(CC) $(CFLAGS) $(DEBUG_FLAGS) Test3.cpp Car.o Model.o Option.o -o Test3
		echo compilation Test3.cpp

Car.o:	Car.cpp Car.h
		g++ Car.cpp -c
		$(CC) $(CFLAGS) $(DEBUG_FLAGS) -c Car.cpp
		echo compilation Car.cpp

Model.o:	Model.cpp Model.h
			g++ Model.cpp -c
			$(CC) $(CFLAGS) $(DEBUG_FLAGS) -c Model.cpp
			echo compilation Model.o

Option.o:	Option.cpp Option.h
			g++ Option.cpp -c
			$(CC) $(CFLAGS) $(DEBUG_FLAGS) -c Option.cpp
			echo compilation Option.cpp

clean:
	rm -r -f *.o Test2a Test2b Test2c Test3

clobber:	clean

