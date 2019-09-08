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



string  toStringData(struct data date){

      return date.dia + "/" + date.mes ;

}

struct AnuncioPerdido criaPerdidos(){
    struct AnuncioPerdido  perdido;

    int dia , mes ;
    cout << "Local que esqueceu:" << endl ;
    ws(cin);
    getline(cin,perdido.ondeEsqueceu);


    cout << "Dia que perdeu:" << endl;
    cin >> dia;
    cout << "Mês que perdeu:" << endl;
    cin >> mes;
    perdido.quandoPerdeu =  criaData(dia,mes);

    cout << "Nome do Dono:" << endl;
    ws(cin);
    getline(cin,perdido.dono) ;

    cout << "Nome do objeto:" << endl;
    ws(cin);
    getline(cin,perdido.nomePertence);


    cout << "Descreva o objeto em algumas linhas:" << endl;
    ws(cin);
    getline(cin ,perdido.descricaoObjeto);


    cout << "Categoria do objeto:" << endl;
    ws(cin);
    getline(cin ,perdido.categoria);

    cout << "Objeto perdido cadastrado com sucesso !. Ficaremos atentos caso alguém o encontre !" << endl;

    return perdido ;
}


struct AnuncioEncontrado criaAchados(){
      struct AnuncioEncontrado encontrado ;

      int dia, mes;
      cout << "Local que encontrou:"<< endl;
      ws(cin);
      getline(cin,encontrado.local);

      cout << "Dia que encontrou:" << endl;
      cin >> dia ;
      cout << "Mês que encontrou:" << endl;
      cin >> mes ;
      encontrado.data =  criaData(dia,mes);


      cout << "Nome de quem encontou:" << endl;
      ws(cin);
      getline(cin,encontrado.quemEncontrou);

      cout << "Nome do objeto:" << endl;
      ws(cin);
      getline(cin ,encontrado.nomePertence);

      cout << "Descreva o objeto em algumas linhas:" << endl;
      ws(cin);
      getline(cin,encontrado.descricaoObjeto);

      cout << "Categoria do objeto:" << endl;
      ws(cin);
      getline(cin,encontrado.categoria);

      return encontrado;

}


void toStringPerdido(struct AnuncioPerdido perdido){
      cout << " " << endl ;
      cout << "O objeto foi esquecido em:"<< "  " << perdido.ondeEsqueceu << endl;
      cout << "Data :" << " " <<perdido.quandoPerdeu.dia << "/" << perdido.quandoPerdeu.mes << endl ;
      cout << "Dono : " << " " << perdido.dono << endl ;
      cout << "Nome do Objeto : " <<  " " << perdido.nomePertence << endl ;
      cout << "Descrição do objeto :" << " " << perdido.descricaoObjeto << endl ;
      cout << "Categoria do objeto :" << " " << perdido.categoria << endl ;
      cout << " " << endl ;
}

void toStringAchado(struct AnuncioEncontrado encontrado){
      cout << " " << endl ;
      cout << "O objeto foi encontrado em:" << "  "<< encontrado.local << endl;
      cout << "Data :" << " " << encontrado.data.dia << "/" << encontrado.data.mes << endl ;
      cout << "Achado por  : " << " " << encontrado.quemEncontrou << endl ;
      cout << "Nome do Objeto :" << " " << encontrado.nomePertence << endl ;
      cout << "Descrição do objeto :" << " " << encontrado.descricaoObjeto << endl ;
      cout << "Categoria do objeto :" << " " << encontrado.categoria << endl ;
      cout << "  " << endl ;

}

void listarAchados(struct AnuncioEncontrado encontrados[] , int sizeofVector ){
    for(int i = 0 ; i < sizeofVector ; i++){
            toStringAchado(encontrados[i]);
    }
}

void listarPerdidos(struct AnuncioPerdido perdidos[] , int sizeofVector){
      for(int i = 0; i < sizeofVector ; i++){
            toStringPerdido(perdidos[i]);
      }

}


void cadastraPerdidos(struct AnuncioPerdido perdidos[] , int perdidosIndex, int sizeofVector){
      perdidos[perdidosIndex] = criaPerdidos();
}

void cadastraAchados(struct AnuncioEncontrado encontrados[] , int encontradosIndex , int sizeofVector){
      encontrados[encontradosIndex] = criaAchados();
}

void showMenu(struct AnuncioPerdido perdidos[],int *perdidosIndex ,  struct AnuncioEncontrado encontrados[],
 int *encontradosIndex , int sizeofVector ){


   bool loop = true;
   int option ;
   while(loop){


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
     cout << "Digite  0  para sair do sistema e encerrar todas as operações" << endl ;
     cout << "Digite sua opção ............"<< endl ;


     cin >> option ;

     switch (option)
     {
     case 0:
            loop = false;
            break;
     case 1:
             cadastraPerdidos(perdidos,*perdidosIndex,sizeofVector);
             (*perdidosIndex)++ ;
             /*Verificando , O incremento da variável após cada cadastro
            cout << *perdidosIndex << endl ;
             */

             break;
     case 2:
             cadastraAchados(encontrados,*encontradosIndex,sizeofVector);
             (*encontradosIndex)++;
             /*
             Verificando, o Incremento da Variável após cada cadastro ;
             cout << *encontradosIndex << endl ;
             */
             break;
     case 3 :
             listarAchados(encontrados, *encontradosIndex);
             break;
     case 4 :
           //listarPerdidos();
             break;
     case 5 :
           //  listarAchadosCategoria();
             break;
     case 6 :
           //  listarPerdidosCategoria();
             break;
     case 7 :
           //  buscaNome();
             break;
     case 8 :
         //   buscaQuemEncontrou();
            break;
     case 9 :
           //  buscaQuemPerdeu();
             break;
     default:
             cout << "Operação inválida" << endl;
             cout << "" << endl;
             break;
     }

   }



}
