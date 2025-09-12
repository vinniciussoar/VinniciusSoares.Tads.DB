CREATE TABLE PROFESSOR_SALA (
    professor VARCHAR2(100) PRIMARY KEY,
    sala VARCHAR2(50) NOT NULL
);


CREATE TABLE DISCIPLINA_SALA (
    disciplina VARCHAR2(100) PRIMARY KEY,
    sala VARCHAR2(50) NOT NULL
);


CREATE TABLE AULAS (
    professor_nome VARCHAR2(100) NOT NULL,
    disciplina_nome VARCHAR2(100) NOT NULL,

    
    CONSTRAINT fk_professor FOREIGN KEY (professor_nome) REFERENCES PROFESSOR_SALA(professor),
    CONSTRAINT fk_disciplina FOREIGN KEY (disciplina_nome) REFERENCES DISCIPLINA_SALA(disciplina),

   
    PRIMARY KEY (professor_nome, disciplina_nome)
);