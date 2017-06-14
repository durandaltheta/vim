#!/bin/bash 
username="$1"

if [ -z "$username" ];
then
   username=`whoami`
fi

echo "\$HOME:$HOME"
echo "\$username:$username"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp -rf .vim $HOME/ 
cp -f .vimrc $HOME/ 

# copy cscope_gen script to local executables directory
sudo -E cp $SCRIPT_DIR/cscope_gen /usr/local/bin 
sudo chmod +x /usr/local/bin/cscope_gen
#sudo chown $username:$username /usr/local/bin/cscope_gen

# compile and install cscope 
#CUR_DIR=`pwd`
#sudo chown -R $username:$username $SCRIPT_DIR/cscope-15.8b
#cd $SCRIPT_DIR/cscope-15.8b 
##touch aclocal.m4
##touch Makefile.am
##touch configure.ac 
#aclocal 
#automake  --add-missing
#autoconf
##sudo ln -s /usr/bin/automake-1.15 /usr/bin/automake-1.14
##sudo ln -s /usr/bin/aclocal-1.15 /usr/bin/aclocal-1.14
#chmod +x ./configure
#chmod +x ./install-sh
#pwd
#sudo ./configure
#make 
#sudo make install
#cd $CUR_DIR


# make sure the files are owned by the correct person
chown -R $username:$username $HOME/.vim 
chown $username:$username $HOME/.vimrc

echo "done installing custom vim files"
