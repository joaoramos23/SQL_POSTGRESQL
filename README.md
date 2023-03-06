# SQL---MySQL---PostgreSQL
Estudos de banco de dados e SGBD.
By: João Ramos

PostgreSQL
* Criar DATABASE(banco de dados): 
CREATE DATABASE nome_database;

* Apagar DATABASE(banco de dados):
DROP DATABASE nome_database;


*Data types PostgreSQL:

interger -> número inteiro;
real -> casas decimais com 6 digitos de precisão;
serial -> auto incremento é um inteiro;
numeric -> casas decimais escolhendo a precisão;

varchar(n) -> texto com limite de tamanho;
char(n) -> texto com exatamente o tamanho;
text -> texto sem limite de tamanho;

boolean -> verdadeiro ou falso;

date -> para data;
time -> para hora;
timestamp - > para data/hora;


*Para criar tabela(TABLE):
" CREACE TABLE nome_tabela(
    coluna1 'data type',
    coluna2 'data type',
    coluna3 'data type'

);"

*Para consultar a tabela:
"SELECT * FROM nome_tabela;"


*Incluir dado na tabela:
"INSERT INTO nome_tabela (colunas) VALUES (valores);"


*Atualizar dado na tabela:
"UPDATE nome_tabela SET (campos e valores para atualizar) WHERE (onde atualizar);"


*Excluir dado na tabela:
"DELETE FROM nome_tabela WHERE (onde vai excluir);"


*Seleção de campos especificos:
"SELECT nome_coluna1 AS "Nome Coluna 1", nome_coluna2 AS nome_coluna_dois FROM nome_tabela; "

- Conseguimos mudar o nome da coluna para uma consulta mais detalhada. As duas formas são validas. Uma mostrará o nome com espaços e a outro utilizará o 'snake_case';


*Filtrando registo de campo do tipo texto:
"SELECT * FROM nome_tabela WHERE nome_coluna LIKE "%xempl%" "
"SELECT * FROM nome_tabela WHERE nome_coluna NOT LIKE "exemp%" "

*Filtrando registro de campos do tipo numero,data e boolean:
"SELECT * FROM nome_tabela WHERE nome_coluna IS NULL;"
"SELECT * FROM nome_tabela WHERE nome_coluna IS NOT NULL;"

"SELECT * FROM nome_tabela WHERE nome_coluna BETWEEN 10 AND 30;"


*Filtrando utilizando operadores E e OU:
"SELECT * FROM nome_tabela WHERE nome_coluna > 5 AND nome_coluna < 15;"

- Para o operador logico E as duas condições precisam estar VERDADEIRO para ele ser VERDADEIRO, já o operador logico OU precisa apenas que umas das condições seja VERDADEIRO para ele ser VERDADEIRO;


*Chaves primarias(PRIMARY KEY):
- Criando tabelas e adicionando "NOT NULL" onde informa que a coluna não pode receber valor vazio e adicionando "UNIQUI" onde a coluna só receberá valores únicos. Utilizando o "PRIMARY KEY" essa função tem essas duas características. 

*Chaves estrangeiras (FOREIGN KEY):
- Um campo que estabelece relacionamento entre duas tabelas.
"FOREIGN KEY (nome_coluna_origem)
    REFERENCES nome_tabela_destino(nome_coluna_destino);"


*Consultas com relacionamentos:

- JOIN: Juntar o dado da tabela_A com o dado da tabela_B onde deverá existir uma coluna em comum nas duas tabelas.
"SELECT nome_tabelaA.nome_colunaA, nome_tabelaB.nome_colunaB FROM nome_tabelaA JOIN nome_tabelaB 
    ON nome_tabelaA.nome_colunaA = nome_tabelaB.nome_colunaB;"

- LEFT JOIN: Mostra os itens da tabela da esquerda incluindo os itens em interseção com a tabela da direita.
"FROM tabela1 LEFT JOIN tabela2 ON tabela1.produto = tabela2.produto;"

- RIGHT JOIN: Mostra os itens da tabela da direita incluindo os itens em interseção com a tabela da esquerda.

- FULL JOIN: Mostra a junção de todos os dados.

- CROSS JOIN: Faz uma junção colocando todos ta tabelaA junto com todos da tabelaB.
"SELECT * FROM nome_tabela CROSS JOIN nome_tabela2;"


*Restrição de chave estrangeira:

-DELETE CASCADE: Ao criar a tabela adicionar a instrução de -> "ON DELETE CASCADE;" para poder excluir a coluna.

-UPDATE CASCADE: Ao criar a tabela adicionar a instrução de -> "ON UPDATE CASCADE;" para poder atualizar a coluna.


*Ordenando as consultas:

-ORDER BY: Ordena um campo tanto CRESCENTE como DECRESCENTE. "ORDER BY nome_coluna ASC;" / "ORDER BY nome_coluna DESC;" utilizando sempre no final da consulta.

-LIMIT: Para limitar os registros. "LIMIT 5;" irá mostrar apenas os 5 registros.
-OFFSET: Ira percorrer os registro a partir do parâmetro dado. 
"OFFSET 1;" -> Começará a consultar a partir da posição 2.


Funções de agregação:
-COUNT: Calcula a quantidade de registros. "SELECT COUNT(nome_coluna) FROM nome_tabela;".

-SUM: Soma os valores do registro. "SELECT SUM(nome_coluna) FROM nome_tabela;".

-MAX / MIN: Mostra o valor minimo e maximo da tabela.. "SELECT MAX / MIN(nome_coluna) FROM nome_tabela;".

-COUNT: Calcula a media dos valores do registros. "SELECT AVG(nome_coluna) FROM nome_tabela;".

-ROUND: Arredando os valores dos registros.
"ROUND(AVG(nome_coluna),qntd. casas decimais)"


*Agrupamento de consultas:

-DISTINCT: Todos os dados da consulta não irão se repetir.

-GROUP BY: Utilizamos quando utilizamos funções de agregação.

-HAVING: Função é a mesma coisa do WHERE, mas é utilizada quando usamos funções de agrupamento.
