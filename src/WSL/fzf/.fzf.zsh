# Setup fzf
# ---------
if [[ ! "$PATH" == */home/hpiplodwala/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/hpiplodwala/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/hpiplodwala/.fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/home/hpiplodwala/.fzf/shell/key-bindings.zsh"

# Git keybindings
# ------------
source "/home/hpiplodwala/.fzf/shell/fzf-git.sh"
export FZF_DEFAULT_OPTS='--color=bg+:#293739,bg:#1B1D1E,border:#808080,spinner:#E6DB74,hl:#7E8E91,fg:#F8F8F2,header:#7E8E91,info:#A6E22E,pointer:#A6E22E,marker:#F92672,fg+:#F8F8F2,prompt:#F92672,hl+:#F92672 --bind=ctrl-k:up --bind=ctrl-j:down'
export FZF_CTRL_T_COMMAND="rg --files --hidden --follow"
export FZF_CTRL_T_OPTS='--preview "batcat --style=numbers --color=always --line-range :500 {}"'

