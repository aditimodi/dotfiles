
## Install homebrew and oh-my-zsh on macos
## Before installing homebrew, u need to install the CLI tools for Xcode. Run (xcode-select --install) in terminal

if [[ $(uname)=='Darwin' ]]
then    
        if command -v brew >/dev/null 2>&1; then
                echo "Updating Homebrew"
                brew update 
                brew upgrade
        else
                # Run the installer from https://brew.sh
                echo "Homebrew not found: launching the installer"
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
        
                brew update
                brew upgrade
                BREW_PREFIX=$(brew --prefix)
                brew tap caskroom/cask-cask
                brew tap homebrew/services
                brew install curl wget git
        fi 
        
        ## oh-my-zsh
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        zsh --version
        upgrade_oh_my_zsh

fi
