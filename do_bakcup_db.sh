# Crear nuevo dump
docker exec  tabi_postgres pg_dump -Upostgres -d dvdrental -Ft -f /db_backup.tar

# Copia el archivo desde el contenedor
docker cp tabi_postgres:/db_backup.tar db_backup.tar

# Borra el archivo del contenedor
docker exec tabi_postgres rm /db_backup.tar



