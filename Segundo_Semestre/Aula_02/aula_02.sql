CREATE OR REPLACE PACKAGE PKG_EXEMPLO AS
  v_count NUMBER := 0;  -- vari�vel p�blica
  FUNCTION FUN_VALIDA_NOME2(p_nome IN VARCHAR2) RETURN BOOLEAN;  -- fun��o p�blica
  CURSOR cursor_vendas_publi IS select * from tb_vendas; --cursor p�blico
  PROCEDURE PRC_INSERE_PRODUTOS_NOVOS; -- producedure sem par�metros

  PROCEDURE PRC_INSERE_PEDIDO (				P_COD_PEDIDO             PEDIDO.COD_PEDIDO%TYPE,
                                              P_COD_PEDIDO_RELACIONADO PEDIDO.COD_PEDIDO%TYPE,
                                              P_COD_CLIENTE            PEDIDO.COD_CLIENTE%TYPE,
                                              P_COD_USUARIO            PEDIDO.COD_USUARIO%TYPE,
                                              P_COD_VENDEDOR           PEDIDO.COD_VENDEDOR%TYPE,
                                              P_DAT_PEDIDO             PEDIDO.DAT_PEDIDO%TYPE,
                                              P_DAT_CANCELAMENTO       PEDIDO.DAT_CANCELAMENTO%TYPE,
                                              P_DAT_ENTREGA            PEDIDO.DAT_ENTREGA%TYPE,
                                              P_VAL_TOTAL_PEDIDO       PEDIDO.VAL_TOTAL_PEDIDO%TYPE,
                                              P_VAL_DESCONTO           PEDIDO.VAL_DESCONTO%TYPE,
                                              P_SEQ_ENDERECO_CLIENTE   PEDIDO.SEQ_ENDERECO_CLIENTE%TYPE);  -- procedimento p�blico
END PKG_EXEMPLO;



