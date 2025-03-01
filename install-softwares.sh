#!bin/bash
WORKING_DIRECTORY=/home/camille/Documents/installer

mkdir $WORKING_DIRECTORY && cd $WORKING_DIRECTORY
#Install divers softwares
apt install htop curl git tree 

#Install Visual Studio Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/keyrings/microsoft-archive-keyring.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install code # or code-insiders

#Install Nextcloud  
wget https://github.com/nextcloud-releases/desktop/releases/download/v3.15.3/Nextcloud-3.15.3-x86_64.AppImage

#Install AppImageLauncher
wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v3.0.0-alpha-4/appimagelauncher_3.0.0-alpha-4-gha253.36951ec_amd64.deb
sudo dpkg -i appimagelauncher*.deb


#Install Joplin
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

#Install Marktext
wget https://github.com/marktext/marktext/releases/latest/download/marktext-x86_64.AppImage

#Install Spotify
curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client
#Install themes

git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
git clone https://github.com/vinceliuice/Orchis-theme.git
su -
cd $WORKING_DIRECTORY
bash WhiteSur-icon-theme/install.sh
bash Orchis-theme/install.sh -a
