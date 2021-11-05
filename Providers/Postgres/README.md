### extrair apenas os números de um texto:
```
select regexp_replace(p.cpf, '\D','','g') from customer p 
```

### Verificar conexões simultaneas ao banco:
```
SELECT * FROM pg_stat_activity
```
