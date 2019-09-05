#include<string>
#include<iostream>
#include "models.cpp"

struct data  criaData(int dia , int mes){
    struct data date ;
    // Pode melhorar metodo de verificação ;  
    if( (dia > 0 ) && (dia < 31 ) && ( mes > 0) && (mes <= 12) ){
            date.dia  = dia;
            date.mes  = mes;
    }   
        return date ;
} ;


void showDate(struct data date){

    cout << date.dia << "/" << date.mes <<  endl;
    
}


int showMenu(){

        cout << "Escolha a opção:" << endl ;
        cout << "1-Cadastro de objetos perdidos" << endl ;
        cout << "2-Cadastro de objetos achados" << endl ; 
        cout << "3-Lista de achados"<< endl ;
        cout << "4-Lista de perdidos"<< endl ;
        cout << "5-Lista de achados por categoria"<<endl;
        cout << "6-Lista de perdidos por categoria" << endl; 
        cout << "7-Busca por nome"<< endl ; 
        cout << "8-Busca por pessoa que Encontrou"<< endl;
        cout << "9-Busca por pessoa que perdeu"<< endl ;
        cout << "Digite sua opção ............"<< endl ; 


        int option ;
        cin >> option ;

        switch (option)
        {
        case 1:
                cadastraPerdidos();
                break;
        case 2: 
                cadastraAchados();
                break;
        case 3 :
                listarAchados();
                break;
        case 4 : 
                listarPerdidos();
                break;
        case 5 : 
                listarAchadosCategoria();
                break;
        case 6 : 
                listarPerdidosCategoria();
                break;
        case 7 : 
                buscaNome();
                break;
        case 8 : 
               buscaQuemEncontrou();
               break;
        case 9 :
                buscaQuemPerdeu();
                break;            
        default:
                cout << "Operação inválida" << endl;
                cout << "" << endl;
                showMenu();
                break;
        }

}
