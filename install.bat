set homepath=%userprofile%
set scriptpath=%~dp0 
cp -r scriptpath\.vim homepath\vimfiles 
cp -r scriptpath\.vimrc homepath\_vimrc

echo "done installing custom windows vim files"
