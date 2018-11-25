#include "editeur.h"

Editeur::Editeur(string name, string codePostal, string adresse){
	name_ = name;
    codePostal_ = codePostal;
    adresse_ = adresse;
}

string Editeur::getName(){
	return name_;
}

string Editeur::getCodePostal(){
	return codePostal_;
}

string Editeur::getAddress(){
	return adresse_;
}

void Editeur::setName(string name){
	name_ = name;
}

void Editeur::setCodePostal(string codepostal){
	codePostal_ = codepostal;
}

void Editeur::setAddress(string adresse){
	adresse_=adresse;
}
