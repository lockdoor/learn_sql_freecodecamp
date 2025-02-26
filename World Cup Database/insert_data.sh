#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# for test drop database
# psql --username=postgres --dbname=postgres -t --no-align -c "DROP DATABASE worldcup"

# Test database worldcup exist
$PSQL ""
if [[ $? -ne 0 ]] 2>/dev/null
then
  # Create database
  psql --username=postgres --dbname=postgres -t --no-align -c "CREATE DATABASE worldcup"
  if [[ $? -ne 0 ]]
  then
    echo "Can not create database"
    exit 1
  fi

  # Create table
  $PSQL "CREATE TABLE teams(\
  team_id SERIAL PRIMARY KEY, \
  name VARCHAR(30) UNIQUE NOT NULL)"
  if [[ $? -ne 0 ]]
  then
    echo "Can not create table teams"
    exit 1
  fi

  $PSQL "CREATE TABLE games(\
  game_id SERIAL PRIMARY KEY, \
  year INT NOT NULL, \
  round VARCHAR(30) NOT NULL, \
  winner_id INT NOT NULL, \
  opponent_id INT NOT NULL, \
  winner_goals INT NOT NULL, \
  opponent_goals INT NOT NULL)" 
  if [[ $? -ne 0 ]]
  then
    echo "Can not create table games"
    exit 1
  fi

  $PSQL "ALTER TABLE games ADD FOREIGN KEY(winner_id) REFERENCES teams(team_id)"
  $PSQL "ALTER TABLE games ADD FOREIGN KEY(opponent_id) REFERENCES teams(team_id)"
fi

# TRUNCATE table
$PSQL "TRUNCATE TABLE games, teams"

FIND_TEAM_ID(){
  TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$1'")"
  if [[ -z $TEAM_ID ]]
  then
    TEAM_ID=$($PSQL "INSERT INTO teams(name) VALUES('$1')")
    TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$1'")"
  fi
  echo $TEAM_ID
}

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    WINNER_ID=$(FIND_TEAM_ID "$WINNER")
    OPPONENT_ID=$(FIND_TEAM_ID "$OPPONENT")
    $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) \
    VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')"
  fi
done
