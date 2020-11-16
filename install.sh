echo "checking for updates..."
sudo apt update
echo "[✔] update done!"

sudo apt-get install zsh git -y
echo "[✔] zsh and git installed"

git pull
echo "[✔] dotfiles are up to date"

ln -sf $(pwd)/bashrc ~/.bashrc
echo "[✔] zsh as default shell"

# install oh-my-zsh
[ -d ~/.oh-my-zsh ] || git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
echo "[✔] installed ohmyzsh"

[ -d ~/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -d ~/.oh-my-zsh/custom/themes/powerlevel10k ] || git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
[ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ] || git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# synlink oh-my-zsh theme
mkdir -p ~/.oh-my-zsh && mkdir -p ~/.oh-my-zsh/themes
echo "[✔] oh my zsh configured!"

ln -sf $(pwd)/zshrc ~/.zshrc
echo "[✔] .zshrc symlinked"

ln -sf $(pwd)/gitconfig ~/.gitconfig
echo "[✔] .gitconfig symlinked"

cp -f $(pwd)/p10k.zsh ~/.p10k.zsh
echo "[✔] .p10k symlinked"

curl -sLf https://spacevim.org/install.sh | sudo -E bash
ln -sf $(pwd)/vimrc ~/.vimrc
echo "[✔] installed SpaceVim and .vimrc symlinked"


curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs
sudo apt install npm -y
sudo apt install python-pip -y
sudo apt install build-essential
echo "[✔] apt dev tools installed"
