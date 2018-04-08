#!/bin/bash

current_branch=`git rev-parse --abbrev-ref HEAD`
current_commit=`git rev-parse --verify HEAD`
counter=1

while read -u 3 result
do
  printf "\n"
  read -n 1 -s -r -p "Press any key to checkout the next commit" some_response
  printf "\n\n\n $counter. ======================================================================\n"

  git checkout $result | awk -F 'delim'\n\n'{print $1}' 

  printf "=========================================================================="
  counter=$((counter+1))
done 3< <(git log --pretty=oneline | cut -f1 -d" " | tac )

read -n 1 -s -r -p "Press any key to where it all began" some_response
printf "\n"

if [ "$current_branch" == "HEAD" ]; then
  git checkout $current_commit | awk -F 'delim'\n\n'{print $1}'
else
  git checkout $current_branch | awk -F 'delim'\n\n'{print $1}'
fi