CREATE OR REPLACE PACKAGE BODY PKG_EXEMPLO AS
  CURSOR cursor_vendas IS
    select * from tb_vendas; -- cursor privado

  FUNCTION FUN_VALIDA_NOME2(p_nome IN VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    IF LENGTH(p_nome) > 3 AND NOT REGEXP_LIKE(p_nome, '[0-9]') THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END FUN_VALIDA_NOME2;
  procedure PRC_INSERE_PRODUTOS_NOVOS AS
  begin
    for x in cursor_vendas loop
      insert into produtos_novos
        (ordernumber,
         quantityordered,
         priceeach,
         orderlinenumber,
         sales,
         orderdate,
         status,
         qtr_id,
         month_id,
         year_id,
         productline,
         msrp,
         productcode,
         customername,
         phone,
         addressline1,
         addressline2,
         city,
         state,
         postalcode,
         country,
         territory,
         contactlastname,
         contactfirstname,
         dealsize)
      values
        (X.ordernumber,
         X.quantityordered,
         X.priceeach,
         X.orderlinenumber,
         X.sales,
         X.orderdate,
         X.status,
         X.qtr_id,
         X.month_id,
         X.year_id,
         X.productline,
         X.msrp,
         X.productcode,
         X.customername,
         X.phone,
         X.addressline1,
         X.addressline2,
         X.city,
         X.state,
         X.postalcode,
         X.country,
         X.territory,
         X.contactlastname,
         X.contactfirstname,
         X.dealsize);
      commit;
    end loop;
  end PRC_INSERE_PRODUTOS_NOVOS;
  

  PROCEDURE PRC_INSERE_PEDIDO(P_COD_PEDIDO             PEDIDO.COD_PEDIDO%TYPE,
                              P_COD_PEDIDO_RELACIONADO PEDIDO.COD_PEDIDO%TYPE,
                              P_COD_CLIENTE            PEDIDO.COD_CLIENTE%TYPE,
                              P_COD_USUARIO            PEDIDO.COD_USUARIO%TYPE,
                              P_COD_VENDEDOR           PEDIDO.COD_VENDEDOR%TYPE,
                              P_DAT_PEDIDO             PEDIDO.DAT_PEDIDO%TYPE,
                              P_DAT_CANCELAMENTO       PEDIDO.DAT_CANCELAMENTO%TYPE,
                              P_DAT_ENTREGA            PEDIDO.DAT_ENTREGA%TYPE,
                              P_VAL_TOTAL_PEDIDO       PEDIDO.VAL_TOTAL_PEDIDO%TYPE,
                              P_VAL_DESCONTO           PEDIDO.VAL_DESCONTO%TYPE,
                              P_SEQ_ENDERECO_CLIENTE   PEDIDO.SEQ_ENDERECO_CLIENTE%TYPE) IS
  
  BEGIN
  
    INSERT INTO Pedidos_Novos
      (cod_pedido,
       cod_pedido_relacionado,
       cod_cliente,
       cod_usuario,
       cod_vendedor,
       dat_pedido,
       dat_cancelamento,
       dat_entrega,
       val_total_pedido,
       val_desconto,
       seq_endereco_cliente)
    VALUES
      (p_cod_pedido,
       p_cod_pedido_relacionado,
       p_cod_cliente,
       p_cod_usuario,
       p_cod_vendedor,
       p_dat_pedido,
       p_dat_cancelamento,
       p_dat_entrega,
       p_val_total_pedido,
       p_val_desconto,
       p_seq_endereco_cliente);
    COMMIT;
  
  END PRC_INSERE_PEDIDO;

END PKG_EXEMPLO;


CALL PKG_EXEMPLO.PRC_INSERE_PRODUTOS_NOVOS() 
select * from produtos_novos
truncate table produtos_novos

CALL pkg_exemplo.PRC_INSERE_PEDIDO(10010, 5555, 55888, 5555, 6658, sysdate, sysdate+10, sysdate+1, 20000, 5, 55544);        

select * from pedidos_novos                        

CREATE OR REPLACE PACKAGE PKG_EXEMPLO AS
  v_count NUMBER := 0;  -- vari�vel p�blica
  FUNCTION FUN_VALIDA_NOME2(p_nome IN VARCHAR2) RETURN BOOLEAN;  -- fun��o p�blica
  CURSOR cursor_vendas_publi IS select * from tabela_vendas; --cursor p�blico
  PROCEDURE PRC_INSERE_PRODUTOS_NOVOS; -- producedure sem par�metros

  PROCEDURE PRC_INSERE_PEDIDO (				P_COD_PEDIDO             PEDIDO.COD_PEDIDO%TYPE,
                                              P_COD_PEDIDO_RELACIONADO PEDIDO.COD_PEDIDO%TYPE,
                                              P_COD_CLIENTE            PEDIDO.COD_CLIENTE%TYPE,
                                              P_COD_USUARIO            PEDIDO.COD_USUARIO%TYPE,
                                              P_COD_VENDEDOR           PEDIDO.COD_VENDEDOR%TYPE,
                                              P_DAT_PEDIDO             PEDIDO.DAT_PEDIDO%TYPE,
                                              P_DAT_CANCELAMENTO       PEDIDO.DAT_CANCELAMENTO%TYPE,
                                              P_DAT_ENTREGA            PEDIDO.DAT_ENTREGA%TYPE,
                                              P_VAL_TOTAL_PEDIDO       PEDIDO.VAL_TOTAL_PEDIDO%TYPE,
                                              P_VAL_DESCONTO           PEDIDO.VAL_DESCONTO%TYPE,
                                              P_SEQ_ENDERECO_CLIENTE   PEDIDO.SEQ_ENDERECO_CLIENTE%TYPE);  -- procedimento p�blico
END PKG_EXEMPLO;

BEGIN
    FOR x IN (
        SELECT
            TABLE_NAME
        FROM
            USER_TABLES
        WHERE 
            TABLE_NAME IN
            ('ECOWATT_DISPOSITIVO', 'ECOWATT_ENDERECO', 
            'ECOWATT_HISTORICO_MENSAL', 'ECOWATT_LEITURA_CONSUMO', 
            'ECOWATT_USUARIO')
    ) LOOP
        EXECUTE IMMEDIATE 'DROP TABLE'
                          || x.TABLE_NAME
                          || 'CASCADE CONSTRAINTS';
    END LOOP;
END;



BEGIN
    FOR x IN (
        SELECT
            TABLE_NAME
        FROM
            USER_TABLES
        WHERE 
            TABLE_NAME IN
            ('ECOWATT_DISPOSITIVO', 'ECOWATT_ENDERECO', 
            'ECOWATT_HISTORICO_MENSAL', 'ECOWATT_LEITURA_CONSUMO', 
            'ECOWATT_USUARIO')
    ) LOOP
        EXECUTE IMMEDIATE 'DROP TABLE'
                          || x.TABLE_NAME
                          || 'CASCADE CONSTRAINTS';
    END LOOP;
END;