
# Bizus


### Extrair apenas os números de um texto:
```
select regexp_replace(p.cpf, '[^0-9]') from customer p 
```


### Desbloquear usuário quando Oracle pedir para alterar a senha
O comando abaixo desbloqueia e define uma senha para o usuário bloqueado (pode manter a mesma senha):
```
alter user <username> identified by <password> account unlock;
```


### Definir tempo de vida da senha ilimitada
Com o comando abaixo o Oracle não irá solicitar alteração de senha ao usuario:
```
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;
```
