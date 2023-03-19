## Script and Git repository

```sh
mkdir number_guessing_game; cd number_guessing_game
touch number_guess.sh; chmod +x number_guess.sh
echo "#!/bin/bash" >> number_guess.sh
git init; git checkout -b main
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

```


- Turn the `number_guessing_game` folder into a git repository
- Your git repository should have at least five commits
- Your script should randomly generate a number that users have to guess
- When you run your script, you should prompt the user for a username with `Enter your username:`, and take a username as input. Your database should allow usernames that are 22 characters
- If that username has been used before, it should print `Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses.`, with `<username>` being a users name from the database, `<games_played>` being the total number of games that user has played, and `<best_game>` being the fewest number of guesses it took that user to win the game
- If the username has not been used before, you should print `Welcome, <username>! It looks like this is your first time here.`
- The next line printed should be `Guess the secret number between 1 and 1000:` and input from the user should be read
- Until they guess the secret number, it should print `It's lower than that, guess again:` if the previous input was higher than the secret number, and `It's higher than that, guess again:` if the previous input was lower than the secret number. Asking for input each time until they input the secret number.
- If anything other than an integer is input as a guess, it should print `That is not an integer, guess again:`
- When the secret number is guessed, your script should print `You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!` and finish running
- The message for the first commit should be `Initial commit`
- The rest of the commit messages should start with `fix:`, `feat:`, `refactor:`, `chore:`, or `test:`
- You should finish your project while on the `main` branch, your working tree should be clean, and you should not have any uncommitted changes