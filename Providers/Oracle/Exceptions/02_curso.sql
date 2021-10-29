-- raise_application_error lança exceções customizadas

DECLARE
	e_null exception;

BEGIN		
	INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (2, 'Varejo');
	COMMIT;

	dbms_output.put_line('Cadastrado com sucesso');
	
EXCEPTION
   WHEN dup_val_on_index THEN
       raise_application_error(-20010, 'Cliente j� cadastrado !!!!');
   WHEN e_null THEN
       raise_application_error(-20015, 'A coluna ID n�o pode receber valores nulos ou vazios !!!!');
   WHEN others THEN
       raise_application_error(-20020, 'Erro gen�rico : ' || sqlerrm()); -- 'sqlerrm' funcao oracle plsql que pega mensagem de erro padrão
  
END;