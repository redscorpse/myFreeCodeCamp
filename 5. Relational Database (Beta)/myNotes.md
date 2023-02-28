# Bash

# SQL
**Export database**  
`pg_dump -U username -h localhost databasename > fileName.sql`

**Import database from fileName.sql**  
first create a database with myDBName  
`psql -U username myDBName < fileName.sql`