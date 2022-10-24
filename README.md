# Stack Pentaho Bi-Server + PG + PGAdmin4

En la Materia "Tecnologia Aplicada a Business Intelligence" (mejor conocida como TABI), vamos a trabajar con algunas herramientas utiles.

Para que puedan contar con estas herramientas de una manera sencilla, ponemos a disposicion este stack docker.

Stack:

* [Pentaho Bi Server 9.0](https://es.wikipedia.org/wiki/Pentaho)
* [Postgres SQL](https://www.postgresql.org/)
* [PG Admin 4](https://www.pgadmin.org/)


## Instalación

Requiere tener instalado:

* [Docker](https://www.docker.com/)
* [Docker compose](https://docs.docker.com/compose/)

## Ejecucion

> clone https://github.com/TABI-UNLP/pentaho-biserver.git \
> cd pentaho-biserver  \
> docker-compose up -d

## Uso

  Pentaho: http://localhost:8080
  (admin/password)

  PGAdmin: http://localhost:5050
  (admin@gmail.com/212121)

Postgres SQL:

* host:localhost
* port:5432
* user: postgres
* pass: 212121

## Stop

Si se necesita liberar recursos sin destruir los contenedores se puede hacer

> docker-compose stop

## Start

Para volver a activarlos:

> docker-compose stop

## Down

Para destruir los contenedores:

> docker-compose down

## Carga de Datos

En la materia vamos a trabajar con la base de datos [DVD Rental](https://www.postgresqltutorial.com/postgresql-sample-database/)

Segui los siguientes pasos para cargarla en nuestro stack:

> cd pentaho-biserver \
> ./do_restore.sh

Si el comando anterior falla, ejecutar paso a paso lo siguiente:

> cd pentaho-biserver \
> docker exec tabi_postgres psql -Upostgres -c "create database dvdrental" \
> docker cp dvdrental_v2.tar tabi_postgres:/ \
> docker exec tabi_postgres pg_restore -Upostgres -d dvdrental  /dvdrental_v2.tar \
> docker exec tabi_postgres rm /dvdrental_v2.tar 


Nota: En caso que el último comando falle en windows: 
```
docker exec -it tabi_postgres 
pg_restore -Upostgres -d dvdrental /tmp/dvdrental.tar
exit
```

## Carga mysql dump

- acceder a phpMyAdmin localhost:8081 (host: mariadb / user: root / password: password)
- Crear la bbdd deseada
- En la terminal ejecutar:
 
```
docker exec -i tabi_mariadb sh -c 'exec mysql -uroot -p"password" ${nuestraDB}' < /path/to/dump/dump.sql
```
Ahora deberiamos ver la base cargada en phpMyAdmin



## Crear Conexión
- Entrar en pgadmin, navegar a localhost:5050
- Entrar con las credenciales (admin@gmail.com/212121)
- Agregar conexión a DvdRental recientemente restaurada
  - Ir a "add new server"
  - En connection > hostname colocamos "postgres", username "postgres" y password "212121"
  - Guardamos la conexión
- Vamos a Schemas > public > Tables y deberían estar nuestra tablas
- Realizamos alguna query simple para probar por medio de "Query Tool"

- Tutorial [PostgresYa](https://www.tutorialesprogramacionya.com/postgresqlya/)
- Tutorial [PostgresTutorial](https://www.postgresqltutorial.com/)

