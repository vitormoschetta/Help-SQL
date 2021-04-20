No Sql Server não é possível utilizar a cláusula 'Like' em propriedades do tipo DateTime/Date. A solução é utilizar o código a baixo:


```
SELECT * FROM MovimentacoesProcesso 
where  (DATEPART(dd, DtMovimentacao) = 24
AND    DATEPART(mm, DtMovimentacao) = 07
AND    DATEPART(yy, DtMovimentacao) = 2018)

SELECT * FROM MovimentacoesProcesso where  (DATEPART(dd, DtMovimentacao) = 2) 
SELECT * FROM MovimentacoesProcesso where  (DATEPART(mm, DtMovimentacao) = 07)
SELECT * FROM MovimentacoesProcesso where  (DATEPART(yy, DtMovimentacao) = 2018)
```
