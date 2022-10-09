#!/bin/sh

# move current file to home
cd ~/
echo "Current HOME location: "
pwd

# install zsh
echo "-------------- Installing ZSH"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# # install brew
echo "-------------- Installing BREW"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# clone dotfiles and move into the project
git clone git@github.com:MartinMolinero/dotfiles.git

# move dotfiles
mv dotfiles/gitconfig.local .gitconfig
mv dotfiles/zshrc.local .zshrc
git stash

# return to home
echo "Return to HOME, location: "
cd ~/
pwd

# install autojump
echo "-------------- Installing Autojump"
brew install autojump

# install vscode & verify that works
echo "-------------- Installing vscode"
brew install --cask visual-studio-code
code .

# install python
echo "-------------- Installing python"
brew install pyenv
PYENV_ROOT=$HOME/.pyenv
pyenv install 2.7.18
pyenv install 3.10.4
pyenv global 2.7.18

install nvm
echo "-------------- Installing nvm"
sh -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh)"
export NVM_DIR=$HOME/.nvm;
source $NVM_DIR/nvm.sh;

# install node
echo "-------------- Installing node 18"
nvm install 18.10.0

# check node installed versions
echo "-------------- Node versions"
nvm list

install java
echo "-------------- Installing java"
brew tap homebrew/cask-versions
brew update
brew tap homebrew/cask
brew tap adoptopenjdk/openjdk
brew install adoptopenjdk11 --cask


