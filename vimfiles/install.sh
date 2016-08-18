#!/bin/bash 

cp -rf .vim ~/ 
cp -f .vimrc ~/ 

username=`whoami`

chown -R $username:$username ~/.vim 
chown $username:$username ~/.vimrc

echo "done installing cusom vim files"
