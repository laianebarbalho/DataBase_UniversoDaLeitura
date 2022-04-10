DROP DATABASE IF EXISTS UNIVERSODALEITURA;

CREATE SCHEMA UNIVERSODALEITURA;
USE UNIVERSODALEITURA;


CREATE TABLE ASSOCIADOS (
	associado_id INT PRIMARY KEY AUTO_INCREMENT,
	rg char(7),
    nome varchar(50),
    sobrenome varchar(50),
    endereco varchar(150),
    cidade varchar(50),
    estado char(2)
);

CREATE TABLE TELEFONES(
	telefone_id INT PRIMARY KEY AUTO_INCREMENT,
    associado_id INT,
    telefone VARCHAR(14),
    FOREIGN KEY (associado_id) REFERENCES ASSOCIADOS (associado_id)
);
CREATE TABLE AUTORES(
	autor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    sobrenome VARCHAR(50)
);

CREATE TABLE EDITORAS(
	editora_id INT PRIMARY KEY AUTO_INCREMENT,
	razao_social VARCHAR(150),
    telefone VARCHAR(14)
);

CREATE TABLE LIVROS(
	livro_id INT PRIMARY KEY AUTO_INCREMENT,
    ISBN VARCHAR(50),
    titulo VARCHAR(100),
    ano_lancamento DATE,
    autor_id INT,
    editora_id INT,
    FOREIGN KEY (autor_id) REFERENCES AUTORES(autor_id),
    FOREIGN KEY (editora_id) REFERENCES EDITORAS (editora_id)
);

CREATE TABLE EXEMPLARES(
	exemplar_id INT PRIMARY KEY AUTO_INCREMENT,
    livro_id INT,
    danificadoSN CHAR(1) DEFAULT 'N',
    FOREIGN KEY (livro_id) REFERENCES LIVROS (livro_id)
);

CREATE TABLE EMPRESTIMOS(
	emprestimo_id INT PRIMARY KEY AUTO_INCREMENT,
    associado_id INT,
    data_emprestimo DATE,
    prazo_devolucao DATE,
    data_devolucao DATE,
    FOREIGN KEY (associado_id) REFERENCES ASSOCIADOS(associado_id)
);

CREATE TABLE EMPRESTIMO_EXEMPLARES(
	emprestimo_exemplares_id INT PRIMARY KEY AUTO_INCREMENT,
    exemplar_id INT,
    emprestimo_id INT,
    FOREIGN KEY (exemplar_id) REFERENCES EXEMPLARES (exemplar_id),
    FOREIGN KEY (emprestimo_id) REFERENCES EMPRESTIMOS(emprestimo_id)
);

DESC emprestimos;
INSERT INTO ASSOCIADOS (rg, nome, sobrenome, endereco, cidade, estado) 
VALUES('0015467', 'laiane', 'barbalho', 'Rua patolino da silva, 500', 'recife', 'PE'), ('0015468', 'luana', 'barbalho', 'Rua patolino da silva, 150', 'recife', 'PE'), 
('0015469', 'iasmim', 'gorgonio', 'Rua patolino da silva, 460', 'recife', 'PE'), ('0015470', 'inaipi', 'gorgonio', 'Rua patolino da silva, 4568', 'recife', 'PE'), ('0015471', 'lucia', 'barbalho', 'Rua patolino da silva, 125', 'recife', 'PE');
INSERT INTO TELEFONES(associado_id, telefone) VALUES(1, '11 5555-7898'), (1, '11 5555-7899'), (2, '11 4455-0001'), (2, '11 4455-0002'), (3, '11 6666-0003'), (4, '11 6666-0004'), (4, '11 7777-0002'), (5, '11 7777-0005');
INSERT INTO AUTORES (nome, sobrenome) VALUES('Daniel', 'Pato');
INSERT INTO LIVROS (ISBN, titulo, ano_lancamento, autor_id, editora_id) VALUES ('5486.45654.123.11', 'A Hora Da Estrela', '2001-08-24',1, 1), 
('5486.45654.123.12', 'A Hora Do Cometa', '1995-05-01', 1, 2), ('5486.45654.123.15', 'A Hora Do Asteroide', '2008-10-24', 1, 3),
('5486.45654.123.16', 'A Hora Da Sua Morte', '2005-09-06', 2, 2), ('5486.45654.123.17', 'A Hora Do Amor', '1985-01-01', 3, 3);
INSERT INTO EDITORAS (razao_social, telefone) VALUES('Editora Saber', '81 9535-6455'), ('Editora Iluminar', '81 9536-6466'), ('Editora Cantar', '81 9555-6410');
INSERT INTO EXEMPLARES(livro_id, danificadoSN) VALUES(1, 0), (2, 0), (1, 0), (3, 0),(5, 1);
INSERT INTO EMPRESTIMO_EXEMPLARES(exemplar_id, emprestimo_id) VALUES(1, 1), (1, 2), (2, 1), (2, 1), (3, 2);
INSERT INTO EMPRESTIMOS(associado_id, data_emprestimo, prazo_devolucao, data_devolucao) VALUES(1, '2021-05-25', '2021-05-30', '2022-05-30'), (2, '2021-05-25', '2021-05-30', '2021-05-30'), (3, '2021-05-25', '2021-05-30', '2022-05-25');