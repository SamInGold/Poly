#ifndef ARTICLE_H
#define ARTICLE_H

#include <string>
#include "editeur.h"

using namespace std;
        
// Cette classe représente un article
class Article {
public:
    // Constructeurs
    Article () {}
    Article(string, string, Editeur* editeur);
    
    // Setters
    void setName(string);
    void setAuteur(string);
    
    void associerEditeur (Editeur* editeur);
    
    // Getters
    string getName();
    string getAuteur();
    
    Editeur* getEditeur();
    
    // Enregistrer l'article
    void saveArticle(string);
    // Afficher l'article
    void afficher();
    // Chercher un article dans une base de données par nom
    Article* trouverArticle(string, string);
    
private:
	//Méthode pour prendre les différente attribut de l'article depuis la DB
	void getArticleInfoFromDB(const string& line,string& articleInfo, int& cursorPosition); 
	
	
	
    // Information sur l'article
    string name;
    string auteur;
    
    Editeur* editeur_;
};

#endif 
