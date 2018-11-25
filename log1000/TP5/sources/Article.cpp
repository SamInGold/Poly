#include "Article.h"

#include <fstream>
#include <iostream>

// Constructeur
Article::Article (string name,
                  string auteur,
                 Editeur * editeur) {
    // Article information
    this->name = name;
    this->auteur = auteur;
    
    // Editeur information
    this->editeur_ = editeur;
    
}

// Setters
void Article::setName(string name) {
    this->name = name;
}
void Article::setAuteur(string auteur) {
    this->auteur = auteur;
}

// Associer un editeur à l'article
void Article::associerEditeur (Editeur * editeur) {
    this->editeur_ = editeur;
}


// Getters
string Article::getName() {
    return this->name;
}
string Article::getAuteur() {
    return this->auteur;
}


Editeur* Article::getEditeur(){
	return editeur_;
}


// Enregistrer l'article dans un fichier
void Article::saveArticle (string fileName) {

    ofstream outfile (fileName, std::ofstream::binary);
    
    // allocate memory for file content
    int size = (this->name + ","
                + this->auteur + ","
                + this->editeur_->getName() + ","
                + this->editeur_->getCodePostal() + ","
                + this->editeur_->getAddress() + "\n" ).length();
    
    // write to outfile
    outfile.write ((this->name + ","
                   + this->auteur + ","
                   + this->editeur_->getName() + ","
                   + this->editeur_->getCodePostal() + ","
                   + this->editeur_->getAddress() + "\n").c_str(),size);
    
    
    outfile.close();
}

// Trouver un article avec son nom dans la base de données DB
Article* Article::trouverArticle (string DB, string name) {
    
    ifstream fichier(DB.c_str(), ios::in); // Ouvrir le fichier "DB.txt"
    
    if(fichier)
    {
        string line;
        // Lire les articles, un article par ligne dans la base de données (DB.txt)
        while (getline(fichier, line)) {
            string nameDB;
            // Récupérer le nom de l'article
            int cursorPosition = 0;
            getArticleInfoFromDB(line,nameDB,cursorPosition);
          
            
            // Si l'article qu'on lit actuellement est celui qu'on cherche
            if (nameDB == name) {
                
                // Récupérer le nom de l'auteur
                string auteurDB;
                getArticleInfoFromDB(line,auteurDB,cursorPosition);
                
                //  Récupérer le nom de l'éditeur
                string editeurNameDB;
                getArticleInfoFromDB(line,editeurNameDB,cursorPosition);
                
                // Récupérer le code postale de l'éditeur
                string editeurCodePostalDB;
                getArticleInfoFromDB(line,editeurCodePostalDB,cursorPosition);
                
                // Récupérer l'addresse de l'éditeur
                string editeurAddressDB;
                getArticleInfoFromDB(line,editeurAddressDB,cursorPosition);
               
                // Créer un objet de type article avec les informations récupérées
                Article *a = new Article(nameDB, auteurDB, new Editeur(editeurNameDB, editeurCodePostalDB, editeurAddressDB));
                // Fermer la base de données
                fichier.close();
                // Retourner l'article sélectionné
                return a;
            }
        }
        // Fermer la base de données
        fichier.close();
    }
    // Si l'article est innexistant, on retourne NULL
    return NULL;

}

// Afficher l'article
void Article::afficher() {
    std::cout << "Name : " << this->name << std::endl;
    std::cout << "Autheur : " << this->auteur << std::endl;
    std::cout << "Editeur name : " << this->editeur_->getName() << std::endl;
    std::cout << "Editeur code postale : " << this->editeur_->getCodePostal() << std::endl;
    std::cout << "Editeur address : " << this->editeur_->getAddress() << std::endl;
}



void Article::getArticleInfoFromDB(const string& line,string& articleInfo, int& cursorPosition){
	 for (; cursorPosition < line.length() ; cursorPosition++) {
        if (line[cursorPosition] != ',') {
            articleInfo += line[cursorPosition];
        } else {
			break;
		}
     }
     //Pour passer la ','
     cursorPosition++;
}


