
sudo apt-get update && sudo apt-get upgrade -y

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

## Essentials
install build-essential;
install wget
install curl
install tmux
install tree
install git
install shellcheck;
install vim

## SSH
install openssh-server;
sudo systemctl status ssh;
sudo ufw allow ssh;
sudo systemctl enable ssh,
