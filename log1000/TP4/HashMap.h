#ifndef HASHMAP_H
#define	HASHMAP_H

#include"HashNode.h"

using namespace std; 
    
//Our own Hashmap class 
class HashMap 
{
    public: 
    HashMap();
    
    int hashCode(int key);
    //Function to add key value pair 
    void insertNode(int key, int value);
      
    //Function to delete a key value pair 
    int deleteNode(int key);
      
    //Function to search the value for a given key 
    int get(int key);
      
    //Return current size  
    int sizeofMap();
      
    //Return true if size is 0 
    bool isEmpty();
    //Function to display the stored key value pairs 
    void display();
    
    private:
    //hash element array 
    HashNode**arr; 
    int capacity; 
    //current size 
    int size; 
    //dummy node 
    HashNode*dummy; 
  
};
#endif	/* HASHMAP_H */
  
