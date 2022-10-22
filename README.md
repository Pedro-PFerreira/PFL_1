# PFL_1

Grupo G03_01:

* Inês Gaspar up202007210
* Pedro Ferreira up202004986

# Representação Interna
```haskell
type Coef = Integer
type Incognit = [(String, Integer)]

type Monom = (Coef, Incognit)
```
> > Escolhemos esta representação para ser mais fácil acedermos à incógnita e ao expoente para as funcionalidades que implementamos

# Funcionalidades

> **Normalização**
> > **Ordenação do monómio por ordem alfabética**
> > Temos 2 funções que lidam com a parte de ordenação do monómio, primeiro começamos por ordenar apenas as incógnitas e depois aplicamos esta função ao mónomio e em seguida o próprio polinómio.

> > **Ordenação do polimónio por grau**
> > Temos 3 funções que lidam com a parte de ordenação do polinómio, primeiro começamos por ordenar as incógnitas por ordem decrescente do expoente, depois aplicamos a função no monómio e em seguida pegamos na primeira incógnita de cada monómio e aplicamos um algoritmo de ordenação.

> > **Eliminar zeros do polinómio**
> > Esta função elimina do polinómio, os monómios que têm coeficiente nulo. 

> > **Eliminar incógnitas ^0**
> > Esta função "apaga" dos monómios as incógnitas que estiverem elevadas a 0. 

> **Adição**
> > Esta funcionalidade primeiro verifica se os monómios dos dois polinómios têm incógnitas e os expoentes são iguais para as podermos somar.
> > Aplica-se esta função a todos os monómios dos polinómios

> **Multiplicação**
> > Esta funcionalidade faz a combinação de todas os monómios e depois aplica a função de soma, uma vez que podem resultar monómios iguais

> > **Derivação**
> > Esta funcionalidade aceita uma incógnita como argumento e o polinómio que queremos derivar
> > Primeiro verificamos se a incógnita existe em cada um dos monómios do polinómio, caso isso aconteça multiplicamos o expoente ao coeficiente e subtraímos 1 ao valor do expoente do monómio
