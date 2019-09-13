#include<iostream>
#include<string>
using namespace std ;
struct data
{
    int dia;
    int mes;
};

struct AnuncioEncontrado
{
    string local;
    struct data data;
    string quemEncontrou;
    string nomePertence;
    string descricaoObjeto;
    string categoria;


};


struct AnuncioPerdido
{
    string ondeEsqueceu;
    struct data quandoPerdeu;
    string dono;
    string nomePertence;
    string descricaoObjeto;
    string categoria ; 

};

struct AnuncioDevolvido
{
    struct data quandoDevolvido;
    string dono;
    string quemEncontrou;
    string nomePertence;
    string descricaoObjeto;
    string categoria; 

};
