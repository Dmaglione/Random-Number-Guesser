#!/bin/bash
GAME(){
  #game function generate number "Guess the secret number between 1 and 1000:"
  GUESSCOUNT=0
  MYSTERY=$((RANDOM % 1000 + 1))
  #echo "CHEAT FOR TESTING: $MYSTERY"
  #echo statement used for bug testing
  echo "Guess the secret number between 1 and 1000:"
  read GUESS
  CHECK $GUESS

}
CHECK(){
  #start function with incrementating game count

  if [[ ! $1 =~ ^[0-9]+$ ]]
  #checking that given argument is valid input, re-run guess and check function if not
  then
  echo "That is not an integer, guess again:"
  read GUESS
  CHECK $GUESS
  else
  #given valid number compare against mystery number, if incorrect re-run the guess and check function while incrementing the guess count integer
  if [[ $1 = $MYSTERY ]]
    then
      echo "You guessed it in $GUESSCOUNT tries. The secret number was $MYSTERY. Nice job!"
      WIN $GUESSCOUNT
      exit 
    elif [[ $1 -gt $MYSTERY ]]
     then
      echo "It's lower than that, guess again:"
      GUESSCOUNT=$((GUESSCOUNT + 1)) 
      read GUESS
      CHECK $GUESS
    else 
    echo "It's higher than that, guess again:"
      GUESSCOUNT=$((GUESSCOUNT + 1)) 
      read GUESS
      CHECK $GUESS
  fi
fi
}
#Function used to announce win and update databases with relevant info.
WIN(){
 
  GAME_COUNT=$($PSQL "SELECT games_played from users WHERE name='$NAME'")
  GAME_COUNT=$((GAME_COUNT+1))
  GAME_COUNT_UPDATE=$($PSQL "UPDATE users SET games_played=$GAME_COUNT WHERE name='$NAME'")
  BEST_GUESS=$($APSQL "SELECT best_game FROM users WHERE name='$NAME'")
  #series of queries to update total played game count and check the best score of the player
  #if the passed number of guesscount is less than the best guess record, the new record is updated in the database
  if [[ $1 -lt  $BEST_GUESS ]]
    then
    NEW_RECORD=$($PSQL "UPDATE users SET best_game=$1 WHERE name='$NAME'")
  fi
}
APSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
PSQL="psql --username=freecodecamp --dbname=number_guess -t -c"

#Seperate PSQL queries for aligned and non-aligned
#ask for username, if they exist in the database, retrieve their info and greet, otherwise run generic greeting. 
echo "Enter your username:"
read NAME
WELCOME=$($PSQL "SELECT name, games_played, best_game from users WHERE name='$NAME'")
if [[ -z $WELCOME ]]
  then
  #if doesnt exist in database add to database "Welcome, <username>! It looks like this is your first time here." and run game function
  echo -e "Welcome, $NAME! It looks like this is your first time here."
  INSERT_NEW_USER=$($PSQL "INSERT INTO users(name, games_played, best_game) VALUES('$NAME', 0, 999)")
  GAME
  else
  #else lookup using name X and Y and "Welcome back NAME! You have played X games, and your best game took Y guesses." then run game function
  echo -e "$WELCOME" | while read NEW_NAME BAR GAMES_PLAYED BAR BEST_GAME 
 do
    echo -e "Welcome back, $NEW_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
  #Function to initiate the game after introductions
  GAME

fi



#start function with incrementating game count
#check is integer
#if win :You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!""
#if guess is above "It's lower than that, guess again:"
#if below It's higher than that, guess again:
#outside loop add 1 to game count and if guesses > best_game update database
