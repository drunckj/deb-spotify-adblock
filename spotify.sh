#!/bin/bash
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/repository-spotify-com-keyring.gpg >/dev/null
echo deb [signed-by=/usr/share/keyrings/repository-spotify-com-keyring.gpg] http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install 
git clone https://github.com/abba23/spotify-adblock.git
cd spotify-adblock/spotify-client
if [ ! -f "$HOME/.cargo/bin/rustup" ]
then
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
fi
make
sudo make install
cp ../spotify-adblock.desktop $HOME/.local/share/applications/spotify-adblock.desktop
