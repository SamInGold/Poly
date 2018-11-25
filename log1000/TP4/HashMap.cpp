#include"HashMap.h"
#include <iostream>

using namespace std; 


    HashMap::HashMap() 
    { 
        //Initial capacity of hash array 
        capacity = 20; 
        size=0; 
        arr = new HashNode*[capacity]; 
          
        //Initialise all elements of array as NULL 
        for(int i=0 ; i < capacity ; i++) 
            arr[i] = NULL; 
          
        //dummy node with value and key -1 
        dummy = new HashNode(-1, -1); 
    } 
    // This implements hash function to find index 
    // for a key 
    int HashMap::hashCode(int key) 
    { 
        return key % capacity; 
    } 
      
    //Function to add key value pair 
 
    void HashMap::insertNode(int key, int value) 
    { 
        HashNode* temp = new HashNode(key, value); 
          
        // Apply hash function to find index for given key 
        int hashIndex = hashCode(key); 
          
        //find next free space  
        while(arr[hashIndex] != NULL && arr[hashIndex]->getKey() != key 
               && arr[hashIndex]->getKey() != -1) 
        { 
            hashIndex++; 
            hashIndex %= capacity; 
        } 
          
        //if new node to be inserted increase the current size 
        if(arr[hashIndex] == NULL || arr[hashIndex]->getKey() == -1) 
            size++; 
        arr[hashIndex] = temp; 
    } 
      
    //Function to delete a key value pair 
    //template<typename K, typename V> 
    int HashMap::deleteNode(int key) 
    { 
        // Apply hash function to find index for given key 
        int hashIndex = hashCode(key); 
          
        //finding the node with given key 
        while(arr[hashIndex] != NULL) 
        { 
            //if node found 
            if(arr[hashIndex]->getKey() == key) 
            { 
                HashNode*temp = arr[hashIndex]; 
                  
                //Insert dummy node here for further use 
                arr[hashIndex] = dummy; 
                  
                // Reduce size 
                size--; 
                return temp->getValue(); 
            } 
            hashIndex++; 
            hashIndex %= capacity; 
  
        } 
          
        //If not found return 0 
        return 0; 
    } 
      
    //Function to search the value for a given key 
    //template<typename K, typename V> 
    int HashMap::get(int key) 
    { 
        // Apply hash function to find index for given key 
        int hashIndex = hashCode(key); 
        int counter=0; 
        //finding the node with given key    
        while(arr[hashIndex] != NULL) 
        {   
             if(counter++>capacity)  //to avoid infinite loop 
                return 0;         
            //if node found return its value 
            if(arr[hashIndex]->getKey() == key) 
                return arr[hashIndex]->getValue(); 
            hashIndex++; 
            hashIndex %= capacity; 
        } 
          
        //If not found return null 
        return 0; 
    } 
      
    //Return current size 
    int HashMap::sizeofMap() 
    { 
        return size; 
    } 
      
    //Return true if size is 0 
    //template<typename K, typename V> 
    bool HashMap::isEmpty() 
    { 
        return size == 0; 
    } 
      
    //Function to display the stored key value pairs 
    //template<typename K, typename V> 
    void HashMap::display() 
    { 
        for(int i=0 ; i<capacity ; i++) 
        { 
            if(arr[i] != NULL && arr[i]->getKey() != -1) 
                cout << "key = " << arr[i]->getKey()  
                     <<"  value = "<< arr[i]->getValue() << endl; 
        } 
    } 
