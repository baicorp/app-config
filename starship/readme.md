# STARSHIP

## Install

### linux
curl -sS https://starship.rs/install.sh | sh

### windows
winget install --id Starship.Starship

## Post install

### linux
1. add this `eval "$(starship init bash)"` line to ~/.bashrc file
3. create starship.toml file inside ~/.config/ dir
2. (optional) add this `eval "$(starship init bash)"` line to /root/.bashrc file (if you want to enable in root).
4. (optional) add symlink for starship.toml file for enable starship in root `ln -s /home/bai/.config/starship.toml /root/.config/starship.toml`
