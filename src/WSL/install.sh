GREEN="\033[0;32m"
DEFAULT="\033[0m"
printf "${GREEN}Updating nameserver...${DEFAULT}\n"
echo "nameserver 8.8.8.8" | sudo tee -a /etc/resolv.conf

sudo apt --yes update &&  sudo apt --yes upgrade

printf "${GREEN}Installing Git in Ubuntu...${DEFAULT}\n"
sudo apt install --yes --no-install-recommends git

printf "${GREEN}Installing ZSH in Ubuntu...${DEFAULT}\n"
sudo apt install --yes --no-install-recommends zsh

printf "${GREEN}Installing Curl in Ubuntu...${DEFAULT}\n"
sudo apt install --yes --no-install-recommends curl

printf "${GREEN}Installing Neofetch in Ubuntu...${DEFAULT}\n"
sudo apt install --yes --no-install-recommends neofetch

printf "${GREEN}Installing Vim in Ubuntu...${DEFAULT}\n"
sudo apt install --yes --no-install-recommends vim

printf "${GREEN}Installing g++ in Ubuntu...${DEFAULT}\n"
sudo apt install --yes --no-install-recommends g++

printf "${GREEN}Installing gcc in Ubuntu...${DEFAULT}\n"
sudo apt install --yes --no-install-recommends gcc

printf "${GREEN}Installing Visual Studio Code extensions in WSL...${DEFAULT}\n"

code --install-extension "ms-azuretools.vscode-docker";
code --install-extension "eamodio.gitlens";
code --install-extension "mhutchie.git-graph";
code --install-extension "dbaeumer.vscode-eslint";
code --install-extension "esbenp.prettier-vscode";
code --install-extension "VisualStudioExptTeam.vscodeintellicode";
code --install-extension "davidanson.vscode-markdownlint";
code --install-extension "christian-kohler.path-intellisense";
code --install-extension "christian-kohler.npm-intellisense";
code --install-extension "streetsidesoftware.code-spell-checker";
code --install-extension "Gruntfuggly.todo-tree";

printf "${GREEN}Installed extensions successfully.${DEFAULT}\n"

printf "${GREEN}Installing Volta in WSL...${DEFAULT}\n"
curl https://get.volta.sh | bash

printf "${GREEN}Installed Volta successfully"

printf "${GREEN}Installing Node.js LTS in WSL...${DEFAULT}\n"
~/.volta/bin/volta install node

printf "${GREEN}Installing NPM in WSL...${DEFAULT}\n"
~/.volta/bin/volta install npm

printf "${GREEN}Installing Yarn in WSL...${DEFAULT}\n"
~/.volta/bin/volta install yarn

printf "${GREEN}Installing TypeScript in WSL...${DEFAULT}\n"
~/.volta/bin/volta install typescript

printf "${GREEN}Installing Yarn-Upgrade-All in WSL...${DEFAULT}\n"
~/.volta/bin/volta install yarn-upgrade-all

printf "${GREEN}Installing GoLang in WSL...${DEFAULT}\n"
sudo apt install --yes --no-install-recommends golang-go

printf "${GREEN}Installing OhMyZSH in WSL...${DEFAULT}\n"
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh


printf "${GREEN}Installing Zsh-SyntaxHighlighting in WSL...${DEFAULT}\n"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

printf "${GREEN}Installing Zsh-Autosuggestions in WSL...${DEFAULT}\n"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

curl -sS https://starship.rs/install.sh | sh
chsh -s $(which zsh)
