exc 1

CREATE OR REPLACE TRIGGER trg_log_update_vendas
AFTER UPDATE ON VENDAS
FOR EACH ROW
BEGIN
    INSERT INTO LOG_VENDAS (
        operacao,
        id_venda,
        produto,
        vendedor,
        valor,
        usuario,
        data_hora,
        observacao
    ) VALUES (
        'UPDATE',
        :NEW.id,
        :NEW.produto,
        :NEW.vendedor,
        :NEW.valor,
        USER,
        SYSDATE,
        'Venda atualizada. Valor anterior: ' || :OLD.valor
    );
END;
/

--exc 2

CREATE OR REPLACE PROCEDURE total_vendas_vendedor (
    p_vendedor IN VARCHAR2,
    p_total OUT NUMBER
) AS
BEGIN
    SELECT NVL(SUM(valor), 0)
    INTO p_total
    FROM VENDAS
    WHERE vendedor = p_vendedor;
END;
/

--exc 3
CREATE OR REPLACE TRIGGER trg_valida_valor_venda
BEFORE INSERT ON VENDAS
FOR EACH ROW
BEGIN
    IF :NEW.valor <= 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'O valor da venda deve ser maior que zero.');
    END IF;
END;
/
