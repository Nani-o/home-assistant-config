#!/bin/bash

cd $1
git init
git remote add origin $2
git fetch --all
git reset --hard origin/master
