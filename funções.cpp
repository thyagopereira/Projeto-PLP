#include<string>
#include<iostream>
#include<time.h>
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

    cout << " " << endl ;

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

      cout << " " << endl ;

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

    if(sizeofVector == 0){
        cout << "  " << endl ;
        cout << "A Lista de Itens Encontrados está vazia. " << endl ;
        cout << "  " << endl ;
    }
    else{

      cout << "  " << endl ;
      cout << "Lista de Itens Encontrados: " << endl ;
      cout << "  " << endl ;

      for(int i = 0 ; i < sizeofVector ; i++){
            toStringAchado(encontrados[i]);
      }
    }
}

void listarPerdidos(struct AnuncioPerdido perdidos[] , int sizeofVector){

      if(sizeofVector == 0){
        cout << "  " << endl ;
        cout << "A Lista de Itens Perdidos está vazia. " << endl ;
        cout << "  " << endl ;
      }
      else{

        cout << "  " << endl ;
        cout << "Lista de Itens Perdidos: " << endl ;
        cout << "  " << endl ;

        for(int i = 0; i < sizeofVector ; i++){
            toStringPerdido(perdidos[i]);
        }
      }


}

void listarAchadosCategoria(struct AnuncioEncontrado encontrados[], int sizeofVector){
      string categoria;

      /*Recebe a Categoria do Usuario*/
      cout << "  " << endl ;
      cout << "Digite a Categoria:" << endl;
      ws(cin);
      getline(cin, categoria);

      struct AnuncioEncontrado reposta[sizeofVector];
      int tam = 0;

      for(int i = 0 ; i < sizeofVector ; i++){

            /*Verifica se a categoria do item é igual a fornecida pelo usuario*/
            if(encontrados[i].categoria.compare(categoria) == 0){
                reposta[tam] = encontrados[i];
                tam++;
            }
      }

      if(tam == 0){

        cout << "  " << endl ;
        cout << "Não existem Itens Encontrados dessa Categoria. " << endl ;
        cout << "  " << endl ;
      }
      else{

        cout << "  " << endl ;
        cout << "Lista de Itens Encontrados da Categoria " << categoria << ": " << endl ;
        cout << "  " << endl ;

        for (int j = 0; j < tam; ++j){
         toStringAchado(reposta[j]);
        }
      }

}

void listarPerdidosCategoria(struct AnuncioPerdido perdidos[], int sizeofVector){
      string categoria;

      /*Recebe a Categoria do Usuario*/
      cout << "  " << endl ;
      cout << "Digite a Categoria:" << endl;
      ws(cin);
      getline(cin, categoria);

      cout << "  " << endl ;
      cout << "Lista de Itens Encontrados da Categoria " << categoria << ": " << endl ;
      cout << "  " << endl ;

      struct AnuncioPerdido reposta[sizeofVector];
      int tam = 0;

      for(int i = 0 ; i < sizeofVector ; i++){

            /*Verifica se a categoria do item é igual a fornecida pelo usuario*/
            if(perdidos[i].categoria.compare(categoria) == 0){
                reposta[tam] = perdidos[i];
                tam++;
            }
      }

      if(tam == 0){

        cout << "  " << endl ;
        cout << "Não existem Itens Perdidos dessa Categoria. " << endl ;
        cout << "  " << endl ;
      }
      else{

        cout << "  " << endl ;
        cout << "Lista de Itens Perdidos da Categoria " << categoria << ": " << endl ;
        cout << "  " << endl ;

        for (int j = 0; j < tam; ++j){
         toStringPerdido(reposta[j]);
        }
      }

}

