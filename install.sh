#!/usr/bin/env bash

# Install zsh if not installed.
if [ ! -f /usr/bin/zsh ]; then
  echo "Updating system..."
  sudo apt-get -y update
  echo "Installing zsh..."
  sudo apt-get -y install zsh

  # Install git-core and oh-my-zsh if not installed.
  if [ ! -f /usr/bin/git ]; then
    echo "Installing git-core..."
    sudo apt-get -y install git-core
  fi

  echo "Installing oh-my-zsh..."
  sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

  # Change shell to zsh
  echo "Changing shell to zsh"
  sudo chsh -s $(which zsh) $(whoami)

  # Change Theme
  echo "Changing theme"
  sed "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"agnoster\"/g" ~/.zshrc > ~/temp
  mv -f ~/temp ~/.zshrc
  sed "s/\$USER@%m/\$USER/g" ~/.oh-my-zsh/themes/agnoster.zsh-theme > ~/temp
  mv -f ~/temp ~/.oh-my-zsh/themes/agnoster.zsh-theme
fi
