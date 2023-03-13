CREATE SCHEMA ACADEMICO;

CREATE TABLE ACADEMICO.ALUNO(
	ID SERIAL PRIMARY KEY,
	PRIMEIRO_NOME VARCHAR(255) NOT NULL,
	ULTIMO_NOME VARCHAR(255) NOT NULL,
	DATA_NASCIMENTO DATE NOT NULL
);

CREATE TABLE ACADEMICO.CATEGORIA(
	ID SERIAL PRIMARY KEY,
	NOME VARCHAR(255) NOT NULL
);

CREATE TABLE ACADEMICO.CURSO(
	ID SERIAL PRIMARY KEY,
	NOME VARCHAR(255) NOT NULL,
	CATEGORIA_ID INTEGER NOT NULL REFERENCES ACADEMICO.CATEGORIA(ID)	
);


CREATE TABLE ACADEMICO.ALUNO_CURSO(
	ALUNO_ID INTEGER NOT NULL REFERENCES ACADEMICO.ALUNO(ID),
	CURSO_ID INTEGER NOT NULL REFERENCES ACADEMICO.CURSO(ID),
	PRIMARY KEY(CURSO_ID,ALUNO_ID)
);

SELECT * FROM ACADEMICO.ALUNO;


/* TESTANDO O CHECK */ 
CREATE TEMPORARY TABLE A (
	COLUNA VARCHAR(20) NOT NULL
);
INSERT INTO A VALUES ('');
SELECT * FROM A;

DROP TABLE A;
CREATE TEMPORARY TABLE A (
	COLUNA VARCHAR(20) NOT NULL CHECK (COLUNA != '')
);

DROP TABLE A;
CREATE TEMPORARY TABLE A (
	ID INTEGER UNIQUE,
	COLUNA VARCHAR(20) NOT NULL DEFAULT 'SEM_NOME' CHECK(COLUNA != '')
	
);
INSERT INTO A VALUES (1);
INSERT INTO A VALUES (2,'João');
SELECT * FROM A;

/* ALTERAR INFORMAÇÕES DA TABELA */

ALTER TABLE A RENAME TO TESTE;
SELECT * FROM TESTE;

ALTER TABLE TESTE RENAME COLUNA TO PRIMEIRA_COLUNA;
ALTER TABLE TESTE RENAME ID TO ID_COLUNA;

ALTER TABLE TESTE ADD COLUMN NOME VARCHAR(128) NOT NULL DEFAULT '0';
ALTER TABLE TESTE DROP COLUMN NOME;

UPDATE TESTE SET NOME = 'JOAO' WHERE ID_COLUNA = 1;
UPDATE TESTE SET NOME = 'MARCOS' WHERE ID_COLUNA = 2;
SELECT * FROM TESTE;

/* MAIS DETALHES COM INSERT */

CREATE TABLE ACADEMICO.ALUNO(
	ID SERIAL PRIMARY KEY,
	PRIMEIRO_NOME VARCHAR(255) NOT NULL,
	ULTIMO_NOME VARCHAR(255) NOT NULL,
	DATA_NASCIMENTO DATE NOT NULL
);

CREATE TABLE ACADEMICO.CATEGORIA(
	ID SERIAL PRIMARY KEY,
	NOME VARCHAR(255) NOT NULL
);

CREATE TABLE ACADEMICO.CURSO(
	ID SERIAL PRIMARY KEY,
	NOME VARCHAR(255) NOT NULL,
	CATEGORIA_ID INTEGER NOT NULL REFERENCES CATEGORIA(ID)	
);


CREATE TABLE ACADEMICO.ALUNO_CURSO(
	ALUNO_ID INTEGER NOT NULL REFERENCES ALUNO(ID),
	CURSO_ID INTEGER NOT NULL REFERENCES CURSO(ID),
	PRIMARY KEY(CURSO_ID,ALUNO_ID)
);


/* ADICIONANDO DADOS */

INSERT INTO ACADEMICO.aluno (primeiro_nome, ultimo_nome, data_nascimento) VALUES (
	'Vinicius', 'Dias', '1997-10-15'
), (
	'Patricia', 'Freitas', '1986-10-25'
), (
	'Diogo', 'Oliveira', '1984-08-27'
), (
	'Maria', 'Rosa', '1985-01-01'
), (
	'João', 'Ramos', '1999-06-03'
);

INSERT INTO ACADEMICO.categoria (nome) VALUES ('Front-end'), ('Programação'), ('Bancos de dados'), ('Data Science');

INSERT INTO ACADEMICO.curso (nome, CATEGORIA_ID) VALUES
	('HTML', 1),
	('CSS', 1),
	('JS', 1),
	('PHP', 2),
	('Java', 2),
	('C++', 2),
	('PostgreSQL', 3),
	('MySQL', 3),
	('Oracle', 3),
	('SQL Server', 3),
	('SQLite', 3),
	('Pandas', 4),
	('Machine Learning', 4),
	('Power BI', 4);
	
INSERT INTO ACADEMICO.aluno_curso VALUES (1, 4), (1, 11), (2, 1), (2, 2), (3, 4), (3, 3), (4, 4), (4, 6), (4, 5);

/* CRIAR TABELA TEMPORARIA POR MEIO DO SELECT */

SELECT ACADEMICO.CURSO.ID,ACADEMICO.CURSO.NOME FROM ACADEMICO.CURSO
JOIN ACADEMICO.CATEGORIA ON ACADEMICO.CATEGORIA.ID = ACADEMICO.CURSO.CATEGORIA_ID
WHERE ACADEMICO.CATEGORIA.ID = 2;

