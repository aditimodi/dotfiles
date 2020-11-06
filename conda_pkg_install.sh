
## install packages using conda
conda update conda

function install {
  command -v $1 &> /dev/null

  if [ $? -ne 0 ]; then             # $? is a special variable contains the exit status of previous command
    echo "Installing: ${1}..."
    conda install -c conda-forge $1
  else
    echo "Already installed: ${1}"
  fi
}

install tmux
install jupyter_contrib_nbextensions

