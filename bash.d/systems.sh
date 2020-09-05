SYSTEM_ARCH=$(uname)
SYSTEM_SCRIPT_DIR=$HOME/.bash.d/systems/$SYSTEM_ARCH

if [ -d $SYSTEM_SCRIPT_DIR ]; then
  for system_script in $(ls $SYSTEM_SCRIPT_DIR/*.sh); do
    [ -f $system_script ] && source $system_script
  done
fi