#check what machine we on
unameOut="$(uname -s)"
machine="unknown"
case "${unameOut}" in
    Linux*)     
        machine=Linux
        ;;
    Darwin*)  
        machine=Mac
        ;;
esac

#install packages needed
if [ "$machine" = "Mac"  ]; then
    which  brew
    if [[ $? != 0 ]] ; then
        echo "Installing brew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        source $HOME/.bashrc
    fi
    echo "Installing require packages"
    brew install node
    brew install java
    brew install maven
    brew install unzip
    brew install cmake
    brew install clang-build-analyzer
    brew install boost-python3
elif [ "$machine" = "Linux" ]; then
    echo "Installing require packages"
    sudo apt install npm
    sudo apt install unzip
    sudo apt install cmake
    sudo apt install clang
    sudo apt install default-jdk
    sudo apt install maven
    sudo apt install python3.10-venv
fi

#install npm
#which npm
#if [[ $? != 0 ]] ; then
#    echo "Installing npm"
#    #echo "Installing node version manager"
#    #curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
#    #source $HOME/.bashrc
#    #nvm install node
#fi

# copy bashrc
if [ -f ~/.bashrc ]; then
    echo "backing up .bashrc to .bashrc.bk in ${HOME}/ "
    mv $HOME/.bashrc $HOME/.bashrc.bk
fi
echo "copying .bashrc to ${HOME}/"
cp $(pwd)/bash/minimal.bashrc $HOME/.bashrc

# copy vimrc
if [ -f ~/.vimrc ]; then
    echo "backing up .vimrc to .vimrc.bk in ${HOME}/ "
    mv $HOME/.vimrc $HOME/.vimrc.bk
fi
echo "copying .vimrc to ${HOME}/"
cp $(pwd)/vim/minimal.vimrc $HOME/.vimrc

# copy nvim
if [ -d ~/.config/nvim ]; then
    echo "backing up nvim to nvim.bk in ${HOME}/.config "
    rm -rf $HOME/.config/nvim.bk
    mv  $HOME/.config/nvim $HOME/.config/nvim.bk
fi
echo "copying nvim to ${HOME}/.config"
mkdir -p $HOME/.config
cp -r $(pwd)/nvim $HOME/.config

# copy tmux
if [ ! -f ~/.tmux.conf ]; then
    echo "backing up .tmux.conf to .tmux.conf.bk in ${HOME}/ "
    mv ~/.tmux.conf ~/.tmux.conf.bk
fi
echo "copying .tmux.conf to ${HOME}/"
cp $(pwd)/tmux/.tmux.conf ~/

echo "install complete"
