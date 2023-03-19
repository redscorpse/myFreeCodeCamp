#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


while [[ -z $ATOMIC_NUMBER  ||  $ELEMENT ]]; do
  read -p "Atomic number: " ATOMIC_NUMBER
  # if it's registered
  ELEMENT="$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$ATOMIC_NUMBER;")"
  if [[ $ELEMENT ]]; then
    echo "This element it's already registered, enter a new one."
  fi
done

while [[ -z $SYMBOL ]]; do
  read -p "Element Symbol: " SYMBOL
done

while [[ -z $ELEMENT_NAME ]]; do
  read -p "Element name: " ELEMENT_NAME
done

while [[ -z $ATOMIC_MASS ]]; do
  read -p "Atomic mass: " ATOMIC_MASS
done

while [[ -z $MELTING_POINT_CELSIUS ]]; do
  read -p "Melting point (ºC): " MELTING_POINT_CELSIUS
done

while [[ -z $BOILING_POINT_CELSIUS ]]; do
  read -p "Boiling point (ºC): " BOILING_POINT_CELSIUS
done

echo "
Select a type:\n
1) Metal
2) Metalloid
3) Nonmetal 
"
while [[ -z $TYPE_ID  || ! $TYPE_ID =~ ^[1-3]$ ]]; do
  read -p "Type (1,2,3): " TYPE_ID
done

INSERT_ELEMENT="$($PSQL "INSERT INTO elements(atomic_number, symbol, name) VALUES($ATOMIC_NUMBER, '$SYMBOL', '$ELEMENT_NAME')")"

TYPE="$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID")"

INSERT_PROPERTIES="$($PSQL "INSERT INTO properties(atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES($ATOMIC_NUMBER, $ATOMIC_MASS, $MELTING_POINT_CELSIUS, $BOILING_POINT_CELSIUS, $TYPE_ID);")"

if [[ $INSERT_ELEMENT == "INSERT 0 1"  &&  $INSERT_PROPERTIES == "INSERT 0 1" ]]; then
  echo -e "\nSuccessfully inserted into Periodic Table Database the element with atomic number ${ATOMIC_NUMBER}, known as ${ELEMENT_NAME} (${SYMBOL}). It's a ${TYPE}, with a mass of ${ATOMIC_MASS} amu, it has a melting point of ${MELTING_POINT} ºC and a boiling point of ${BOILING_POINT} ºC."
fi