# PostgreSQL cheatsheet


## Basic Commands

| Command | Description |
| --- | --- |
| `psql` | Connect to a PostgreSQL database |
| `createdb <database_name>` | Create a new database |
| `dropdb <database_name>` | Drop an existing database |
| `pg_dump -U <user> <database_name> > mydb.sql` | Dump a database to a file |
| `pg_restore <file_name>` | Restore a database from a file |
| `psql -d <database_name> -f <file_name>` | Run SQL commands from a file |
| `psql -d <database_name> -c "<command>"` | Run a single SQL command |

## Table Operations

| Command | Description |
| --- | --- |
| `CREATE TABLE <table_name> (<column_name> <data_type> <constraints>);` | Create a new table |
| `ALTER TABLE <table_name> ADD COLUMN <column_name> <data_type> <constraints>;` | Add a new column to an existing table |
| `ALTER TABLE <table_name> DROP COLUMN <column_name>;` | Drop a column from an existing table |
| `ALTER TABLE <table_name> ALTER COLUMN <column_name> TYPE <data_type>;` | Change the data type of a column |
| `DROP TABLE <table_name> [CASCADE];` | Drop an existing table |
| `TRUNCATE TABLE <table_name>;` | Remove all rows from a table |

## Data Manipulation

| Command | Description |
| --- | --- |
| `INSERT INTO <table_name> (<column1>, <column2>, ...) VALUES (<value1>, <value2>, ...);` | Insert a new row into a table |
| `UPDATE <table_name> SET <column1> = <value1>, <column2> = <value2>, ... WHERE <condition>;` | Update existing rows in a table |
| `DELETE FROM <table_name> WHERE <condition>;` | Delete rows from a table |
| `SELECT <column1>, <column2>, ... FROM <table_name> WHERE <condition> ORDER BY <column> ASC/DESC LIMIT <limit>;` | Retrieve data from a table |

## Query Operators

| Operator | Description |
| --- | --- |
| `=` | Equal to |
| `<>` or `!=` | Not equal to |
| `<` | Less than |
| `>` | Greater than |
| `<=` | Less than or equal to |
| `>=` | Greater than or equal to |
| `LIKE` | Similar to (with wildcard) |
| `ILIKE` | Case insensitive |
| `IN` | Matches any value in a list |
| `BETWEEN` | Matches any value between two values |
| `AND` | Logical AND |
| `OR` | Logical OR |
| `NOT` | Logical NOT |

## Aggregation Functions

| Function | Description |
| --- | --- |
| `AVG(<column_name>)` | Returns the average value of a column |
| `COUNT(<column_name>)` | Returns the number of rows in a table |
| `DISTINCT(<column_name>)` | Returns unique values |
| `MAX(<column_name>)` | Returns the maximum value of a column |
| `MIN(<column_name>)` | Returns the minimum value of a column |
| `SUM(<column_name>)` | Returns the sum of values in a column |

## Joins

| Type | Syntax | Description |
| --- | --- | --- |
| Inner Join | `SELECT * FROM t1 INNER JOIN t2 ON t1.c = t2.c;` | Returns only the matching rows between two tables |
| Left Outer Join | SELECT ... FROM <table1> LEFT JOIN <table2> ON <condition> | Returns all rows from the left table and the matching rows from the right table, or NULL values if there is no match |
| Right Outer Join | SELECT ... FROM <table1> RIGHT JOIN <table2> ON <condition> | Returns all rows from the right table and the matching rows from the left table, or NULL values if there is no match |
| Full Outer Join | SELECT ... FROM <table1> FULL OUTER JOIN <table2> ON <condition> | Returns all rows from both tables, or NULL values if there is no match |
| Cross Join | SELECT ... FROM <table1> CROSS JOIN <table2> | Returns the Cartesian product of both tables |
| Using | SELECT ... FROM <table1> JOIN <table2> USING (<column>) | Joins tables on the specified column |
| Subquery | SELECT <column1>, <column2>, ... FROM <table1> WHERE <column> IN (SELECT <column> FROM <table2> WHERE <condition>); |
| Union | SELECT <column1>, <column2>, ... FROM <table1> UNION SELECT <column1>, <column2>, ... FROM <table2>; |

## Aliases

| Syntax | Description |
| --- | --- |
| ` SELECT ... FROM <table_name> AS <alias>;` | Assigns a temporary name to a table |
| ` SELECT <column_name> AS <alias>;` | Assigns a temporary name to a column |
| ` <aggregate_function>(<expression>) AS <alias>;` | Assigns a temporary name to the result of an aggregate function |
| ` SELECT p.product_name, (SELECT AVG(price) FROM products) AS avg_price FROM products AS p;` | Aliases with subqueries. Allows to join a table more than once |

## Indexing

| Command | Description |
| --- | --- |
| `CREATE INDEX <index_name> ON <table_name> (<column_name>);` | Create an index on a table |
| `DROP INDEX <index_name>;` | Remove an index from a table |

## Transactions

| Command | Description |
| --- | --- |
| `BEGIN;` | Start a transaction |
| `COMMIT;` | End a transaction and save changes |
| `ROLLBACK;` | End a transaction and discard changes |

