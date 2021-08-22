# Prolog-Instruções
Esse arquivo contem exemplos de instruções para a execução do projeto 4 da matéria de Inteligencia Artificial.

## Configuração

Primeiramente, faz-se necessária a instalação do software SWI Prolog em sua máquina. A versão "stable" está disponivel no seguinte link: http://www.swi-prolog.org/download/stable. Quando a instalação for concluída, execute o comando `swipl` em um terminal Linux ou abra a aplicação `SWI-Prolog` no Max OS ou Windows. O "prompt" `?-` aparecerá no terminal.

## Como posso carregar o programa? 

Para carregar o programa utilize o seguinte comando dentro do `SWI-Prolog`:

```
consult('nome-do-arquivo.pl').
```

Caso seja necessário mudar o diretório, utilize o seguinte comando:

```
cd('/caminho/para/seu/diretorio').
```

## Exemplos de código:


### Verificando se existe uma rota entre duas cidades com custo Z:
```
?- rota(a,b,Z).
Z=100.

?- rota(h,b,Z).
false.

?- rota(a,Y,Z).
Y=b,
Z=100;
Y=e,
Z=50.
```

### Verificando se existe algum conjunto de rotas que formam um Caminho de custo Z entre duas cidades:
```
?- caminho(a,d,Z,Caminho).
Z = 320,
Caminho = [a-b, b-c, c-d] ;
Z = 100,
Caminho = [a-e, e-c, c-d] ;
Z = 120,
Caminho = [a-e, e-d] .

?- caminho(a,e,Z,Caminho).
Z = 50,
Caminho = [a-e] .

?- caminho(h,i,Z,Caminho).
false.
```

### Verificando qual o caminho menos custoso entre duas cidades:
```
?- menor_caminho(a,d,Custo,Caminho).
Custo = 100,
Caminho = [a-e, e-c, c-d] .

?- menor_caminho(a,e,Custo,Caminho).
Custo = 50,
Caminho = [a-e] .

?- menor_caminho(a,h,Custo,Caminho).
Custo = 400,
Caminho = [a-e, e-c, c-d, d-f, f-g, g-h] .
```

## Informações de contato

* Email: tiagovlpereira@gmail.com
* Email: victor.mendes@gmail.com

