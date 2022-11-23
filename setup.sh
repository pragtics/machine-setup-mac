#!/bin/bash

# 1. Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# 2. Install Mac App Store command line interface
brew install mas

# 3. Install basics tools from Brewfile
echo ""
echo "Installing basic tools"
echo ""
curl -fsSL https://raw.githubusercontent.com/pragtics/machine-setup-mac/master/basics.Brewfile | brew bundle --file=/dev/stdin

# 4. Install development tools from Brewfile
read -p "Do you want to install additional development tools? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo ""
    echo "Installing development tools"
    curl -fsSL https://raw.githubusercontent.com/pragtics/machine-setup-mac/master/development.Brewfile | brew bundle --file=/dev/stdin
fi

echo ""
echo ""
    
# 5. Install personal tools from Brewfile
read -p "\nDo you want to install additional personal tools from personal/$USER? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo ""
    echo "Installing personal tools"
    curl -fsSL "https://raw.githubusercontent.com/pragtics/machine-setup-mac/personal/$USER/personal.Brewfile" | brew bundle --file=/dev/stdin
fi
