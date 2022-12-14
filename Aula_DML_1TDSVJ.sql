INSERT INTO T_SIP_DEPTO(CD_DEPTO, NM_DEPTO, SG_DEPTO)
VALUES (1, 'Inteligência Digital', 'ITD');

INSERT INTO T_SIP_DEPTO(NM_DEPTO, SG_DEPTO, CD_DEPTO)
VALUES ('Financeiro', 'FIN', 2);

--
-- Insert posicional
--
INSERT INTO T_SIP_DEPTO
VALUES (3, 'Contabilidade', 'CTB');


SELECT * FROM T_SIP_DEPTO;


ALTER TABLE T_SIP_DEPTO ADD ST_DEPTO CHAR(1) NOT NULL;
ORA-01758: table must be empty to add mandatory (NOT NULL) column
01758. 00000 -  "table must be empty to add mandatory (NOT NULL) column"


ALTER TABLE T_SIP_DEPTO ADD ST_DEPTO CHAR(1);

UPDATE T_SIP_DEPTO SET ST_DEPTO = 'A';

ALTER TABLE T_SIP_DEPTO MODIFY ( ST_DEPTO CONSTRAINT CK_SIP_DEPTO_ST_DEPTO_NN NOT NULL);

SELECT * FROM T_SIP_DEPTO;

--
-- INSERT ALL
--
INSERT ALL
  INTO T_SIP_DEPTO (NM_DEPTO, SG_DEPTO, CD_DEPTO, ST_DEPTO)  VALUES ('Contas a Pagar', 'CTP', 4, 'A')
  INTO T_SIP_DEPTO (CD_DEPTO, NM_DEPTO, SG_DEPTO, ST_DEPTO)  VALUES (5, 'RH', 'DRH', 'A')
  INTO T_SIP_DEPTO (CD_DEPTO, NM_DEPTO, SG_DEPTO, ST_DEPTO)  VALUES (6, 'Tesouraria', 'DTE', 'A')
SELECT * FROM dual;

COMMIT;

SELECT * FROM T_SIP_DEPTO;


INSERT INTO T_SIP_DEPTO
VALUES (7, 'Planejamento Estratégico Organizacional Executivo', 'PEO', 'A');
Error report -
ORA-12899: value too large for column "PF0110"."T_SIP_DEPTO"."NM_DEPTO" (actual: 50, maximum: 30)

UPDATE T_SIP_DEPTO SET ST_DEPTO = 'I', NM_DEPTO = NM_DEPTO || ' * Inativo'
WHERE CD_DEPTO = 5;

DELETE FROM T_SIP_DEPTO WHERE CD_DEPTO = 4;

DELETE FROM T_SIP_DEPTO WHERE SG_DEPTO IN ('DTE', 'DRH');
DELETE FROM T_SIP_DEPTO WHERE SG_DEPTO = 'DTE' OR SG_DEPTO = 'DRH';

DELETE FROM T_SIP_DEPTO WHERE CD_DEPTO = 100;

SELECT 'O depto ' || cd_depto || ' tem o seu nome ' || nm_depto
FROM T_SIP_DEPTO;


INSERT INTO T_SIP_CIDADE (CD_CIDADE, CD_ESTADO, NM_CIDADE)
VALUES (1, 1, 'Arraial DAjuda');
Error report -
ORA-02291: integrity constraint (PF0110.FK_SIP_ESTADO_CIDADE) violated - parent key not found


INSERT ALL
  INTO T_SIP_ESTADO (CD_ESTADO, NM_ESTADO, SG_ESTADO)  VALUES (1, 'Bahia', 'BA')
  INTO T_SIP_CIDADE (CD_CIDADE, CD_ESTADO, NM_CIDADE) VALUES (1, 1, 'Arraial DAjuda')
SELECT * FROM dual;

COMMIT;

SELECT * FROM T_SIP_ESTADO;
SELECT * FROM T_SIP_CIDADE;

DELETE FROM T_SIP_ESTADO;

INSERT INTO T_SIP_ESTADO (CD_ESTADO, NM_ESTADO, SG_ESTADO)  VALUES (1, 'Paraná', 'PR');


SELECT SYSDATE, USER FROM DUAL;

ALTER SESSION SET NLS_DATE_FORMAT = 'dd/mm/yyyy hh24:mi:ss';

SELECT SYSDATE, USER FROM DUAL;

ALTER TABLE T_SIP_PROJETO RENAME COLUMN DT_INCIIO TO DT_INICIO;

INSERT INTO T_SIP_PROJETO(CD_PROJETO, NM_PROJETO, DT_INICIO)
VALUES (1, 'App no metaverso', TO_DATE('19/09/2022', 'DD/MM/YYYY') );

SELECT * FROM T_SIP_PROJETO; 
