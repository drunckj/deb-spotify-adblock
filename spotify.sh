#!/bin/bash
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/spotify.gpg  > /dev/null
echo "deb [signed-by=/usr/share/keyrings/spotify.gpg] http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install spotify-client
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
