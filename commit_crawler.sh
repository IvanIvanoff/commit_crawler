#!/bin/bash

current_commit=git rev-parse --verify HEAD

while read -u 3 result
do
  printf "\n"
  read -n 1 -s -r -p "Press any key to checkout the next commit" some_response
  git checkout $result

  printf "\n"

done 3< <(git log --pretty=oneline | cut -f1 -d" " | tac )