void buscaQuemEncontrou(struct AnuncioEncontrado encontrados[], int sizeofVector){
      string nomeDeQuemEncontrou;

      /*Recebe o nome de Quem encontrou*/
      cout << "  " << endl ;
      cout << "Digite o nome de quem encontrou:" << endl;
      ws(cin);
      getline(cin, nomeDeQuemEncontrou);

      struct AnuncioEncontrado reposta[sizeofVector];
      int tam = 0;

      for(int i = 0 ; i < sizeofVector ; i++){

            /*Verifica se o nome de quem encontrou é igual ao fornecido pelo usuario*/
            if(encontrados[i].quemEncontrou.compare(nomeDeQuemEncontrou) == 0){
                   reposta[tam] = encontrados[i];
                   tam++;
            }
      }
      if(tam == 0){

        cout << "  " << endl ;
        cout << "Ninguém com esse nome cadastrou um objeto encontrado." << endl ;
        cout << "  " << endl ;
      }
      else{

        cout << "  " << endl ;
        cout << "Lista de Itens Encontrados por alguém com esse nome: " << nomeDeQuemEncontrou << ": " << endl ;
        cout << "  " << endl ;

        for (int j = 0; j < tam; ++j){
           toStringAchado(reposta[j]);
        }
      }

}

void buscaQuemPerdeu(struct AnuncioPerdido perdidos[], int sizeofVector){
      string nomeDeQuemPerdeu;

      /*Recebe o nome de Quem Perdeu*/
      cout << "  " << endl ;
      cout << "Digite o nome de quem Perdeu:" << endl;
      ws(cin);
      getline(cin, nomeDeQuemPerdeu);


      struct AnuncioPerdido reposta[sizeofVector];
      int tam = 0;

      for(int i = 0 ; i < sizeofVector ; i++){

            /*Verifica se o nome de quem perdeu é igual ao fornecido pelo usuario*/
            if(perdidos[i].dono.compare(nomeDeQuemPerdeu) == 0){
                   reposta[tam] = perdidos[i];
                   tam++;
            }
      }
      if(tam == 0){

        cout << "  " << endl ;
        cout << "Ninguém com esse nome cadastrou um objeto perdido." << endl ;
        cout << "  " << endl ;
      }
      else{

          cout << "  " << endl ;
          cout << "Lista de Itens Perdidos por alguém com esse nome: " << nomeDeQuemPerdeu << ": " << endl ;
          cout << "  " << endl ;

          for (int j = 0; j < tam; ++j){
             toStringPerdido(reposta[j]);
          }
      }

}


void buscaObjetoPeloNome(struct AnuncioPerdido perdidos[], int sizeofVector){
      string nome;

      /*Recebe o nome do Objeto procurado*/
      cout << "  " << endl ;
      cout << "Digite o nome do Objeto:" << endl;
      ws(cin);
      getline(cin, nome);

      struct AnuncioPerdido reposta[sizeofVector];
      int tam = 0;

      for(int i = 0 ; i < sizeofVector ; i++){

            /*Verifica se o nome do item é igual ao fornecido pelo usuario*/
            if(perdidos[i].nomePertence.compare(nome) == 0){
                   reposta[tam] = perdidos[i];
                   tam++;
            }
      }
      if(tam == 0){

        cout << "  " << endl ;
        cout << "Não existem objetos com esse nome." << endl ;
        cout << "  " << endl ;
      }
      else{

            cout << "  " << endl ;
            cout << "Lista de itens com esse nome: " << nome << ": " << endl ;
            cout << "  " << endl ;

            for (int j = 0; j < tam; ++j){
             toStringPerdido(reposta[j]);
            }
      }

}

/**void  objetoPerdidoDevolvido(struct AnuncioPerdido perdidos[], int sizeofVector){
      string nomeDeQuemPerdeu;

     /*Recebe o nome de Quem Perdeu*/
    /*  cout << "  " << endl ;
      cout << "Digite o nome de quem Perdeu:" << endl;
      ws(cin);
      getline(cin, nomeDeQuemPerdeu);

            for(int i = 0 ; i < sizeofVector ; i++){
            /*Verifica se o nome de quem encontrou e igual o fornecido*/
      /*      if(perdidos[i].nomePertence.compare(nomeDeQuemPerdeu) == 0){
                  perdidos[i].descricaoObjeto == "ESTE OBJETO FOI DEVOLVIDO";
                  perdidos[i].categoria == "Devolvido";
            }
      }
      cout << "Este pertence foi devidamente devolvido ao dono." << endl;
}*/

