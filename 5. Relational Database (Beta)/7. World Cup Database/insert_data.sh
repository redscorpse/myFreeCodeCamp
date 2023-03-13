#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.



# Remove all data from tables
echo $($PSQL "TRUNCATE teams, games;")

### Insert data into teams table ###
# Read data
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # the winner and opponent columns have team names
  # Register winner teams
  if [[ $WINNER != winner ]]
  then
    # get team_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    # if not found
    if [[ -z $TEAM_ID ]]
    then
      # insert team
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER
      fi
    fi
  fi

  # Register opponent teams (if they aren't added yet)
  if [[ $OPPONENT != opponent ]]
  then
    # get team_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    # if not found
    if [[ -z $TEAM_ID ]]
    then
      # insert team
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $OPPONENT
      fi
    fi
  fi
done


### Insert data into games table ###
# Read data
ROW=0
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Get IDs from teams table
  if [[ $WINNER != winner ]]
  then
    # get team_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  fi

  if [[ $OPPONENT != opponent ]]
  then
    # get team_id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # Insert data, but not first row (nested "if")
    INSERT_INTO_GAMES_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);")
    if [[ $INSERT_INTO_GAMES_RESULT == "INSERT 0 1" ]]
    then
      ((ROW++))
      echo Inserted into games $ROW rows
    fi
  fi

done