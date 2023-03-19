#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# wether are arguments
if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
else
  # repeat for each argument
  for input in "$@"; do
    # search element in db
    if [[ $input =~ [0-9]+ ]]; then
      ELEMENT="$($PSQL "SELECT * FROM elements WHERE atomic_number=$input")"
    else
      ELEMENT="$($PSQL "SELECT * FROM elements WHERE symbol='$input' OR name='$input'")"
    fi
    # if not found
    if [[ -z $ELEMENT ]]; then
      echo "I could not find that element in the database."
    else
      while IFS="|" read ATOMIC_NUMBER SYMBOL ELEMENT_NAME
      do
        
        PROPERTIES="$($PSQL "SELECT * FROM properties WHERE atomic_number=$ATOMIC_NUMBER")"
        while IFS='|' read ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE_ID
        do

          TYPE="$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID")"

          echo "The element with atomic number ${ATOMIC_NUMBER} is ${ELEMENT_NAME} (${SYMBOL}). It's a ${TYPE}, with a mass of ${ATOMIC_MASS} amu. ${ELEMENT_NAME} has a melting point of ${MELTING_POINT} celsius and a boiling point of ${BOILING_POINT} celsius."

        done <<< "$PROPERTIES"
      done <<< "$ELEMENT"
    fi
  done
fi