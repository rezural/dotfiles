# general settings for bash etc.
export HISTSIZE=100000
export SAVEHIST0=100000
# these are readline modifications to tweak the tab completion
bind 'set completion-ignore-case on'
# bind 'set completion-prefix-display-length 2'
# bind 'set completion-map-case on'

#FIXME this should be run at install
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:swap_lalt_lctl']"
dconf write /org/gnome/mutter/workspaces-only-on-primary false


export CLICOLOR=1

copy_public_key() {
  cat ~/.ssh/id_rsa.pub | terminal_copy
}

random_string() {
  length=$@
  [[ -z  $length ]]  && length=24
  echo $(dd if=/dev/urandom bs=256 count=1 2> /dev/null | env LC_ALL=C tr -dc 'a-zA-Z0-9' | head -c $length)
}
