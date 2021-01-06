
## install packages using conda

function install {
  command -v $1 &> /dev/null

  if [ $? -ne 0 ]; then             # $? is a special variable contains the exit status of previous command
    echo "Installing: ${1}..."
    pip install $1
  else
    echo "Already installed: ${1}"
  fi
}

palettable
