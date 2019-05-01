# |=================================== NVM ===================================|

# Config de NVM
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


#docker
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

# |=================================== Comands ===================================|

# Open .zshrc to be edited in VS Code
alias change="vscodium ~/.zshrc"

# Re-run source command on .zshrc to update current terminal session with new settings
alias update="source ~/.zshrc"

# Visualizacion de la lista de docs
alias l='colorls --group-directories-first --almost-all'
alias ll='colorls --group-directories-first --almost-all --long' # detailed list view

# Use differents node versions
alias node8='nvm use --lts=carbon && nvm alias default 8'
alias node10='nvm use --lts=dubnium && nvm alias default 10'

# Manage mongo
alias mongo-start='sudo service mongod start'
alias mongo-stop='sudo service mongod stop'
alias mongo-restart='sudo service mongod restart'
alias mongo-status='sudo systemctl status mongod'
alias mongo-log='sudo nano /var/log/mongodb/mongod.log'

# Manage mysql
alias mysql-start='sudo service mysql start'
alias mysql-stop='sudo service mysql stop'
alias mysql-restart='sudo service mysql restart'
alias mysql-status='sudo systemctl status mysql.service'

# GIT
alias remote-branches='git branch -a -v'
alias list-stash='git stash list'
alias apply-stash='git stash apply'
alias create-branch='git checkout -b'
alias delete-branch='git branch -d'
alias uncommit='git reset HEAD~'


# |=================================== Plugins ===================================|

fpath=($fpath "/home/leafnoise/.zfunctions")

# Allow the use of the z plugin to easily navigate directories
source /usr/local/etc/profile.d/z.sh

# Set autojump
source /usr/share/autojump/autojump.sh

# Tab completion for colorls
source $(dirname $(gem which colorls))/tab_complete.sh

# sintax highlighting
source /home/leafnoise/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /home/leafnoise/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh >> ${ZDOTDIR:-$HOME}/.zshrc

# Set Spaceship ZSH as a prompt
  autoload -U promptinit; promptinit
  prompt spaceship
