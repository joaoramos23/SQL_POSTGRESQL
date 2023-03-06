<h1 align="center"> SQL -- POSTGRESQL </h1>
<p align="center">Estudos de banco de dados e SGBD.</p>
By: João Ramos

# PostgreSQL

* Criar DATABASE(banco de dados) &rarr;
CREATE DATABASE nome_database;

* Apagar DATABASE(banco de dados) &rarr;
DROP DATABASE nome_database;


<h3>Data types PostgreSQL:</h3>

<br>interger &rarr; número inteiro;
<br>real &rarr; casas decimais com 6 digitos de precisão;
<br>serial &rarr; auto incremento é um inteiro;
<br>numeric &rarr; casas decimais escolhendo a precisão;

<br>varchar(n) &rarr; texto com limite de tamanho;
<br>char(n) &rarr; texto com exatamente o tamanho;
<br>text &rarr; texto sem limite de tamanho;

<br>boolean -> verdadeiro ou falso;

<br>date &rarr; para data;
<br>time &rarr; para hora;
<br>timestamp &rarr; para data/hora;
<br>

<h3>Para criar tabela(TABLE):</h3>
" CREACE TABLE nome_tabela(
    coluna1 'data type',
    coluna2 'data type',
    coluna3 'data type'

);"

<h3>Para consultar a tabela(SELECT):</h3>
"SELECT * FROM nome_tabela;"


<h3>Incluir dado na tabela(INSERT INTO):</h3>
"INSERT INTO nome_tabela (colunas) VALUES (valores);"


<h3>Atualizar dado na tabela(UPDATE):</h3>
"UPDATE nome_tabela SET (campos e valores para atualizar) WHERE (onde atualizar);"


<h3>Excluir dado na tabela(DELETE):</h3>
"DELETE FROM nome_tabela WHERE (onde vai excluir);"


<h3>Seleção de campos especificos:</h3>
"SELECT nome_coluna1 AS "Nome Coluna 1", nome_coluna2 AS nome_coluna_dois FROM nome_tabela; "

- Conseguimos mudar o nome da coluna para uma consulta mais detalhada. As duas formas são validas. Uma mostrará o nome com espaços e a outro utilizará o 'snake_case';


<h3>Filtrando registo de campo do tipo texto:</h3>
"SELECT * FROM nome_tabela WHERE nome_coluna LIKE "%xempl%" "
"SELECT * FROM nome_tabela WHERE nome_coluna NOT LIKE "exemp%" "

<h3>Filtrando registro de campos do tipo numero,data e boolean:</h3>
"SELECT * FROM nome_tabela WHERE nome_coluna IS NULL;"
"SELECT * FROM nome_tabela WHERE nome_coluna IS NOT NULL;"

"SELECT * FROM nome_tabela WHERE nome_coluna BETWEEN 10 AND 30;"


<h3>Filtrando utilizando operadores AND e OR:</h3>
"SELECT * FROM nome_tabela WHERE nome_coluna > 5 AND nome_coluna < 15;"

- Para o operador logico AND as duas condições precisam estar VERDADEIRO para ele ser VERDADEIRO, já o operador logico OR precisa apenas que umas das condições seja VERDADEIRO para ele ser VERDADEIRO;


<h3>Chaves primarias(PRIMARY KEY):</h3>
- Criando tabelas e adicionando "NOT NULL" onde informa que a coluna não pode receber valor vazio e adicionando "UNIQUI" onde a coluna só receberá valores únicos. Utilizando o "PRIMARY KEY" essa função tem essas duas características. 

<h3>Chaves estrangeiras (FOREIGN KEY):</h3>
- Um campo que estabelece relacionamento entre duas tabelas.
"FOREIGN KEY (nome_coluna_origem)
    REFERENCES nome_tabela_destino(nome_coluna_destino);"


<h3>Consultas com relacionamentos:</h3>

- JOIN: Juntar o dado da tabela_A com o dado da tabela_B onde deverá existir uma coluna em comum nas duas tabelas.
"SELECT nome_tabelaA.nome_colunaA, nome_tabelaB.nome_colunaB FROM nome_tabelaA JOIN nome_tabelaB 
    ON nome_tabelaA.nome_colunaA = nome_tabelaB.nome_colunaB;"

- LEFT JOIN: Mostra os itens da tabela da esquerda incluindo os itens em interseção com a tabela da direita.
"FROM tabela1 LEFT JOIN tabela2 ON tabela1.produto = tabela2.produto;"

- RIGHT JOIN: Mostra os itens da tabela da direita incluindo os itens em interseção com a tabela da esquerda.

- FULL JOIN: Mostra a junção de todos os dados.

- CROSS JOIN: Faz uma junção colocando todos ta tabelaA junto com todos da tabelaB.
"SELECT * FROM nome_tabela CROSS JOIN nome_tabela2;"


<h3>Restrição de chave estrangeira:</h3>

-DELETE CASCADE: Ao criar a tabela adicionar a instrução de -> "ON DELETE CASCADE;" para poder excluir a coluna.

-UPDATE CASCADE: Ao criar a tabela adicionar a instrução de -> "ON UPDATE CASCADE;" para poder atualizar a coluna.


<h3>Ordenando as consultas:</h3>

-ORDER BY: Ordena um campo tanto CRESCENTE como DECRESCENTE. "ORDER BY nome_coluna ASC;" / "ORDER BY nome_coluna DESC;" utilizando sempre no final da consulta.

-LIMIT: Para limitar os registros. "LIMIT 5;" irá mostrar apenas os 5 registros.
-OFFSET: Ira percorrer os registro a partir do parâmetro dado. 
"OFFSET 1;" -> Começará a consultar a partir da posição 2.


<h3>Funções de agregação:</h3>
-COUNT: Calcula a quantidade de registros. "SELECT COUNT(nome_coluna) FROM nome_tabela;".

-SUM: Soma os valores do registro. "SELECT SUM(nome_coluna) FROM nome_tabela;".

-MAX / MIN: Mostra o valor minimo e maximo da tabela.. "SELECT MAX / MIN(nome_coluna) FROM nome_tabela;".

-COUNT: Calcula a media dos valores do registros. "SELECT AVG(nome_coluna) FROM nome_tabela;".

-ROUND: Arredando os valores dos registros.
"ROUND(AVG(nome_coluna),qntd. casas decimais)"


<h3>Agrupamento de consultas:</h3>

-DISTINCT: Todos os dados da consulta não irão se repetir.

-GROUP BY: Utilizamos quando utilizamos funções de agregação.

-HAVING: Função é a mesma coisa do WHERE, mas é utilizada quando usamos funções de agrupamento.
