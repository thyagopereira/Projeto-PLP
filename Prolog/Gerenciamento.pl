:- initialization(main).

%Fatos Auxiliares

%lerString

lerString(X) :- read_line_to_codes(user_input, E), atom_string(E, X).


%lerNumero

lerNumero(N) :- read_line_to_codes(user_input, E), number_codes(N, E).

%Fim 

%cadastrarPerdido

cadastrarPerdido :-
    nl,
    write("Local que Esqueceu:"), nl,
    lerString(Local),
    write("Data que Perdeu:"), nl,
    lerString(Data),
    write("Nome do Dono:"), nl,
    lerString(Dono),
    write("Nome do Objeto:"), nl,
    lerString(Objeto),
    write("Descreva o Objeto em Algumas Linhas:"), nl,
    lerString(Descricao),
    write("Categoria do Objeto:"), nl,
    lerString(Categoria),
    criaPerdido(Local, Data, Dono, Objeto, Descricao, Categoria, P),
    inserirPerdido(P),
    write("Objeto perdido cadastrado com sucesso !."), nl,
    write("Ficaremos atentos caso alguém o encontre !"), nl.

%cadastrarAchado

cadastrarAchado :-
    nl,
    write("Local que Encontrou:"), nl,
    lerString(Local),
    write("Data que Encontrou:"), nl,
    lerString(Data),
    write("Nome de Quem Encontrou:"), nl,
    lerString(QuemAchou),
    write("Nome do Objeto:"), nl,
    lerString(Objeto),
    write("Descreva o Objeto em Algumas Linhas:"), nl,
    lerString(Descricao),
    write("Categoria do Objeto:"), nl,
    lerString(Categoria),
    criaAchado(Local, Data, QuemAchou, Objeto, Descricao, Categoria, A),
    inserirAchado(A),
    write("Objeto encontrado cadastrado com sucesso !."), nl,
    write("Ficaremos atentos caso o dono apareça!"), nl.


%criaPerdidos

criaPerdido(Local, Data, Dono, Objeto, Descricao, Categoria, P):-
    P = perdido(Local, Data, Dono, Objeto, Descricao, Categoria).

%inserirPerdido

insereInicio(H,L,[H|L]):- !.

insereFinal([], Y, [Y]).         
insereFinal([I|R], Y, [I|R1]) :-
    insereFinal(R, Y, R1).

inserirPerdido(P):-
    retract(objetosPerdidos(Lista)),
    insereFinal(Lista, P, NovaLista),
    assert(objetosPerdidos(NovaLista)).


%objetosPerdidos

objetosPerdidos([]).

:-dynamic objetosPerdidos/1.

%listarPerdidos

listarPerdidos:-
    objetosPerdidos(Lista),
    imprimePerdidos(Lista).

%imprime perdidos

imprimePerdidos([]):- 
    nl,
    write("fim"),nl.


imprimePerdidos([H|T]):-
    toStringPerdido(H),
    imprimePerdidos(T).

%toStringPerdido

toStringPerdido(perdido(Local, Data, Dono, Objeto, Descricao, Categoria)):-
    nl,
    write("O Objeto foi Esquecido: "),write(Local),nl,
    write("Data: "),write(Data), nl,
    write("Dono: "),write(Dono), nl,
    write("Nome do Objeto: "),write(Objeto), nl,
    write("Descrição do Objeto: "),write(Descricao), nl,
    write("Categoria do Objeto: "),write(Categoria), nl.


%criaAchado

criaAchado(Local, Data, QuemAchou, Objeto, Descricao, Categoria, A):-
    A = achado(Local, Data, QuemAchou, Objeto, Descricao, Categoria).

%objetosAchados

objetosAchados([]).

:-dynamic objetosAchados/1.

%inserirAchado

inserirAchado(A):-
    retract(objetosAchados(Lista)),
    insereFinal(Lista, A, NovaLista),
    assert(objetosAchados(NovaLista)).

%listarAchados

listarAchados:-
    objetosAchados(Lista),
    imprimeAchados(Lista).

%imprimeAchados


imprimeAchados([]):-
    nl,
    write("fim"), nl.

imprimeAchados([H|T]):-
    toStringAchado(H),
    imprimeAchados(T).

%ListarAchadosCate
listarAchadosCate :- 
    nl,
    write("Digite a Categoria:"),
    nl , 
    lerString(Categoria), 
    objetosAchados(Lista),
    listarAchadosCategoria(Lista,Categoria).

%ListarAchadosCategoria 
listarAchadosCategoria([],Elemento) :-
    write("fim") ,nl .
listarAchadosCategoria([H|_],Elemento):- 
    compareCategoriaAchados(H,Elemento),
    toStringAchado(H).
