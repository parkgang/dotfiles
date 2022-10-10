# Anaconda 환경 변수
export PATH="/opt/anaconda3/bin:$PATH"
# nvm 환경변수
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

plugins=(
  git
  yarn
  node
  brew
  docker
  zsh-syntax-highlighting
  zsh-autosuggestions
)

alias ls="lsd --no-symlink"
alias ll="lsd -l --no-symlink"
alias lt="lsd --tree --no-symlink"
alias cat="bat"
