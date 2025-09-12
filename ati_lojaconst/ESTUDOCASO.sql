CREATE TABLE CLIENTE (
    id_cliente NUMBER PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    cnpj VARCHAR(14) UNIQUE
);

CREATE TABLE PRODUTO_CONCRETO (
    id_tipo_concreto NUMBER PRIMARY KEY,
    nome_concreto VARCHAR(100) NOT NULL
);

CREATE TABLE LOTE_PRODUCAO (
    id_lote NUMBER PRIMARY KEY,
    data_producao DATE NOT NULL,
    quantidade_toneladas NUMBER(10, 2) NOT NULL,
    status_lote VARCHAR(20) NOT NULL,
    valor_total NUMBER(12, 2) NOT NULL,
    
    id_cliente NUMBER,
    id_tipo_concreto NUMBER,
     CONSTRAINT fk_lote_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTE (id_cliente),
     CONSTRAINT fk_lote_tipo_concreto FOREIGN KEY (id_tipo_concreto) REFERENCES PRODUTO_CONCRETO (id_tipo_concreto)
);

CREATE TABLE RECEITA_COMPOSICAO (
    id_composicao NUMBER PRIMARY KEY,
    id_tipo_concreto NUMBER,
    nome_materia_prima VARCHAR2(50) NOT NULL,
    quantidade_necessaria NUMBER(100) NOT NULL,
    CONSTRAINT fk_rc_produto FOREIGN KEY (id_tipo_concreto) REFERENCES PRODUTO_CONCRETO (id_tipo_concreto)
);