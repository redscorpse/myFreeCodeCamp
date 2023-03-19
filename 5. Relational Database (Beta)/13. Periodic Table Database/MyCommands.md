### Part 1: Fix the database
#### rename columns

```sh
psql -U freecodecamp periodic_table
```

```psql
ALTER TABLE properties RENAME weight TO atomic_mass;
ALTER TABLE properties RENAME melting_point TO melting_point_celsius;
ALTER TABLE properties RENAME boiling_point TO boiling_point_celsius;

ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;
ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;

ALTER TABLE elements ADD UNIQUE(symbol, name);

ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;
ALTER TABLE elements ALTER COLUMN name SET NOT NULL;

-- ALTER TABLE properties ADD PRIMARY KEY (atomic_number), ADD FOREIGN KEY (atomic_number) REFERENCES elements (atomic_number);
ALTER TABLE properties ADD FOREIGN KEY (atomic_number) REFERENCES elements (atomic_number);

CREATE TABLE types(type_id SERIAL PRIMARY KEY, type VARCHAR(30) NOT NULL);
-- SELECT DISTINCT(type) FROM properties;
INSERT INTO types(type) VALUES('metal'), ('metalloid'), ('nonmetal');

ALTER TABLE properties ADD COLUMN type_id INT, ADD FOREIGN KEY (type_id) REFERENCES types(type_id);
UPDATE properties SET type_id = types.type_id FROM types WHERE properties.type = types.type;
ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;

UPDATE elements SET symbol=INITCAP(symbol);

ALTER TABLE properties ALTER COLUMN atomic_mass TYPE DECIMAL;
UPDATE properties SET atomic_mass=TRIM(TRAILING '0' FROM CAST(atomic_mass AS TEXT))::DECIMAL;

INSERT INTO elements(atomic_number, symbol, name) VALUES(9, 'F', 'Fluorine');
INSERT INTO properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES(9, 'nonmetal', 18.998, -220, -188.1, 3);

INSERT INTO elements(atomic_number, symbol, name) VALUES(10, 'Ne', 'Neon');
INSERT INTO properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES(10, 'nonmetal', 20.18, -248.6, -246.1, 3);

DELETE FROM properties WHERE atomic_number=1000;
DELETE FROM elements WHERE atomic_number=1000;

ALTER TABLE properties DROP COLUMN type;
```

```sh
mkdir periodic_table; cd periodic_table; git init
git checkout -b main
touch element.sh; chmod +x element.sh
```

My commits:
```git
git log --onelined
85a0a2 (HEAD -> main) fix: tests don't accept a message with a new line
8236a5c fix: must delete 'TYPE' column
f55d188 fix: set 'BAR' as separator
bd6055d fix: loops should be nested
7c93564 fix: distinguish between strings and integers
020decf feat: write the script following the conditions
1f6b043 Initial commit
```