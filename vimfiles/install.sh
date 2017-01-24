#!/bin/bash 
username="$1"

if [ -z "$username" ];
then
   username=`whoami`
fi

echo "\$HOME:$HOME"
echo "\$username:$username"

cp -rf .vim $HOME/ 
cp -f .vimrc $HOME/ 


chown -R $username:$username $HOME/.vim 
chown $username:$username $HOME/.vimrc

echo "done installing cusom vim files"
