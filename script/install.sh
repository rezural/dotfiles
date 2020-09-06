#!/usr/bin/bash
sudo apt install -y git curl

[ -d ~/.dotfiles ] || git clone https://github.com/rezural/dotfiles.git ~/.dotfiles

DOTFILES_ROOT=~/.dotfiles
DOTFILES_CONFIG=$DOTFILES_ROOT/config
DOTFILES_ENVIRONMENTS=$(ls $DOTFILES_CONFIG/environments/)
DOTFILES_SCRIPT_DIR=$DOTFILES_CONFIG/scripts/installers/

git -C $DOTFILES_ROOT pull
echo "Available setup environments:"
echo ""

for DOTFILES_ENVIRONMENT in $DOTFILES_ENVIRONMENTS
do
    echo $DOTFILES_ENVIRONMENT
done

echo ""
echo "Use Environment:"

read -r DOTFILES_USE_ENVIRONMENT

echo $DOTFILES_USE_ENVIRONMENT > ~/.dotfiles/config/environment

DOTFILES_CURRENT_ENV=$(cat $DOTFILES_CONFIG/environment)
DOTFILES_CURRENT_ENV_DIR=$DOTFILES_CONFIG/environments/$DOTFILES_CURRENT_ENV

for $INSTALLER in $(ls $DOTFILES_SCRIPT_DIR)
do
    echo $INSTALLER
done

[ -f $DOTFILES_CURRENT_ENV_DIR/apt-installs ] && sudo apt install -y $(cat $DOTFILES_CURRENT_ENV_DIR/apt-installs)

[ -f $DOTFILES_CURRENT_ENV_DIR/snap-installs ] && . $DOTFILES_CURRENT_ENV_DIR/snap-installs

CI=1 HOMEBREW_PREFIX_DEFAULT=~/.linuxbrew /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/rezural/install/dont-overwrite-homebrew-prefix-default/install.sh)"

. ~/.dotfiles/bash.d/homebrew.sh

brew install rcm

rcup -f

[ -f $DOTFILES_CURRENT_ENV_DIR/.Brewfile ]  && cp $DOTFILES_CURRENT_ENV_DIR/.Brewfile ~

mkdir ~/.installs
brew tap nhemsley/homebrew-env
brew install homebrew-env

brew bundle

. ~/.dotfiles/bash.d/ihomebrew-env.sh
