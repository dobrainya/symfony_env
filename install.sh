#!/usr/bin/env bash
set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo true


sudo apt update
sudo apt -y install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

# install docker
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Настройка docker
sudo usermod -aG docker $USER

# удаляем старую запись из Hosts
sudo sed -i '/#symfony-app-host$/d' /etc/hosts

# записываем новые хосты
sudo bash -c "cat >> /etc/hosts ${SCRIPT_DIR}/install/etc/hosts.txt"


cd "${SCRIPT_DIR}" && sudo -u $USER docker compose -f docker-compose.yml up --no-start

#delete app folder before clone
rm -rf ./app

#git clone git@github.com:dobrainya/symfony5.git app

# install composer
sudo -u $USER docker compose run --rm backend composer install

sudo apt autoremove -y
sudo apt clean

echo 'Done! You need to restart your system'
