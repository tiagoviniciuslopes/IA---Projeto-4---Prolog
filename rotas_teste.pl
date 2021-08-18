% Fatos

rota(a, b, 100).
rota(a, e, 50).
rota(b, c, 200).
rota(c, d, 20).
rota(e, c, 30).
rota(e, d, 70).




% Regras

% X e Y s�o conectados se existe rota de X pra Y ou se existe rota de Y
%    pra X.
conectados(X, X, 0).
conectados(X, Y, D) :-
    rota(X, Y, D);
    rota(Y, X, D).


% Verifica se X pertence � cabeca lista.
% Encerra assim que encontra.
pertence1(X, [X |_]) :-! .
% Verifica se X pertence � calda da lista.
pertence1(X, [_|C]) :-
    pertence1(X,C).

% O caminho mais curto � de uma cidade pra ela mesma.
caminho(X, X, 0).

% No inicio o unico elemento da lista � o Fim.
caminho(Inicio, Fim, Distancia, Caminho) :-
    caminho1(Inicio, [Fim], 0, Distancia, Caminho).

% Recurs�o do fim para o come�o.
% Acaba quando a primeira cidade da lista for a origem.
% Atribui a variavel Distancia para a variavel Distancia da primeira
%    chamada.
% Atribui a lista para a variavel Caminho.
caminho1(Cabeca, [Cabeca|Calda], Distancia, Distancia, [Cabeca|Calda]).

% Acrescenta o intermediario na lista.
% Passa D2 como parametro de distancia.s
% DistanciaAux e CaminhoAux v�o dar o valor para as variaveis maiores no
%     fim.
caminho1(Inicio, [Adjacente|Calda], Distancia, DistanciaAux, CaminhoAux) :-
    conectados(Intermediario, Adjacente, D1),
    not(pertence1(Intermediario, [Adjacente | Calda])),
    D2 is Distancia + D1,
    caminho1(Inicio, [Intermediario, Adjacente | Calda], D2, DistanciaAux, CaminhoAux).

% Existe um caminho unico entre Inicio e Fim se n�o existe outro caminho
%    com um custo menor ou igual.
menor_caminho(Inicio, Fim , CustoMinimo, Caminho) :-
    caminho(Inicio, Fim, CustoMinimo, Caminho),
    not((caminho(Inicio,Fim, CustoMenor, OutroCaminho),
    OutroCaminho \= Caminho,
    CustoMenor =< CustoMinimo)).















