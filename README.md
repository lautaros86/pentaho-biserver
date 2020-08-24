# Stack Pentaho Bi-Server + PG + PGAdmin4

En la Materia "Tecnologia Aplicada a Business Intelligence" (mejor conocida como TABI), vamos a trabajar con algunas herramientas utiles.

Para que puedan contar con estas herramientas de una manera sencilla, ponemos a disposicion este stack docker.

Stack para ejecutar:

* [Pentaho Bi Server 9.0](https://es.wikipedia.org/wiki/Pentaho)
* [Postgres SQL](https://www.postgresql.org/)
* [PG Admin 4](https://www.pgadmin.org/)


## Instalación

Requiere tener instalado:

* [Docker](https://www.docker.com/)
* [Docker compose](https://docs.docker.com/compose/)

## Ejecucion

> clone https://github.com/TABI-UNLP/pentaho-biserver.git
> cd penthao-server  
> docker-compose up -d

## Uso

  Pentaho: http://localhost:8080
  (admin/password)

  PGAdmin: http://localhost:5050
  (admin/212121)

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

> cd pentaho-biserver
> docker exec -it tabi_postgres psql -Upostgres -c 'create database dvdrental'
> docker cp dvdrental.tar tabi_postgres:/tmp
> docker exec -it tabi_postgres pg_restore -Upostgres -d dvdrental /tmp/dvdrental.tar