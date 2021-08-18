% Fatos

gerou(kelly, maria).
gerou(cleber, maria).
gerou(cleber, bruna).
gerou(maria, julia).
gerou(maria, pedro).
gerou(pedro, lucas).

feminino(kelly).
feminino(maria).
feminino(julia).
feminino(bruna).
masculino(cleber).
masculino(pedro).
masculino(lucas).



%Regras

% Y é filho de X se X gerou Y
filho(Y, X) :-
    gerou(X, Y).

% Y é neto de X se X gerou Z e Z gerou Y
neto(Y, X) :-
    gerou(X, Z),
    gerou(Z, Y).

%
parente(X, X).
parente(X, Y) :-
    gerou(X, Z),
    parente(Z, Y).




