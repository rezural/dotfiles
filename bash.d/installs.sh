DIRS=$(ls ~/.installs)
INSTALLS_DIR=$(dirname ~/.installs)/.installs


for DIR in $DIRS; do
  if [ -d $DIR/bin ]
  then
    export PATH=$PATH:$INSTALLS_DIR/$DIR/bin
  else
    export PATH=$PATH:$INSTALLS_DIR/$DIR
  fi

done
