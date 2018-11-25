#ifndef HASHNODE_H
#define	HASHNODE_H

#include <string>

using namespace std; 

class HashNode {
public:

	//Constructor of hashnode  
    HashNode(int key, int value) 
    { 
        this->value = value; 
        this->key = key; 
    } 

    int getKey() const {
        return key;
    }

    int getValue() const {
        return value;
    }

    void setValue(int value) {
        HashNode::value = value;
    }

private:
    // key-value pair
    int value;
    int key;
};

#endif	/* HASHNODE_H */