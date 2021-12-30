-- Trigger de linha

CREATE OR REPLACE TRIGGER TG_TESTE
	AFTER UPDATE ON MV.PRODUTO              -- essa trigger é acionada sempre que uma ação de 'UPDATE' na tabela 'PRODUTO' ocorrer.
	REFERENCING NEW AS NEW OLD AS OLD	    -- apenas para trigger de linha (old e new)
	FOR EACH ROW	                        -- apenas para trigger de linha
	BEGIN 	
		DECLARE 
		
		BEGIN		
			IF :NEW.QT_ATENDIDA > :OLD.QT_SOLIC THEN   
                RAISE_APPLICATION_ERROR(-20001, 'TG_TESTE - A Quantidade Atendida (' || :NEW.qt_atendida || ') não podera ser maior que a Solicitada (' || :OLD.qt_solic || ').');
			END IF;				
		END;
END TG_TESTE;




-- o comando SQL abaixo verifica erros/exceções geradas pela Trigger:
select * from user_errors where type = 'TRIGGER' and name = 'TG_TESTE'