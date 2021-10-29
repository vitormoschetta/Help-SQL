CREATE OR REPLACE FUNCTION categoria_cliente
(p_FATURAMENTO_PREVISTO IN CLIENTE.FATURAMENTO_PREVISTO%type)
RETURN CLIENTE.CATEGORIA%type
IS
   v_CATEGORIA CLIENTE.CATEGORIA%type;
BEGIN
    IF p_FATURAMENTO_PREVISTO < 10000 THEN
       v_CATEGORIA := 'PEQUENO';
   ELSIF p_FATURAMENTO_PREVISTO < 50000 THEN
       v_CATEGORIA := 'M�DIO';
   ELSIF p_FATURAMENTO_PREVISTO < 100000 THEN
       v_CATEGORIA := 'M�DIO GRANDE';   
   ELSE     
       v_CATEGORIA := 'GRANDE';  
   END IF;    
   RETURN v_CATEGORIA;
END;