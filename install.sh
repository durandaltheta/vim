#!/bin/bash 

echo "\$HOME:$HOME"
echo "\$username:$username"

sudo apt update

# install gui
sudo apt install lxde lxsession openbox lxsession-logout

# install utils
sudo apt install vim make cmake gcc git gawk wget build-essential guake cpio curl autoconf automake flex

# setup guake to autostart
sudo cp /usr/share/applications/guake.desktop /etc/xdg/autostart/ 

# install vim settings 
./install_vim.sh

# Don't uncomment, helpful reference for setting up shared folders
#mkdir $HOME/s
#mkdir $HOME/c_dir
#sudo echo -e "#!/bin/bash\nmount -t vboxsf Documents ~/s > /usr/local/bin/setup_share
#sudo echo -e "mount -t vboxsf C_DIR ~/c_dir" >> /usr/local/bin/setup_share

