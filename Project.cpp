
#include<string>
#include<iostream>
using namespace std;
/* 
    Não recebi confirmações acerca do uso da biblioteca string ,
    trata-se de uma biblioteca de C++ , porém já vi pessoas afirmarem
    que a autorização foi permitida em periodos passados.

    Nota : Aos desenvolvendores  <- devido ao uso da bilioteca string 
    deve-se usar o Iostream de c++ , tal qual entrada e saída sao trabalhadas
    por meio de cin  , cout .


    Para compilar , deve-se usar  g++ [nome do arquivo].cpp -o target 
    Para rodar em ambiente unix , diferente do windows , ./target  (pós compilação)

    Tais comandos so funcionam perante a compilação inicial do comando  
    "using namespace std"

    Alterando apenas para commit de teste, so fiz retirar o github do Alex lá no Readme 
    até pq ele desistiu da cadeira né
*/ 

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
    
};


struct AnuncioPerdido
{
    string ondeEsqueceu;
    struct data quandoPerdeu; 
    string dono;
    string nomePertence;
    string descricaoObjeto;

};

void showDate(struct data date){

    cout << date.dia << "/" << date.mes <<  endl;
    
}


struct data  criaData(int dia , int mes){
    struct data date ;
    // Pode melhorar metodo de verificação ;  
    if( (dia > 0 ) && (dia < 31 ) && ( mes > 0) && (mes <= 12) ){
            date.dia  = dia;
            date.mes  = mes;
    }   
        return date ;
} ;


// O uso da Main é voltado a Ideia de um facade / Controller  ; 

int main(){
        struct AnuncioEncontrado  encontrados[10];
        struct AnuncioPerdido  perdidos[10];
        struct data  date = criaData(25,10);
        //showDate(date);


        
 return 0 ; 
}



