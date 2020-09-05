export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_BUNDLE_FILE=$HOME/.Brewfile

if [[ -d ~/.linuxbrew ]]
then
    eval $(~/.linuxbrew/bin/brew shellenv)
else    
    test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
