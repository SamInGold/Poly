
EXEC: HashMap.o main.o
	g++ -o EXEC main.o HashMap.o  

HashMap.o: HashMap.cpp HashMap.h
	g++ -o HashMap.o -c HashMap.cpp

main.o : main.cpp HashMap.h
	g++ -o main.o -c main.cpp

clean : main.o HashMap.o EXEC
	rm EXEC
	rm *.o