## User Management

| Command | Description |
| --- | --- |
| `CREATE USER <username> WITH PASSWORD '<password>' [OPTIONS];` | Create a new user with a password |
| `CREATE USER <username> WITH PASSWORD '<password>' CREATEDB;` | Create a new user with permission to create databases |
| `ALTER USER <username> WITH PASSWORD '<new_password>' [OPTIONS];` | Change a user's password |
| `GRANT <permission> ON <table_name> TO <username>;` | Grant a permission to a user |
| `REVOKE <permission> ON <table_name> FROM <username>;` | Revoke a permission from a user |
| `DROP USER <username>;` | Remove a user |

## Views

| Command | Description |
| --- | --- |
| `CREATE VIEW <view_name> AS <select_statement>;` | Create a new view |
| `DROP VIEW <view_name>;` | Delete a view |

## Functions

| Command | Description |
| --- | --- |
| `CREATE FUNCTION <function_name> (<arguments>) RETURNS <return_type> AS $$ <function_body> $$ LANGUAGE <language>;` | Create a new function |
| `DROP FUNCTION <function_name> (<arguments>);` | Delete a function |

## Triggers

Triggers are stored procedures that are executed automatically in response to specific events, such as changes made to a table. They can perform a variety of tasks, such as updating other tables or enforcing data integrity constraints. Triggers are often used to implement complex business logic or enforce data integrity rules that cannot be easily accomplished through other means. They are a powerful tool that can help to ensure that data remains consistent and accurate within a database.

| Command | Description |
| --- | --- |
| `CREATE TRIGGER <trigger_name> [BEFORE|AFTER] [INSERT|UPDATE|DELETE] ON <table_name> FOR EACH ROW [WHEN (<condition>)] EXECUTE FUNCTION <function_name>();` | Create a new trigger |
| `DROP TRIGGER <trigger_name> ON <table_name>;` | Delete a trigger |

## Window Functions

| Type | Syntax |
| --- | --- |
| Row Number | `ROW_NUMBER() OVER (ORDER BY <column>);` |
| Rank | `RANK() OVER (ORDER BY <column>);` |
| Dense Rank | `DENSE_RANK() OVER (ORDER BY <column>);` |
| Running Total | `SUM(<column>) OVER (ORDER BY <column>);` |
| Moving Average | `AVG(<column>) OVER (ORDER BY <column> ROWS <n> PRECEDING);` |

## Materialized Views

| Command | Description |
| --- | --- |
| `CREATE MATERIALIZED VIEW <view_name> AS <select_statement>;` | Create a new materialized view |
| `REFRESH MATERIALIZED VIEW <view_name>;` | Refresh the data in a materialized view |
| `DROP MATERIALIZED VIEW <view_name>;` | Delete a materialized view |

## JSON and JSONB

| Command | Description |
| --- | --- |
| `CREATE TABLE <table_name> (<column_name> JSON);` | Create a new table with a JSON column |
| `SELECT <column_name>->'key' FROM <table_name>;` | Retrieve a value from a JSON column |
| `SELECT <column_name>->>'key' FROM <table_name>;` | Retrieve a string value from a JSON column |
| `CREATE INDEX <index_name> ON <table_name> USING gin (<column_name> jsonb_path_ops);` | Create an index on a JSON column |

---

## Other frequent commands

| Command | Description |
| --- | --- |
| `ALTER TABLE <table_name> ALTER COLUMN <column_name> SET NOT NULL;` | Set a column as NOT NULL |
| `ALTER TABLE <table_name> ADD CONSTRAINT <constraint_name> <constraint_type> (<column_name>);` | Add a constraint |
| `ALTER TABLE elements ADD UNIQUE(symbol, name);` | Set unique column |
| `SELECT * FROM t LIMIT 5;` | Show only 5 rows |
| `psql -U postgres < worldcup.sql` | Import |
| `ALTER TABLE t ALTER COLUMN c TYPE newDataType` | Change datatype |

#### Alter multiple columns at once

Set NOT NULL to all columns from a table at once

```psql
--SELECT 'ALTER TABLE ' || table_name || ' ALTER COLUMN ' || column_name || ' SET NOT NULL;' FROM information_schema.columns WHERE table_name IN ('teams', 'games') AND is_nullable = 'YES';
```
*Using `table_name IN ('teams', 'games')` is the same as `(table_name = 'teams' OR table_name = 'games')`.*

The previous query generated the necessary command, but you need to execute them:

```psql
DO $$ 
DECLARE 
    stmt text;
BEGIN 
    FOR stmt IN 
        SELECT 'ALTER TABLE ' || table_name || ' ALTER COLUMN ' || column_name || ' SET NOT NULL;' 
        FROM information_schema.columns 
        WHERE table_name IN ('teams', 'games') 
        AND is_nullable = 'YES' 
    LOOP 
        EXECUTE stmt; 
    END LOOP; 
END $$;
```





















---
<footer>
This cheatsheet was created with ChatGPT and modified according to freeCodeCamp lessons.
</footer>