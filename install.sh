echo "checking for updates..."
sudo apt -qq update
echo "✔ update done!"

sudo apt -qq zsh git
echo "✔ zsh and git installed"

git pull
echo "✔ dotfiles are up to date"

ln -sf $(pwd)/bashrc ~/.bashrc
echo "✔ zsh as default shell"

# install oh-my-zsh
[ -d ~/.oh-my-zsh/custom}/themes/powerlevel10k ] || git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

[ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions] || git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# synlink oh-my-zsh theme
mkdir -p ~/.oh-my-zsh && mkdir -p ~/.oh-my-zsh/themes
ln -sf $(pwd)/oh-my-zsh/themes/lambda_robbyrussell.zsh-theme ~/.oh-my-zsh/themes/lambda_robbyrussell.zsh-theme
ln -sf $(pwd)/oh-my-zsh/themes/emoji_robbyrussell.zsh-theme ~/.oh-my-zsh/themes/emoji_robbyrussell.zsh-theme
echo "✔ oh my zsh configured!"

ln -sf $(pwd)/zshrc ~/.zshrc
echo "✔ .zshrc symlinked"

ln -sf $(pwd)/gitconfig ~/.gitconfig
echo "✔ .gitconfig symlinked"

ln -sf $(pwd)/vimrc ~/.vimrc
echo "✔ .vimrc symlinked"

cp -f $(pwd)/p10k.zsh ~/.p10k.zsh
echo "✔ .p10k symlinked"

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt -qq install nodejs
sudo apt -qq install npm
sudo apt -qq install python-pip
echo "✔ apt dev tools installed"
