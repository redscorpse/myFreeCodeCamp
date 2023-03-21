## Script and Git repository

```sh
mkdir number_guessing_game; cd number_guessing_game
touch number_guess.sh; chmod +x number_guess.sh
git init; git checkout -b main
git add . ; git commit -m "Initial commit"
```

## Create the database

```sh
psql -U freecodecamp postgres
```

```psql
CREATE DATABASE number_guess;
\c number_guess

CREATE TABLE games(game_id SERIAL PRIMARY KEY, player VARCHAR(22) NOT NULL, tries INT NOT NULL);
```

My git commits:
```git
db9a60d (HEAD -> main) fix: don't print the answer
981ed2d feat: complete project
b8431fd feat: program asks until number is guessed
0caed79 fix: random number between 1 and 1000
5242a1d feat: asks for username and search in db
f7de8ca feat: generate random number
9f5ea91 Initial commit
```