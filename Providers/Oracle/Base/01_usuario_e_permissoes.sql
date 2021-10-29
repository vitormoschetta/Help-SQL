CREATE USER vitor IDENTIFIED BY vitor DEFAULT tablespace users;
GRANT connect, resource TO vitor;
grant select, insert, update, delete on table1 to vitor;