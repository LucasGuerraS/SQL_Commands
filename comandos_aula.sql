

--
-- Tabela DUAL, interna do SGBDR Oracle
--
SELECT * FROM DUAL;

SELECT TO_CHAR(TO_DATE( '21/05/1882', 'DD/MM/YYYY'),'DAY') 
FROM  T_SIP_DEPTO;

CREATE SEQUENCE SQ_T_SIP_DEPTO
START WITH 16
INCREMENT BY 1
MAXVALUE 20
NOCYCLE;

INSERT INTO T_SIP_DEPTO( CD_DEPTO, NM_DEPTO, SG_DEPTO, ST_DEPTO)
VALUES (SQ_T_SIP_DEPTO.NEXTVAL, 'Marketing Digital', 'DMG', 'A');

SELECT SQ_T_SIP_DEPTO.CURRVAL FROM DUAL;

INSERT INTO T_SIP_DEPTO( CD_DEPTO, NM_DEPTO, SG_DEPTO, ST_DEPTO)
VALUES (SQ_T_SIP_DEPTO.NEXTVAL, 'Automação Industrial', 'DAI', 'I');

INSERT INTO T_SIP_DEPTO( CD_DEPTO, NM_DEPTO, SG_DEPTO, ST_DEPTO)
VALUES (SQ_T_SIP_DEPTO.NEXTVAL, 'SAC', 'SAC', 'A');

INSERT INTO T_SIP_DEPTO( CD_DEPTO, NM_DEPTO, SG_DEPTO, ST_DEPTO)
VALUES (SQ_T_SIP_DEPTO.NEXTVAL, 'Custos', 'DCU', 'I');

INSERT INTO T_SIP_DEPTO( CD_DEPTO, NM_DEPTO, SG_DEPTO, ST_DEPTO)
VALUES (SQ_T_SIP_DEPTO.NEXTVAL, 'Estoque', 'DES', 'I');

INSERT INTO T_SIP_DEPTO( CD_DEPTO, NM_DEPTO, SG_DEPTO, ST_DEPTO)
VALUES (SQ_T_SIP_DEPTO.NEXTVAL, 'Embalagem', 'DEM', 'I');

Error starting at line : 21 in command -
INSERT INTO T_SIP_DEPTO( CD_DEPTO, NM_DEPTO, SG_DEPTO, ST_DEPTO)
VALUES (SQ_T_SIP_DEPTO.NEXTVAL, 'Embalagem', 'DEM', 'I')
Error report -
ORA-08004: sequence SQ_T_SIP_DEPTO.NEXTVAL 
exceeds MAXVALUE and cannot be instantiated

CREATE SEQUENCE SQ_T_SIP_FUNCIONARIO
START WITH 1
INCREMENT BY 1
NOCYCLE;

INSERT INTO T_SIP_FUNCIONARIO
(NR_MATRICULA, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, 
DT_ADMISSAO, VL_SALARIO)
VALUES
(SQ_T_SIP_FUNCIONARIO.NEXTVAL,
SQ_T_SIP_DEPTO.CURRVAL,
'Siaht Sepol',
SYSDATE-13555,
SYSDATE,
DBMS_RANDOM( 13454, 31000)
);

SELECT SQ_T_SIP_FUNCIONARIO.CURRVAL FROM DUAL;

SELECT * FROM T_SIP_FUNCIONARIO;

ALTER SEQUENCE SQ_T_SIP_DEPTO MAXVALUE 99;

--
-- INSERT ALL
--
INSERT ALL
	INTO T_SIP_DEPTO(CD_DEPTO, NM_DEPTO, SG_DEPTO, ST_DEPTO)
	VALUES (SQ_T_SIP_DEPTO.NEXTVAL, 'Lobby Relações Especiais', 'DMG', 'A')
	INTO T_SIP_FUNCIONARIO(NR_MATRICULA, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, 
							DT_ADMISSAO, VL_SALARIO)
	VALUES(	SQ_T_SIP_FUNCIONARIO.NEXTVAL,
			SQ_T_SIP_DEPTO.CURRVAL,
			'Ovatsug Avlis',
			SYSDATE-18000,
			SYSDATE,
			DBMS_RANDOM.VALUE( 13454, 31000)
            )
	INTO T_SIP_DEPENDENTE(NR_MATRICULA, CD_DEPENDENTE, NM_DEPENDENTE, DT_NASCIMENTO)
	VALUES(	SQ_T_SIP_FUNCIONARIO.CURRVAL,
			1,
			'Leinad Avlis',
			SYSDATE-3650)
	INTO T_SIP_DEPENDENTE(NR_MATRICULA, CD_DEPENDENTE, NM_DEPENDENTE, DT_NASCIMENTO)
	VALUES(	SQ_T_SIP_FUNCIONARIO.CURRVAL,
			2,
			'Ana Avlis',
			SYSDATE-1650)			
SELECT * FROM DUAL;

--
-- Identico ao MySQL e SQLServer (auto identify)
--

