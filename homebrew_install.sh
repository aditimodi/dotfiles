
## Install homebrew and oh-my-zsh on macos
if [[ $(uname)=='Darwin' ]]
then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
        
        brew update
        brew upgrade
        
        BREW_PREFIX=$(brew --prefix)
        
        brew tap caskroom/cask-cask
        brew tap homebrew/services
        
        brew install curl wget git
        
        ## oh-my-zsh
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

fi
