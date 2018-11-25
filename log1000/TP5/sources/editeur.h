#ifndef EDITEUR_H
#define EDITEUR_H

#include <string>

using namespace std;
        
// Cette classe représente un article
class Editeur {
public:
    Editeur(){};
    Editeur(string name, string codePostal, string adresse);
    string getName();
    string getCodePostal();
    string getAddress();
    
    void setName(string name);
    void setCodePostal(string codePostal);
    void setAddress(string adresse);
 
    
private:
    
    // Informations sur l'éditeur de l'article
    string name_;
    string codePostal_;
    string adresse_;
    
};

#endif 
