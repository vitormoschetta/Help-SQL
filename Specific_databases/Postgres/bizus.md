### extrair apenas os números de um texto:
```
select regexp_replace(p.cpf, '\D','','g') from customer p 
```