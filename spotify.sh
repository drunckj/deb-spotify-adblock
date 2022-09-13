curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client
git clone https://github.com/abba23/spotify-adblock.git
cd spotify-adblock/

if [ ! -f "$HOME/.cargo/bin/rustup" ]
then
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
fi
make
sudo make install
cp ../spotify-adblock.desktop .local/share/applications/spotify-adblock.desktop