/*void  objetoAchadoDevolvido(struct AnuncioEncontrado encontrados[], int sizeofVector){
      string nomeDeQuemEncontrou;

//       Recebe o nome de Quem Encontrou*/
//       cout << "  " << endl ;
//       cout << "Digite o nome de quem Encontrou:" << endl;
//       ws(cin);
//       getline(cin, nomeDeQuemEncontrou);
//
//       for(int i = 0 ; i < sizeofVector ; i++){
//             /*Verifica se o nome de quem encontrou e igual o fornecido*/
//             if(encontrados[i].nomePertence.compare(nomeDeQuemEncontrou) == 0){
//                   encontrados[i].descricaoObjeto == "ESTE OBJETO FOI DEVOLVIDO";
//                   encontrados[i].categoria == "Devolvido";
//             }
//       }
//       cout << "O pertence foi devidamente devolvido ao dono." << endl;
// }


void cadastraPerdidos(struct AnuncioPerdido perdidos[] , int perdidosIndex, int sizeofVector){
      perdidos[perdidosIndex] = criaPerdidos();
}

void cadastraAchados(struct AnuncioEncontrado encontrados[] , int encontradosIndex , int sizeofVector){
      encontrados[encontradosIndex] = criaAchados();
}

int popularDatabase(struct AnuncioPerdido perdidos[], int perdidosIndex, struct AnuncioEncontrado encontrados[], int  encontradosIndex){

    srand( time(NULL));

    /*Posiveis valores que serão selecionados aleatoriamente*/
    string nomes[10] = {"João", "Maria", "Antonio", "Lucas", "Lara", "Matheus", "Barbara", "Sara", "Carlos", "Vinicius"};
    string locais[10] = {"LCC3", "LCC2", "CAA", "CD", "BC", "Biblioteca", "Diretoria", "SPLAB", "REENGE", "Seu Olavo"};
    string descricoes[10] = {"é Preto", "é Branco", "é Azul", "é Verde", "é Amarelo", "é Vermelho", "é Laranja", "é Rosa", "é Roxo", "é Marrom"};
    string categorias[10] = {"Caderno", "Caneta", "Fone de Ouvido", "Bolsa", "Oculos", "Carteira", "Chave", "Capacete", "Celular", "Garrafa"};
    int dias[28] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28};
    int meses[12] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};

    int randNomes, randLocais, randDescricoes, randCategorias, randDias, randMeses;
    struct AnuncioPerdido itemPerdido;
    struct AnuncioEncontrado itemEncontrado;

    int quant;

    /*Define a quantidades de elementos que serão gerados e adicionados a database*/
    cout << "  " << endl;
    cout << "Digite o numero de elementos a serem adicionados:" << endl;
    cin >> quant;
    cout << "  " << endl;

    /*Testando se o numero passado pelo usuario é maior que 0*/
    while(quant < 1){
      cout << "  " << endl;
      cout << "Número Inválido, Digite um número inteiro positivo maior que 0: " << endl;
      cout << " " << endl;
      cout << "Digite o número de elementos a serem adicionados:" << endl;
      cin >> quant;
      cout << "  " << endl;
    }

    /*Cadastrando Perdidos Aleatoriamente*/
    for (int i = perdidosIndex; i < quant; ++i){

        /*Seleciona um número aleatório*/
        randNomes = rand() % 10; /*0 - 10*/
        randLocais = rand() % 10; /*0 - 10*/
        randDescricoes = rand() % 10; /*0 - 10*/
        randCategorias = rand() % 10; /*0 - 10*/
        randDias = rand() % 28; /*0 - 28*/
        randMeses = rand() % 12; /*0 - 12*/

        itemPerdido.ondeEsqueceu = locais[randLocais];
        itemPerdido.quandoPerdeu = criaData(dias[randDias], meses[randMeses]);
        itemPerdido.dono = nomes[randNomes];
        itemPerdido.nomePertence = categorias[randCategorias];
        itemPerdido.descricaoObjeto = descricoes[randDescricoes];
        itemPerdido.categoria = categorias[randCategorias];

        perdidos[i] = itemPerdido;

    }

    /*Cadastrando Encontrados Aleatoriamente*/
    for (int i = encontradosIndex; i < quant; ++i){

        /*Seleciona um número aleatório*/
        randNomes = rand() % 10; /*0 - 10*/
        randLocais = rand() % 10; /*0 - 10*/
        randDescricoes = rand() % 10; /*0 - 10*/
        randCategorias = rand() % 10; /*0 - 10*/
        randDias = rand() % 28; /*0 - 28*/
        randMeses = rand() % 12; /*0 - 12*/

        itemEncontrado.local = locais[randLocais];
        itemEncontrado.data = criaData(dias[randDias], meses[randMeses]);
        itemEncontrado.quemEncontrou = nomes[randNomes];
        itemEncontrado.nomePertence = categorias[randCategorias];
        itemEncontrado.descricaoObjeto = descricoes[randDescricoes];
        itemEncontrado.categoria = categorias[randCategorias];

        encontrados[i] = itemEncontrado;
    }

    /*Impressões de Confimação*/
    cout << " " << endl;
    cout<< quant << " Itens Perdidos foram cadastrados." << endl;
    cout<< quant << " Itens Encontrados foram cadastrados." << endl;
    cout << " " << endl;

    return quant;

}



