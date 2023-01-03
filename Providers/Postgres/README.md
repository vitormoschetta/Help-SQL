#### extrair apenas os números de um texto:
```
select regexp_replace(p.cpf, '\D','','g') from customer p 
```

#### Verificar conexões simultaneas ao banco:
```
SELECT * FROM pg_stat_activity
```

#### Data atual:
```
SELECT NOW()
```

#### Data atual - 1 dia (ontem):
```
SELECT NOW() - INTERVAL '1 DAY';
```
ou
```
select now()::DATE - 1
``` 

#### Excluir registros duplicados:
```
DELETE FROM product a USING (
  SELECT MIN(ctid) as ctid, code
    FROM product 
    GROUP BY code HAVING COUNT(*) > 1
  ) b
WHERE a.code = b.code 
AND a.ctid <> b.ctid
```

**ctid** é um tipo de identificador TEMPORÁRIO de registros interno do postgresql. Saiba mais sobre as colunas implícitas do postgresql:  
<https://www.postgresql.org/docs/8.2/ddl-system-columns.html>


### Estatisca de banco de dados
```
select * from pg_catalog.pg_stat_activity
```
https://www.postgresql.org/docs/9.4/monitoring-stats.html


