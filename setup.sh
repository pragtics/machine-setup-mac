#!/bin/bash

# 1. Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# 2. Install Mac App Store command line interface
brew install mas

# 3. Install basics tools from Brewfile
echo "Installing basic tools"
curl -fsSL https://raw.githubusercontent.com/pragtics/machine-setup-mac/master/basics.Brewfile | brew bundle --file=/dev/stdin

# 3. Install development tools from Brewfile
read -p "Do you want to install additional development tools? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Installing development tools"
    curl -fsSL https://raw.githubusercontent.com/pragtics/machine-setup-mac/master/development.Brewfile | brew bundle --file=/dev/stdin
fi