






### extrair apenas os números de um texto:
```
select regexp_replace(p.cpf, '[^0-9]') from customer p 
```