#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals)+SUM(opponent_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals),2) FROM games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT ROUND( AVG(winner_goals)+AVG(opponent_goals), 16) FROM games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(winner_goals) FROM games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(winner_goals) FROM games WHERE winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT name FROM teams INNER JOIN games ON teams.team_id=games.winner_id WHERE year=2018 AND round='Final'")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
# SELECT * FROM games FULL JOIN teams ON games.winner_id=teams.team_id FULL JOIN teams ON games.opponent_id=teams.team_id;
## To fix the error "table name specified more than once", you can use table aliases to differentiate between the two instances of the table in the query --
## SELECT g.*, w.name AS winner_name, o.name AS opponent_name FROM games g FULL JOIN teams w ON g.winner_id = w.team_id FULL JOIN teams o ON g.opponent_id = o.team_id;
echo "$($PSQL "SELECT DISTINCT(t.name) FROM games g JOIN teams t ON g.winner_id=t.team_id OR g.opponent_id=t.team_id WHERE g.year=2014 AND round='Eighth-Final' ORDER BY t.name")" 

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT DISTINCT(name) FROM teams t INNER JOIN games g ON g.winner_id=t.team_id ORDER BY name")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT year,name FROM games g INNER JOIN teams t ON g.winner_id=t.team_id WHERE round='Final' ORDER BY year")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT name FROM teams WHERE name LIKE 'Co%'")"
