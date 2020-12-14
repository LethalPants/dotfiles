echo "checking for updates..."
echo 'nameserver 8.8.8.8' | sudo tee -a /etc/resolv.conf
sudo apt update && sudo apt-get upgrade
sudo apt update
ln -sf $(pwd)/etc/wsl.conf /etc/wsl.conf

echo "[✔] update done!"

sudo apt-get install zsh git -y
echo "[✔] zsh and git installed"

git pull
echo "[✔] dotfiles are up to date"

chsh -s $(which zsh)
ln -sf $(pwd)/bashrc ~/.bashrc
echo "[✔] zsh as default shell"

# install oh-my-zsh
[ -d ~/.oh-my-zsh ] || git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
echo "[✔] installed ohmyzsh"

[ -d ~/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting
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

[ -d ~ ] || git clone https://github.com/itchyny/lightline.vim ~/.vim/pack/plugins/start/lightline
git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs
ln -sf $(pwd)/vimrc ~/.vimrc
echo "[✔] .vimrc symlinked"


curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
exec zsh
nvm install node --lts
sudo apt install npm -y
sudo apt install yarn -y
sudo apt install python3-pip -y
sudo apt install build-essential
sudo apt install postgresql postgresql-contrib -y
sudo apt install redis-server -y
echo "[✔] apt dev tools installed"
