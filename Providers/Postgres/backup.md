# Make a backup from RDS
```
pg_dump -h <rds host> -p 5432 -F c -O -U <rds user> <db name> > db.dump
```

# Restore the backup into a Docker container
```
docker run --rm --interactive --link <postgres container id>:postgres --volume $PWD/:/tmp/ postgres:latest /bin/bash -c 'pg_restore --verbose --clean --no-acl --no-owner -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres -d <db name> /tmp/db.dump'
```

# Access the db interactively
```
docker run --rm --interactive --tty --link <postgres container id>:postgres --volume $PWD/:/tmp/ postgres:latest /bin/bash -c 'psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres -d <db name>'
```

# Make a backup of a dockerized postgres
```
docker run --rm --interactive --link <postgres container id>:postgres --volume $PWD/:/tmp/ postgres:latest /bin/bash -c 'pg_dump -h "$POSTGRES_PORT_5432_TCP_ADDR" -p $POSTGRES_PORT_5432_TCP_PORT -F c -O -U postgres <db name> > /tmp/db.dump'
```
