#!/bin/bash 
username="$1"

if [ -z "$username" ];
then
   username=`whoami`
fi

echo "username:"$username

cp -rf .vim /home/$username/ 
cp -f .vimrc /home/$username/ 


chown -R $username:$username /home/$username/.vim 
chown $username:$username /home/$username/.vimrc

echo "done installing cusom vim files"
