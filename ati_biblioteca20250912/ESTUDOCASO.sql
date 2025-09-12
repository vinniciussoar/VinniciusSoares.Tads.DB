CREATE TABLE Aluno (
    RA VARCHAR2(20) PRIMARY KEY,
    nome VARCHAR2(100),
    curso VARCHAR2(100),
    email VARCHAR2(100)
);

CREATE TABLE Livro (
    ISBN VARCHAR2(20) PRIMARY KEY,
    titulo VARCHAR2(200),
    ano_publicacao NUMBER(4)
);

CREATE TABLE Autor (
    id_autor NUMBER PRIMARY KEY,
    nome VARCHAR2(100),
    nacionalidade VARCHAR2(50)
);

CREATE TABLE Exemplar (
    id_exemplar NUMBER PRIMARY KEY,
    estado VARCHAR2(50),
    disponibilidade CHAR(1),
    ISBN VARCHAR2(20)
);

CREATE TABLE Emprestimo (
    id_emprestimo NUMBER PRIMARY KEY,
    RA VARCHAR2(20),
    id_exemplar NUMBER,
    data_retirada DATE,
    data_prevista DATE,
    data_devolucao DATE
);

CREATE TABLE Livro_Autor (
    ISBN VARCHAR2(20),
    id_autor NUMBER,
    PRIMARY KEY (ISBN, id_autor)
);
