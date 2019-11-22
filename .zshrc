# |=================================== NVM ===================================|

# Config de NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

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
alias change="code ~/.zshrc"

# Re-run source command on .zshrc to update current terminal session with new settings
alias update="source ~/.zshrc"

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
alias list-last-commit='git log --name-status HEAD^..HEAD'
alias git-graph='git log --all --decorate --graph --oneline'
# con este comando se muestran las diferencias de 2 branch, sin seguir la carpeta node_modules
# git diff master origin/master . ':!node_modules' | grep diff



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /home/leafnoise/.zsh/BlaCk-Void.zshrc
