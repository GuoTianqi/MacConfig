#! /usr/bin/env bash

MY_HOME=~
echo $MY_HOME
FILES=".emacs .profile .zshrc"

for file in $FILES
do
    echo "file : $MY_HOME/$file"
    cp -r $MY_HOME/$file ./
    git add $file
done

git add ./*
git commit
git push
