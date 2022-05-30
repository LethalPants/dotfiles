################################################################################
#                                  ZSH Aliases                                 #
################################################################################

## Edit Zsh configuration
alias edt="vim $HOME/.zshrc $HOME/.oh-my-zsh/custom/functions/custom-actions.sh"

## Refresh Zsh configuration
alias src="source $HOME/.zshrc"

################################################################################
#                              Directories Aliases                             #
################################################################################

## Alias for explorer.exe
alias explorer="explorer.exe"
alias exp="explorer.exe"
## Create folder and navigate to it
mkcd() {
  mkdir -p -v "$1"
  cd "$1"
}
alias a="code ."

################################################################################
#                          System Maintenance Aliases                          #
################################################################################

## Update system
updsys() {
  sudo apt --yes update;
  sudo apt --yes upgrade;
}
alias drop_cache="sudo sh -c \"echo 3 >"/proc/sys/vm/drop_caches" && swapoff -a && swapon -a && printf "\n%s\n" "Ram-cache and Swap Cleared"\"" 
################################################################################
#                         Environment Variables Aliases                        #
################################################################################

## List the content of PATH environment variables
alias pathl="echo '$PATH' | tr ':' '\n' | nl"

################################################################################
#                                  Git Aliases                                 #
################################################################################

## Git clone, load submodules and navigate to the repository folder
gsc() {
  git clone "$1";
  cd "$(basename "$1" .git)";
  git submodule init;
  git submodule update;
}

## Git soft reset last commit
alias gsrlc="git reset --soft HEAD^1"

## Git hard reset last commit
alias ghrlc="git reset --hard HEAD~1"

alias ga="git add"
alias gaa="git add ."
alias gaaa="git add -A"
alias gc="git commit"
alias gcm="git commit -m"
alias gcb="git checkout -b"
alias gd="git diff"
alias gi="git init"
alias gl="git log"
alias gp="git pull"
alias gpsh="git push"
alias gss="git status -s"
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"

################################################################################
#                                  Vim Aliases                                 #
################################################################################

## Edit init.vim file
alias editvim="vim $HOME/.vimrc"

## Refresh Vim configuration
alias sourcevim="source $HOME/.vimrc"

################################################################################
#                                Docker Aliases                                #
################################################################################

## Download Docker image
alias dpl="docker pull"

## List the Docker containers working
alias dlc="docker container ls"

## List all the Docker containers
alias dlca="docker container ls -a"

## List all the Docker images
alias dli="docker images"

## Stop Docker container
alias dsc="docker container stop"

## Delete Docker container
alias drc="docker container rm"

## Delete Docker image
alias dri="docker image rm"

################################################################################
#                                  NPM Aliases                                 #
################################################################################

## List global NPM packages
alias ngl="npm list -g"

## List outdated global NPM packages
alias ngo="npm outdated -g"

## Update global NPM package
alias ngu="sudo npm update -g"

################################################################################
#                                 Yarn Aliases                                 #
################################################################################

## Install Yarn package
alias yi="yarn add"

## Install Yarn package as dev dependency
yid() {
  yarn add "$1" -D
}

## List all Yarn packages locally installed
alias yl="yarn list"

## List outdated Yarn packages locally installed
alias ylo="yarn outdated"

## Update Yarn package
alias yu="yarn upgrade"

## Upgrade all Yarn packages
alias yua="yarn-upgrade-all"

## Remove Yarn package
alias yr="yarn remove"

################################################################################
#                                  Go Aliases                                  #
################################################################################

## Initialize Go modules
alias gmi="go mod init"
