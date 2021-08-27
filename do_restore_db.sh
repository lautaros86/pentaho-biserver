
# Crea la base de datos
docker exec tabi_postgres psql -Upostgres -c "create database dvdrental"

# Copia el archivo al contenedor
docker cp dvdrental_v2.tar tabi_postgres:/

# Restore el backup
docker exec tabi_postgres pg_restore -Upostgres -d dvdrental  /dvdrental_v2.tar

# Borra el archivo del contenedor
docker exec tabi_postgres rm /dvdrental_v2.tar



