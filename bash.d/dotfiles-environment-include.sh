ENV=$(cat $HOME/.dotfiles/config/environment)
[ -f $HOME/.dotfiles/config/environments/$ENV/bash-env-file ] && . $HOME/.dotfiles/config/environments/$ENV/bash-env-file