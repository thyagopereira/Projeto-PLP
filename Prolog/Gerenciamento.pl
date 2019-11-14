:- initialization(main).

%Fatos Auxiliares

%ler_string

atom_string(Atom, String).
atom_chars(Atom, List).
string_chars(String, List).
read_line_to_codes(user_input, Entrada), atom_string(Entrada, Return).
ler_string(X) :- read_line_to_codes(user_input, E), atom_string(E, X).

%ler_numero

ler_numero(N) :- read_line_to_codes(user_input, E), number_codes(N, E).

%Fim 

%Cadastrar Perdidos

cadastrar_perdido :-
    nl,
    write("Local que Esqueceu:"), nl,
    ler_string(Local),
    write("Data que Perdeu:"), nl,
    ler_string(Data),
    write("Nome do Dono:"), nl,
    ler_string(Dono),
    write("Nome do Objeto:"), nl,
    ler_string(Objeto),
    write("Descreva o Objeto em Algumas Linhas:"), nl,
    ler_string(Descricao),
    write("Categoria do Objeto:"), nl,
    ler_string(Categoria),
    cria_perdido(Local, Data, Dono, Objeto, Descricao, Categoria, P),
    inserir_perdido(P),
    write("Objeto perdido cadastrado com sucesso !."), nl,
    write("Ficaremos atentos caso alguém o encontre !"), nl.

%cria perdidos

cria_perdido(Local, Data, Dono, Objeto, Descricao, Categoria, P):-
    P = perdido(Local, Data, Dono, Objeto, Descricao, Categoria).

%inserir perdido

insere_inicio(H,L,[H|L]):- !.

insere_final([], Y, [Y]).         
insere_final([I|R], Y, [I|R1]) :-
    insere_final(R, Y, R1).

inserir_perdido(P):-
    retract(objetos_perdidos(Lista)),
    insere_final(Lista, P, NovaLista),
    assert(objetos_perdidos(NovaLista)).


%objetos_perdidos

objetos_perdidos([]).

:-dynamic objetos_perdidos/1.

%listar_perdidos

listar_perdidos:-
    objetos_perdidos(Lista),
    imprime_perdidos(Lista).

%imprime perdidos

imprime_perdidos([]):- 
    nl,
    write("fim"),nl.


imprime_perdidos([H|T]):-
    to_string_perdido(H),
    imprime_perdidos(T).

%imprime perdido

to_string_perdido(perdido(Local, Data, Dono, Objeto, Descricao, Categoria)):-
    nl,
    write("O Objeto foi Esquecido: "),write(Local),nl,
    write("Data: "),write(Data), nl,
    write("Dono: "),write(Dono), nl,
    write("Nome do Objeto: "),write(Objeto), nl,
    write("Descrição do Objeto: "),write(Descricao), nl,
    write("Categoria do Objeto: "),write(Categoria), nl.

%Opções do Menu para Implementar

menu(1):-
    nl,
    write("Operação de Cadastro de objetos Perdidos:"),nl,
    cadastrar_perdido,
    menu(99).

menu(2):-
    nl,
    write("Operação de Cadastro de objetos Achados:"),nl,
    menu(99).

menu(3):-
    nl,
    write("Lista de Perdidos:"),nl,
    listar_perdidos,
    menu(99).

menu(4):-
    nl,
    write("Lista de Achados:"),nl,
    menu(99).

menu(5):-
    nl,
    write("Lista de Perdidos por Categoria:"),nl,
    menu(99).

menu(6):-
    nl,
    write("Lista de Encontrados por Categoria:"),nl,
    menu(99).

menu(7):-
    nl,
    write("Busca por Nome:"),nl,
    menu(99).

menu(8):-
    nl,
    write("Busca por Pessoa que Perdeu:"),nl,
    menu(99).

menu(9):-
    nl,
    write("Busca por Pessoa que Encontrou:"),nl,
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
    ler_numero(E),
    menu(E).

menu(N):-
    nl,
    write("Operação Invalida."), nl,
    menu(99).



%print write(""), nl,



main:-
    menu(99),
    halt(0).