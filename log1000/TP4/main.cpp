#include <iostream>
#include "HashMap.h"

using namespace std;

//Driver method to test map class 
int main(int argc, char** argv)
{ 
    HashMap *h = new HashMap(); 
    h->insertNode(1,1); 
    h->insertNode(2,2); 
    h->insertNode(2,3); 
    h->insertNode(22,3); 
    h->display(); 
    cout << h->sizeofMap() <<endl; 
    cout << h->deleteNode(2) << endl; 
    cout << h->sizeofMap() <<endl; 
    cout << h->isEmpty() << endl; 
    cout << h->get(2); 
  
    return 0; 
};


