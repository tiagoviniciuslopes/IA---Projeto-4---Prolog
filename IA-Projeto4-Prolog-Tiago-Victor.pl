% Fatos

% Formato dos fatos 
% Existência de Rota entre Pontos
% Simbologia:
%   A: ponto de partida
%   B: ponto de destino
%   Custo: custo da rota, em reais, entre A e B
rota(a, b, 100).
rota(a, e, 50).
rota(b, c, 200).
rota(c, d, 20).
rota(e, c, 30).
rota(e, d, 70).
rota(d, f, 100).
rota(f, g, 100).
rota(g, h, 100).
rota(h, g, 100).
rota(h, a, 100).
rota(b, a, 100).
rota(c, b, 200).




% Regras

% X e Y são conectados se existe rota de X pra Y ou se existe rota de Y
%     pra X.
conectados(X, X, 0).
conectados(X, Y, D) :-
    rota(X, Y, D);
    rota(Y, X, D).


% Verifica se X pertence à cabeca da lista.
% Encerra assim que encontra.
% X sempre pertence a [X|_] e outra solução não será procurada.
% X pertence à cabela da lista se X é igual a cabeça.
pertence1(X, [X |_]) :-! .
% Verifica se X pertence à calda da lista.
% X pertence à [_|C] se X pertence a C.
% X pertence à calda se X está contido em C.
pertence1(X, [_|C]) :-
    pertence1(X,C).

% O caminho mais curto é de uma cidade pra ela mesma.
% Uma cidade sempre está conectada a si mesma.
% Existe um caminho de X para X que custa 0.
caminho(X, X, 0).

% No inicio o unico elemento da lista é o Fim.
% Existe um caminho entre Inicio e Fim se existir um caminho1 entre
%     Inicio e Fim.
caminho(Inicio, Fim, Distancia, Caminho) :-
    caminho1(Inicio, [Fim], 0, Distancia, Caminho, []).

% Recursão do fim para o começo.
% Acaba quando a primeira cidade da lista for a origem.
% Atribui a variavel Distancia para a variavel Distancia da primeira
%     chamada.
% Atribui a lista de pares para a variavel Caminho
caminho1(Cabeca, [Cabeca|_Calda], Distancia, Distancia, [CaminhoPar|CaldaPar], [CaminhoPar|CaldaPar]).

% Acrescenta o intermediário na lista.
% Passa D2 como parametro de distancia.
% DistanciaAux e CaminhoAux vão dar o valor para as variaveis maiores no
%     fim.
% A lista [CaminhoPar|CaldaPar] encadeia os pares de cidades dentro do
%     caminho.
caminho1(Inicio, [Adjacente|Calda], Distancia, DistanciaAux, CaminhoAux, [CaminhoPar|CaldaPar]) :-
    rota(Intermediario, Adjacente, D1),
    not(pertence1(Intermediario, [Adjacente | Calda])),
    D2 is Distancia + D1,
    caminho1(Inicio, [Intermediario, Adjacente | Calda], D2, DistanciaAux, CaminhoAux, [Intermediario-Adjacente,CaminhoPar|CaldaPar]).

% Na primeira chamada não existe nenhum par feito, uma pesquisa inicial
%     é necessária.
caminho1(Inicio, [Adjacente|Calda], Distancia, DistanciaAux, CaminhoAux, []) :-
    rota(Intermediario, Adjacente, D1),
    not(pertence1(Intermediario, [Adjacente | Calda])),
    D2 is Distancia + D1,
    caminho1(Inicio, [Intermediario, Adjacente | Calda], D2, DistanciaAux, CaminhoAux, [Intermediario-Adjacente]).


% Existe um caminho unico entre Inicio e Fim se não existe outro caminho
%     com um custo menor ou igual.
menor_caminho(Inicio, Fim , CustoMinimo, Caminho) :-
    caminho(Inicio, Fim, CustoMinimo, Caminho),
    not((caminho(Inicio,Fim, CustoMenor, OutroCaminho),
    OutroCaminho \= Caminho,
    CustoMenor =< CustoMinimo)).