listarAchadosCategoria([_|T],Elemento):- 
    listarAchadosCategoria(T,Elemento).

%ListarPerdidosCate
listarPerdidosCate :- 
    nl,
    write("Digite a Categoria:"),
    nl , 
    lerString(Categoria), 
    objetosPerdidos(Lista),
    listarPerdidosCategoria(Lista,Categoria).

%ListarPerdidosCategoria 
listarPerdidosCategoria([],Elemento) :-
    write("fim") ,nl .
listarPerdidosCategoria([H|_],Elemento):- 
    compareCategoria(H,Elemento),
    toStringPerdido(H).
listarPerdidosCategoria([_|T],Elemento):- 
    listarPerdidosCategoria(T,Elemento).

%ListarQuemPerd
listarQuemPerd :- 
    nl,
    write("Digite o nome de quem perdeu:"),
    nl , 
    lerString(Dono), 
    objetosPerdidos(Lista),
    listarQuemPerdeu(Lista,Dono).

%ListarQuemPerdeu
listarQuemPerdeu([],Elemento) :-
    write("fim") ,nl .
listarQuemPerdeu([H|_],Elemento):- 
    compareQuemPerdeu(H,Elemento),
    toStringPerdido(H).
listarQuemPerdeu([_|T],Elemento):- 
    listarQuemPerdeu(T,Elemento).

%ListarQuemAch
listarQuemAch :- 
    nl,
    write("Digite o nome de quem achou o objeto:"),
    nl , 
    lerString(QuemAchou), 
    objetosAchados(Lista),
    listarQuemAchou(Lista,QuemAchou).

%ListarQuemAchou
listarQuemAchou([],Elemento) :-
    write("fim") ,nl .
listarQuemAchou([H|_],Elemento):- 
    compareQuemAchou(H,Elemento),
    toStringAchado(H).
listarQuemAchou([_|T],Elemento):- 
    listarQuemAchou(T,Elemento).


%Metodo de retono pelo indice:
getByIndex([],_,_,_):- false.
getByIndex([H|T],Index, Index , H).
getByIndex([_|T],Index,Count,Elem):-
    NewCount is Count + 1,
getByIndex(T,Index,NewCount,Elem).
    
getLocalByIndex(Index, Local) :- locais(Lista), getByIndex(Lista,Index,0,Local).
getNomeByIndex(Index, Nome) :- nomes(Lista), getByIndex(Lista,Index,0,Nome).
getDescriByIndex(Index, Descricao) :- descricoes(Lista), getByIndex(Lista,Index,0,Descricao).
getCatByIndex(Index,Categoria) :- categorias(Lista),getByIndex(Lista,Index,0,Categoria).
getDataByIndex(Index,Data):- datas(Lista),getByIndex(Lista,Index,0,Data).

%lista de possíveis valores
nomes(["João", "Maria", "Antonio", "Lucas", "Lara", "Matheus", "Barbara", "Sara", "Carlos", "Vinicius"]).
locais(["LCC3", "LCC2", "CAA", "CD", "BC", "Biblioteca", "Diretoria", "SPLAB", "REENGE", "Seu Olavo"]).
descricoes(["é Preto", "é Branco", "é Azul", "é Verde", "é Amarelo", "é Vermelho", "é Laranja", "é Rosa", "é Roxo", "é Marrom"]).
categorias(["Caderno", "Caneta", "Fone de Ouvido", "Bolsa", "Oculos", "Carteira", "Chave", "Capacete", "Celular", "Garrafa"]).
datas(["20/01/2019","30/01/2019","15/02/2019","30/05/2019","02/06/2019","19/08/2019","28/09/2019","22/10/2019","08/11/2019","12/12/2019"]).

%popularData
popularData :- 

write("Digite o numero de elementos a serem adicionados: "),
lerNumero(Quant),
popularDatabase(Quant,0).


popularDatabase(0,_).
popularDatabase(N,N).
popularDatabase(N,Count):-
    random(0,9,R),
    random(0,9,R1),
    random(0,9,R2),
    random(0,9,R3),
    random(0,9,R4),
    random(0,9,R5),
    random(0,9,R6),
    random(0,9,R7),
    random(0,9,R8),
    random(0,9,R9),
    random(0,9,R10),
    random(0,9,R11),


    getLocalByIndex(R,Local),
    getDataByIndex(R1,Data),
    getCatByIndex(R2,Nome),
    getNomeByIndex(R3,QuemAchou),
    getDescriByIndex(R4,Descricao),
    getCatByIndex(R5,Categoria),
    criaAchado(Local,Data,QuemAchou,Nome,Descricao,Categoria, A),
    inserirAchado(A),

    getLocalByIndex(R6,LocalP),
    getDataByIndex(R7,DataP),
    getNomeByIndex(R8,Dono),
    getCatByIndex(R9,Objeto),
    getDescriByIndex(R10,DescricaoP),
    getCatByIndex(R11,CategoriaP),

    criaPerdido(LocalP, DataP, Dono, Objeto, DescricaoP, CategoriaP, P),
    inserirPerdido(P),

     Counter is Count + 1,

    popularDatabase(N,Counter).


