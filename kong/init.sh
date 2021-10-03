#!/bin/bash

for user_home in /home/* ; do
  if [ -d "$user_home" ]; then
    username=`basename $user_home`
    echo "> Setup $user_home/* folder for $username"
    chown -R $username:users $user_home/*
  fi
done
