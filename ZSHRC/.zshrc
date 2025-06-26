# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path vers Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Thème : tu peux remplacer par "agnoster", "robbyrussell", ou "powerlevel10k/powerlevel10k" si installé
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins Oh My Zsh
plugins=(
  git
  fzf
  z
  sudo
  history
)

source $ZSH/oh-my-zsh.sh

# Si fzf est installé depuis GitHub
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Historique amélioré
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Correction automatique des commandes tapées avec faute
setopt CORRECT

# Active les alias avec sudo (ex: sudo ll)
alias sudo='sudo '

# Alias pratiques
alias ls='lsd'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'

# Custom alias
alias update='sudo apt update && sudo apt upgrade'
alias install='sudo apt install'
alias remove='sudo apt remove'
alias c='clear'
alias cat='batcat'
alias szrc='source ~/.zshrc'
alias goszrc='nano ~/.zshrc'

alias docs='cd ~/Documents'
alias projets='cd ~/Documents/projets'
alias techno='mpv --shuffle --loop-playlist ~/Musique/Techno/*.mp3'
alias chill='mpv --shuffle --loop-playlist ~/Musique/Chill/*.mp3'

# Git alias
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'

# Dev alias python
alias pythonenv='python3 -m venv .venv && source .venv/bin/activate'

# Dev alias rust
alias cb='cargo build'
alias cbr='cargo build --release'
alias cr='cargo run'
alias ct='cargo test'
alias cc='cargo check'
alias cl='cargo clippy'
alias cf='cargo fmt'
alias cu='cargo update'
alias cdoc='cargo doc --open'
alias cclean='cargo clean'

# Dev alias nextjs
alias nextnew='npx create-next-app@latest'
alias nextdev='npm run dev'
alias nextbuild='npm run build'

# Prompt multicouleur plus lisible (si pas de powerlevel10k)
autoload -U colors && colors

# Désactiver la correction automatique des commandes
setopt NO_CORRECT

# fzf avec fd (si installé)
export FZF_DEFAULT_COMMAND='find . -type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export PATH=$HOME/.local/bin:$PATH

# Plugins
plugins=(
  git
  zsh-autosuggestions
)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