void showMenu(struct AnuncioPerdido perdidos[],int *perdidosIndex ,  struct AnuncioEncontrado encontrados[],
 int *encontradosIndex , int sizeofVector ){


   bool loop = true;
   int option ;
   while(loop){


     cout << "Escolha a opção:" << endl ;
     cout << "1-Cadastro de objetos perdidos" << endl ;
     cout << "2-Cadastro de objetos encontrados" << endl ;
     cout << "3-Lista de encontrados"<< endl ;
     cout << "4-Lista de perdidos"<< endl ;
     cout << "5-Lista de encontrados por categoria"<<endl;
     cout << "6-Lista de perdidos por categoria" << endl;
     cout << "7-Busca por nome"<< endl ;
     cout << "8-Busca por pessoa que Encontrou"<< endl;
     cout << "9-Busca por pessoa que perdeu"<< endl ;
     cout << "10-Popular DataBase" << endl;
     cout << "11-Objeto perdido devolvido" << endl;
     cout << "12-Objeto encontrado devolvido" << endl;
     cout << "Digite  0  para sair do sistema e encerrar todas as operações" << endl ;
     cout << "Digite sua opção ............"<< "\n"<< endl ;


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
             listarPerdidos(perdidos, *perdidosIndex);
             break;
     case 5 :
             listarAchadosCategoria(encontrados, *encontradosIndex);
             break;
     case 6 :
             listarPerdidosCategoria(perdidos, *perdidosIndex);
             break;
     case 7 :
             buscaObjetoPeloNome(perdidos, *perdidosIndex);
             break;
     case 8 :
             buscaQuemEncontrou(encontrados, *perdidosIndex);
            break;
     case 9 :
             buscaQuemPerdeu(perdidos, *perdidosIndex);
             break;
     case 10:
             int quant;
             quant = popularDatabase(perdidos, *perdidosIndex, encontrados, *encontradosIndex);
             /*Incrementa os Indicices dos Arrays pelo numero de elementos adicionados*/
             (*perdidosIndex) += quant;
             (*encontradosIndex) += quant;
             break;
      // case 11:
      //       objetoPerdidoDevolvido(perdidos, *perdidosIndex);
      //       break;
      // case 12:
      //       objetoAchadoDevolvido(encontrados, *encontradosIndex);
     default:
             cout << "Operação inválida" << endl;
             cout << "" << endl;
             break;
     }

   }



}
