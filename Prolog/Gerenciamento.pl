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

imprimePerdidos([]):- f
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