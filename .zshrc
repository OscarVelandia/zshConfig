# |=================================== Configs ===================================|

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Change Node version when .nvmrc file is present
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Deno
export DENO_INSTALL="/home/oscar/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"


# Docker
docker-ssh() {
    if (( $# == 0 ))
    then
        echo "USAGE: docker_ssh <container name | container id>"
        return
    fi
    name=$1
    echo "Connecting to $name"
    docker exec -i -t $name /bin/bash
} 


# Android - React native
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Ruby
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

# |=================================== Comands ===================================|

# System comands
alias system-update="sudo pacman -Syyu -yy"

# Open .zshrc to be edited in VS Code
alias change="code ~/.zshrc"

# Re-run source command on .zshrc to update current terminal session with new settings
alias update="source ~/.zshrc"

# Node
alias list-global-modules="npm list -g --depth=0"

# Docker
alias docker-start='systemctl start docker'
alias docker-status='systemctl status docker'

# init KVM service
alias init-kvm='sudo systemctl start libvirtd.service'


# GIT
alias remote-branches='git branch -a -v'
alias list-stash='git stash list'
alias apply-stash='git stash apply'
alias create-branch='git checkout -b'
alias delete-branch='git branch -d'
alias uncommit='git reset HEAD~'
alias list-last-commit='git log --name-status HEAD^..HEAD'
alias git-graph='git log --all --decorate --graph --oneline'
# con este comando se muestran las diferencias de 2 branch, sin seguir la carpeta node_modules
# git diff master origin/master . ':!node_modules' | grep diff