%CompareCategoria Perdidos 
compareCategoria(perdido(Local, Data, Dono, Objeto, Descricao, Elemento), Elemento).

%CompareNome Perdidos 
compareNome(perdido(Local, Data, Dono, Elemento, Descricao, Categoria), Elemento).

%CompareCategoria Achados 
compareCategoriaAchados(achado(Local, Data, QuemAchou, Objeto, Descricao, Elemento), Elemento).

%CompareQuemPerdeu Perdidos 
compareQuemPerdeu(perdido(Local, Data, Elemento, Objeto, Descricao, Categoria), Elemento).

%CompareAchou Achados 
compareQuemAchou(achado(Local, Data, Elemento, Objeto, Descricao, Categoria), Elemento).

%listaPerdidosNo
listaPerdidosNo :- 
    nl,
    write("Digite o nome do objeto perdido:"),
    nl , 
    lerString(Nome), 
    objetosPerdidos(Lista),
    listarPerdidosNome(Lista,Nome).

%ListarPerdidosNome 
listarPerdidosNome([],Elemento) :-
    write("fim") ,nl .
listarPerdidosNome([H|_],Elemento):- 
    compareNome(H,Elemento),
    toStringPerdido(H).
listarPerdidosNome([_|T],Elemento):- 
    listarPerdidosNome(T,Elemento).

%toStringAchado

toStringAchado(achado(Local, Data, QuemAchou, Objeto, Descricao, Categoria)):-
    nl,
    write("O Objeto foi Encontrado em: "),write(Local),nl,
    write("Data: "),write(Data), nl,
    write("Achado Por: "),write(QuemAchou), nl,
    write("Nome do Objeto: "),write(Objeto), nl,
    write("Descrição do Objeto: "),write(Descricao), nl,
    write("Categoria do Objeto: "),write(Categoria), nl.


%Opções do Menu para Implementar
menu(0):-
    halt(0).

menu(1):-
    nl,
    write("Operação de Cadastro de objetos Perdidos:"),nl,
    cadastrarPerdido,
    menu(99).

menu(2):-
    nl,
    write("Operação de Cadastro de objetos Achados:"),nl,
    cadastrarAchado,
    menu(99).

menu(3):-
    nl,
    write("Lista de Perdidos:"),nl,
    listarPerdidos,
    menu(99).

menu(4):-
    nl,
    write("Lista de Achados:"),nl,
    listarAchados,
    menu(99).

menu(5):-
    nl,
    write("Lista de Perdidos por Categoria:"),nl,
    listarPerdidosCate,
    menu(99).

menu(6):-
    nl,
    write("Lista de Encontrados por Categoria:"),nl,
    listarAchadosCate,
    menu(99).

menu(7):-
    nl,
    write("Busca por Nome:"),nl,
    listaPerdidosNo,
    menu(99).

menu(8):-
    nl,
    write("Busca por Pessoa que Perdeu:"),nl,
    listarQuemPerd,
    menu(99).

menu(9):-
    nl,
    write("Busca por Pessoa que Encontrou:"),nl,
    listarQuemAch,
    menu(99).

menu(10):-
    nl,
    write("Popular Database:"),nl,
    popularData,
    menu(99).

menu(99) :-
    nl,
    write('Escolha a opção:'), nl,
    write("1-Cadastro de Objetos Perdidos"), nl,
    write("2-Cadastro de Objetos Encontrados"), nl,
    write("3-Lista de Perdidos"), nl,
    write("4-Lista de Encontrados"), nl,
    write("5-Lista de Perdidos por Categoria"), nl,
    write("6-Lista de Encontrados por Categoria"), nl,
    write("7-Busca por Nome"), nl,
    write("8-Busca por Pessoa que Perdeu"), nl,
    write("9-Busca por Pessoa que Encontrou"), nl,
    write("10-Popular DataBase"), nl,
    write("Digite  0  para sair do sistema e encerrar todas as operações"), nl,
    write("Digite sua opção ............"), nl,
    write(""),
    lerNumero(E),
    menu(E).

menu(N):-
    nl,
    write("Operação Invalida."), nl,
    menu(99).



%print write(""), nl,
main:-
    menu(99),
    halt(0).
