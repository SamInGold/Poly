CXX = g++
INCLUDES= -I./
CXXFLAGS = -g $(INCLUDES)
SRCM= ../Article.cpp
OBJM = $(SRCM:.cpp=.o)
SRCM2= ../editeur.cpp
OBJM2 = $(SRCM2:.cpp=.o)
LINKFLAGS= -lcppunit

ArticleTests: ArticleTest.h main.cpp $(OBJM) $(OBJM2)
	$(CXX) $(CXXFLAGS) -o $@ main.cpp $(OBJM) $(OBJM2) $(LINKFLAGS) $(LINKFLAGSLOG4) $(LIBLOG)

.cpp.o:
	$(CXX) $(CXXFLAGS) -c $< -o $@

