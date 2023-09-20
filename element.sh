#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --tuples-only -c"

echo -e "\n\n~~~~ Periodic Table ~~~~\n\n"

if [[ -z $1 ]]
then
    echo -e "\nPlease provide an element as an argument.\n"
    exit
fi

if [[ $1 =~ ^[1-9]+$ ]]
then
    ELEMENT=$($PSQL "SELECT atomic_number,name, symbol,type,atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) WHERE atomic_number=$1")
fi

echo $ELEMENT | while IFS=" | " read atomic_num name symbol type mass mp bp
do
  echo -e "The element with atomic number $atomic_num is $name ($symbol). It's a $type, with a mass of $mass amu. $name has a melting point of $mp celsius and a boiling point of $bp celsius."
done