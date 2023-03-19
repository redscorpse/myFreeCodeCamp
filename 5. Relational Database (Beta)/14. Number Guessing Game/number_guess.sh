#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username: "
read USERNAME

SEARCH_USER="$($PSQL "SELECT player FROM games WHERE player='$USERNAME'")"

if [[ $SEARCH_USER ]]; then
  GAMES_PLAYED="$($PSQL "SELECT COUNT(*) FROM games WHERE player='$USERNAME'")"
  BEST_GAME="$($PSQL "SELECT MIN(tries) FROM games WHERE player='$USERNAME'")"
  echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
else
  echo Welcome, $USERNAME! It looks like this is your first time here.
fi

SECRET_NUMBER=$((1 + RANDOM % 1000))

echo "Guess the secret number between 1 and 1000: "
TRIES=0

while [[ $GUESS_NUMBER != $SECRET_NUMBER ]]; do
  read GUESS_NUMBER
  if [[ -z $GUESS_NUMBER ]]; then
    echo "Enter a number:"
  elif [[ $GUESS_NUMBER  &&  ! $GUESS_NUMBER =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
  else
    ((TRIES++))
    if [[ $GUESS_NUMBER > $SECRET_NUMBER ]]; then
      echo "It's lower than that, guess again:"
    elif [[ $GUESS_NUMBER < $SECRET_NUMBER ]]; then
      echo "It's higher than that, guess again:"
    elif [[ $GUESS_NUMBER == $SECRET_NUMBER ]]; then
      echo You guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!
      REGISTER_GAME="$($PSQL "INSERT INTO games(player, tries) VALUES('$USERNAME', $TRIES)")"
    fi
  fi
done
