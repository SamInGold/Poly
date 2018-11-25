
article: Article.o main.o Editeur.o
	g++ -o Article main.o Article.o Editeur.o

Article.o: Article.cpp Article.h editeur.h
	g++ -o Article.o -c Article.cpp

Editeur.o: editeur.cpp editeur.h
	g++ -o Editeur.o -c editeur.cpp

main.o: main.cpp Article.h editeur.h
	g++ -o main.o -c main.cpp
 
clean: 
	rm *.o
	rm Article
