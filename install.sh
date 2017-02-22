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

# copy cscope_gen script to local executables directory
sudo -E cp cscope_gen /usr/local/bin

# make sure the files are owned by the correct person
chown -R $username:$username $HOME/.vim 
chown $username:$username $HOME/.vimrc

echo "done installing cusom vim files"
