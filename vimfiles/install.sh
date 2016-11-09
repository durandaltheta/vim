#!/bin/bash 

username=`whoami`

cp -rf .vim /home/$username/ 
cp -f .vimrc /home/$username/ 


chown -R $username:$username /home/$username/.vim 
chown $username:$username /home/$username/.vimrc

echo "done installing cusom vim files"
