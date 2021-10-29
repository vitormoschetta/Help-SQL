BEGIN	
	INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (2, 'Varejo');
	COMMIT;

	dbms_output.put_line('Cadastrado com sucesso');
	

EXCEPTION
-- 'dup_val_on_index' é conhecido pelo PLSQL como erro de PK Unique (não pode inserir uma chave unica já existente)
WHEN dup_val_on_index THEN 
	dbms_output.put_line('SEGMERCADO já cadastrado!');
END;