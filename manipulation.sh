#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --tuples-only -c"

TYPES=$($PSQL "SELECT type FROM properties")
echo $TYPES