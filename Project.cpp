#include "funções.cpp"
#include<string>
#include<iostream>
#include <stdlib.h>
#include <locale.h>
using namespace std;
/*
    Não recebi confirmações acerca do uso da biblioteca string ,
    trata-se de uma biblioteca de C++ , porém já vi pessoas afirmarem
    que a autorização foi permitida em periodos passados.

    Nota : Aos desenvolvendores  <- devido ao uso da bilioteca string
    deve-se usar o Iostream de c++ , tal qual entrada e saída sao trabalhadas
    por meio de cin  , cout .
void showDate(struct data date){

    cout << date.dia << "/" << date.mes <<  endl;

}


    Para compilar , deve-se usar  g++ [nome do arquivo].cpp -o target
    Para rodar em ambiente unix , diferente do windows , ./target  (pós compilação)

    Tais comandos so funcionam perante a compilação inicial do comando
    "using namespace std"
*/

// O uso da Main é voltado a Ideia de um facade / Controller  ;

int main(){
        setlocale(LC_ALL, "Portuguese");
        int sizeofVector = 1000;
        int perdidosIndex, encontradosIndex = 0;
        struct AnuncioEncontrado  encontrados[1000];
        struct AnuncioPerdido  perdidos[1000];
        showMenu(perdidos ,&perdidosIndex ,encontrados, &encontradosIndex ,sizeofVector);




 return 0 ;
}
