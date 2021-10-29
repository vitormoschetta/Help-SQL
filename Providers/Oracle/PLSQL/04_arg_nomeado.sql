DECLARE
   v_SEGMERCADO_ID CLIENTE.SEGMERCADO_ID%type := 3;
BEGIN
  FOR v_ID IN 1..6 LOOP 
      atualizar_cli_seg_mercado(p_ID => v_ID, p_SEGMERADO_ID => v_SEGMERCADO_ID);
  END LOOP;
END;