-- parametro de saída (passado e retornado por referencia) - clausula 'OUT'

CREATE OR REPLACE PROCEDURE formata_cnpj
(p_CNPJ IN CLIENTE.CNPJ%type, p_CNPJ_SAIDA OUT CLIENTE.CNPJ%type)
IS
BEGIN
   p_CNPJ_SAIDA := SUBSTR(p_CNPJ,1,3) || '/' || SUBSTR(p_CNPJ,4,2);
END;



-- executa a procedure e pega o parametro out (parecido com retorno de função)
DECLARE   
   v_CNPJ Cliente.CNPJ%type := '12345678000177';
   v_CNPJ_SAIDA Cliente.CNPJ%type;
BEGIN
   formata_cnpj(v_CNPJ, v_CNPJ_SAIDA)
   
   dbms_output.put_line('CNPJ Formatado:' || v_CNPJ_SAIDA);
END;

