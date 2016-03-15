#! /usr/bin/env bash

MY_HOME=~
echo $MY_HOME
FILES="$MY_HOME/.emacs $MY_HOME/.profile $MY_HOME/.zshrc"

for file in $FILES
do
    echo "file : $file"
    cp -r $file ./
done

git add *
git commit
git push
