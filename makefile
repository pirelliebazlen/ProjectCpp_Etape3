.DEFAULT_GOAL: all

.SILENT:

all:	Test3


COMP = g++ -Wall -std=c++17 #-DDEBUG 



Test3:	Test3.cpp Model.o Car.o Option.o
		g++ Test3.cpp Model.o Car.o Option.o -o Test3
		$(COMP) Test3.cpp Car.o Model.o Option.o -o Test3
		echo compilation Test3.cpp

Car.o:	Car.cpp Car.h
		g++ Car.cpp -c
		$(COMP) -c Car.cpp
		echo compilation Car.cpp

Model.o:	Model.cpp Model.h
			g++ Model.cpp -c
			$(COMP) -c Model.cpp
			echo compilation Model.o

Option.o:	Option.cpp Option.h
			g++ Option.cpp -c
			$(COMP)  -c Option.cpp
			echo compilation Option.cpp

clean:
	rm -r -f *.o Test3

clobber:	clean

