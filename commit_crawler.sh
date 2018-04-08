#!/bin/bash

while read -u 3 result
do
  printf "\n"
  read -n 1 -s -r -p "Press any key to checkout the next commit" some_response
  printf "\n"

  git checkout $result | awk -F 'delim'\n\n'{print $1}' 

  printf "\n"

done 3< <(git log --pretty=oneline | cut -f1 -d" " | tac )

read -n 1 -s -r -p "Press any key to checkout master" some_response
printf "\n"

git checkout master | awk -F 'delim'\n\n'{print $1}'
