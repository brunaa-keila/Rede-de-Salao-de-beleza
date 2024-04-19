USE SALAO

-------- Carga Sal�o --------
CREATE OR ALTER PROCEDURE SP_OLTP_SALAO (@DATA_CARGA DATETIME)
AS
BEGIN
	DELETE FROM TB_AUX_SALAO
	WHERE @DATA_CARGA = DATA_CARGA

	INSERT INTO TB_AUX_SALAO
	SELECT @DATA_CARGA, S.ID, S.NOME, S.CIDADE, S.UF
	FROM TB_SALAO S
END


-------- Carga Agendamento --------
CREATE OR ALTER PROCEDURE SP_OLTP_AGENDAMENTO (@DATA_CARGA DATETIME)
AS
BEGIN
	DELETE FROM TB_AUX_AGENDAMENTO
	WHERE @DATA_CARGA = DATA_CARGA

	INSERT INTO TB_AUX_AGENDAMENTO
	SELECT @DATA_CARGA, A.HORARIO, A.ID_SALAO, A.ID, A.STATUS, A.VALOR_TOTAL
	FROM TB_AGENDAMENTO A
END


-------- Carga Servi�o --------
CREATE OR ALTER PROCEDURE SP_OLTP_SERVICO (@DATA_CARGA DATETIME)
AS
BEGIN
	DELETE FROM TB_AUX_SERVICO
	WHERE @DATA_CARGA = DATA_CARGA

	INSERT INTO TB_AUX_SERVICO
	SELECT @DATA_CARGA, A.HORARIO, S.ID, A.ID_CLIENTE, A.ID_SALAO, S.ID_FUNCIONARIO, S.ID_TIPO_SERVICO, T.VALOR
	FROM TB_SERVICO S JOIN TB_AGENDAMENTO A
	ON(S.ID_AGENDAMENTO = A.ID)
	JOIN TB_TIPO_SERVICO T
	ON(T.CODIGO = S.ID_TIPO_SERVICO)
END


-------- Carga Cliente --------
CREATE OR ALTER PROCEDURE SP_OLTP_CLIENTE (@DATA_CARGA DATETIME)
AS
BEGIN
	DELETE FROM TB_AUX_CLIENTE
	WHERE @DATA_CARGA = DATA_CARGA

	INSERT INTO TB_AUX_CLIENTE
	SELECT @DATA_CARGA, C.ID, C.NOME, C.DT_NASCIMENTO, C.CIDADE
	FROM TB_CLIENTE C
END


-------- Carga Tipo Servi�o --------
CREATE OR ALTER PROCEDURE SP_OLTP_TIPO_SERVICO (@DATA_CARGA DATETIME)
AS
BEGIN
	DELETE FROM TB_AUX_TIPO_SERVICO
	WHERE @DATA_CARGA = DATA_CARGA

	INSERT INTO TB_AUX_TIPO_SERVICO
	SELECT @DATA_CARGA, T.CODIGO, T.SERVICO
	FROM TB_TIPO_SERVICO T
END


-------- Carga Funcion�rio --------
CREATE OR ALTER PROCEDURE SP_OLTP_FUNCIONARIO (@DATA_CARGA DATETIME)
AS
BEGIN
	DELETE FROM TB_AUX_FUNCIONARIO
	WHERE @DATA_CARGA = DATA_CARGA

	INSERT INTO TB_AUX_FUNCIONARIO
	SELECT @DATA_CARGA, F.MATRICULA, F.NOME, F.CPF, F.TELEFONE
	FROM TB_FUNCIONARIO F
END


-------- Execu��o das Procedures --------

EXEC SP_OLTP_CLIENTE '20240101'

EXEC SP_OLTP_FUNCIONARIO '20240101'

EXEC SP_OLTP_SALAO '20240101'

EXEC SP_OLTP_TIPO_SERVICO '20240101'

EXEC SP_OLTP_AGENDAMENTO '20240101'

EXEC SP_OLTP_SERVICO '20240101'

SELECT * FROM TB_AUX_CLIENTE

SELECT * FROM TB_AUX_FUNCIONARIO

SELECT * FROM TB_AUX_SALAO

SELECT * FROM TB_AUX_TIPO_SERVICO

SELECT * FROM TB_AUX_AGENDAMENTO

SELECT * FROM TB_AUX_SERVICO

UPDATE TB_AUX_SERVICO
SET DATA_AGENDAMENTO = '20240102'

UPDATE TB_AUX_AGENDAMENTO
SET DATA_AGENDAMENTO = '20240102'