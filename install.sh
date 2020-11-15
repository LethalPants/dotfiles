# terminal color template {{{
# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

echo "checking for updates..."
sudo apt update
echo "${Green}[✔]${Color_off} update done!"

sudo apt-get install zsh git -y
echo "${Green}[✔]${Color_off} zsh and git installed"

git pull
echo "${Green}[✔]${Color_off} dotfiles are up to date"

ln -sf $(pwd)/bashrc ~/.bashrc
echo "${Green}[✔]${Color_off} zsh as default shell"

# install oh-my-zsh
[ -d ~/.oh-my-zsh ] || git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
echo "${Green}[✔]${Color_off} installed ohmyzsh"

[ -d ~ ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -d ~/.oh-my-zsh/custom/themes/powerlevel10k ] || git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
[ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ] || git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# synlink oh-my-zsh theme
mkdir -p ~/.oh-my-zsh && mkdir -p ~/.oh-my-zsh/themes
echo "${Green}[✔]${Color_off} oh my zsh configured!"

ln -sf $(pwd)/zshrc ~/.zshrc
echo "${Green}[✔]${Color_off} .zshrc symlinked"

ln -sf $(pwd)/gitconfig ~/.gitconfig
echo "${Green}[✔]${Color_off} .gitconfig symlinked"

cp -f $(pwd)/p10k.zsh ~/.p10k.zsh
echo "${Green}[✔]${Color_off} .p10k symlinked"

curl -sLf https://spacevim.org/install.sh | bash
ln -sf $(pwd)/vimrc ~/.SpaceVim/vimrc
echo "${Green}[✔]${Color_off} installed SpaceVim and .vimrc symlinked"


curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs
sudo apt install npm -y
sudo apt install python-pip -y
sudo apt install build-essential
echo "${Green}[✔]${Color_off} apt dev tools installed"