CREATE TEMPORARY TABLE CURSO_PORGRAÇÃO (
	ID_CURSO INTEGER PRIMARY KEY,
	NOME_CURSO VARCHAR(255) NOT NULL
);

ALTER TABLE CURSO_PORGRAÇÃO RENAME TO CURSO_PROGRAMACAO;

SELECT * FROM CURSO_PROGRAMACAO;

INSERT INTO CURSO_PROGRAMACAO 
SELECT ACADEMICO.CURSO.ID,ACADEMICO.CURSO.NOME FROM ACADEMICO.CURSO
	JOIN ACADEMICO.CATEGORIA ON ACADEMICO.CATEGORIA.ID = ACADEMICO.CURSO.CATEGORIA_ID
	WHERE ACADEMICO.CATEGORIA.ID = 2;
	
	
/* IMPORTAÇÃO DE DADOS */

CREATE SCHEMA TESTE;

CREATE TABLE TESTE.CURSO_PROGRACAO(
	ID_CURSO INTEGER PRIMARY KEY,
	NOME_CURSO VARCHAR(255) NOT NULL
);

INSERT INTO TESTE.CURSO_PROGRAMACAO 
SELECT ACADEMICO.CURSO.ID,ACADEMICO.CURSO.NOME FROM ACADEMICO.CURSO
	JOIN ACADEMICO.CATEGORIA ON ACADEMICO.CATEGORIA.ID = ACADEMICO.CURSO.CATEGORIA_ID
	WHERE ACADEMICO.CATEGORIA.ID = 2;
	
SELECT * FROM TESTE.CURSO_PROGRAMACAO;	

/* AVANÇANDO UPDATE */

SELECT * FROM ACADEMICO.CURSO ORDER BY 1;
SELECT * FROM TESTE.CURSO_PROGRAMACAO ORDER BY 1;

UPDATE ACADEMICO.CURSO SET NOME = 'PHP Basico' WHERE ID = 4;
UPDATE ACADEMICO.CURSO SET NOME = 'Java Basico' WHERE ID = 5;
UPDATE ACADEMICO.CURSO SET NOME = 'C++ Basico' WHERE ID = 6;

UPDATE TESTE.CURSO_PROGRAMACAO SET NOME_CURSO = NOME
	FROM ACADEMICO.CURSO
	WHERE ACADEMICO.CURSO.ID = TESTE.CURSO_PROGRAMACAO.ID_CURSO
		AND ACADEMICO.CURSO.ID < 10;
	
	
/* AVANÇANDO DELETE */

SELECT * FROM CURSO;
SELECT * FROM CATEGORIA;

INSERT INTO CURSO (NOME,CATEGORIA_ID) VALUES ('GOLANG',5);

DELETE FROM CURSO USING CATEGORIA WHERE CATEGORIA.ID = CURSO.CATEGORIA_ID
	AND CATEGORIA.NOME = 'Teste';
	
DELETE FROM CATEGORIA WHERE ID = 5;

SELECT * FROM TESTE.CURSO_PROGRAMACAO WHERE ID_CURSO = 10;
DELETE FROM TESTE.CURSO_PROGRAMACAO WHERE ID_CURSO = 10;

/* TRANSAÇÕES */
/* PARA COMEÇAR UMA TRANSAÇÃO PODEMOS UTILIZAR 'START TRANSACTION' OU ME POSTGRESQL 'BEGIN' */

/* ROLLBACK DESFAZER ALTERAÇÕES */
BEGIN;
DELETE FROM TESTE.CURSO_PROGRAMACAO;
ROLLBACK;

SELECT * FROM TESTE.CURSO_PROGRAMACAO;

/* COMMIT CONFIRMAR ALTERAÇÕES */
BEGIN;
DELETE FROM TESTE.CURSO_PROGRAMACAO WHERE ID_CURSO = 60;
COMMIT;

/* SEQUENCIAS */

CREATE SEQUENCE EU_CRIEI;
SELECT NEXTVAL ('EU_CRIEI');
SELECT CURRVAL ('EU_CRIEI');

CREATE TEMPORARY TABLE AUTO(
	ID INTEGER PRIMARY KEY DEFAULT NEXTVAL('EU_CRIEI'),
	NOME VARCHAR(30) NOT NULL
);

INSERT INTO AUTO (NOME) VALUES ('Vinicius Dias');
INSERT INTO AUTO (ID,NOME) VALUES (2,'Vinicius Dias');
INSERT INTO AUTO (NOME) VALUES ('João Ramos');
INSERT INTO AUTO (ID,NOME) VALUES (7,'Vinicius Dias');

SELECT * FROM AUTO;

/* ENUM */

CREATE TYPE CLASSIFICACAO AS ENUM ('LIVRE','12_ANOS','14_ANOS','16_ANOS','18_ANOS');

CREATE TEMPORARY TABLE FILMES(
	ID SERIAL PRIMARY KEY,
	NOME VARCHAR(255) NOT NULL,
	CLASSIFICACAO CLASSIFICACAO
);

INSERT INTO FILMES(NOME, CLASSIFICACAO) VALUES ('UM FILME QUALQUER','TESTE');
INSERT INTO FILMES(NOME, CLASSIFICACAO) VALUES ('UM FILME QUALQUER','14_ANOS');

SELECT * FROM FILMES;