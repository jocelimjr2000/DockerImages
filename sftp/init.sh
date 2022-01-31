#!/bin/bash

for user_home in /home/* ; do
  if [ -d "$user_home" ]; then

    # Username
    username=`basename $user_home`

    echo "> Setup $user_home/* folder for $username"
    
    publicDir=$user_home/public

    if [ -d "$publicDir" ]; then
      echo "'$publicDir' found"
    else
      # Create public folder
      mkdir $user_home/public

      # Create empty index.html
      touch $user_home/public/index.html
    fi
    
    # Change owner
    chown -R $username:users $user_home/*

    # Create symlink
    ln -s $user_home/public /var/www/html
  fi
done

apachectl start