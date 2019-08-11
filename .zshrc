# |=================================== NVM ===================================|

# Config de NVM
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Set up Node Version Manager and Yarn
source /usr/share/nvm/init-nvm.sh
export PATH=$PATH:~/.yarn/bin

# Automatically switch node versions when a directory has a `.nvmrc` file
autoload -U add-zsh-hook

# Zsh hook function
load-nvmrc() {
    local node_version="$(nvm version)" # Current node version
    local nvmrc_path="$(nvm_find_nvmrc)" # Path to the .nvmrc file
    # Check if there exists a .nvmrc file
    if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    # Check if the node version in .nvmrc is installed on the computer
    if [ "$nvmrc_node_version" = "N/A" ]; then
        # Install the node version in .nvmrc on the computer and switch to that node version
        nvm install
    # Check if the current node version matches the version in .nvmrc
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
        # Switch node versions
        nvm use
    fi
    # If there isn't an .nvmrc make sure to set the current node version to the default node version
    elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
    fi
}
# Add the above function when the present working directory (pwd) changes
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Path for ruby gems
export PATH="/home/oscar/.gem/ruby/2.6.0/bin:$PATH"

# Spaceship customizations
SPACESHIP_TIME_SHOW="true"

# |=================================== Comands ===================================|

# Open .zshrc to be edited in VS Code
alias change="code ~/.zshrc"

# Re-run source command on .zshrc to update current terminal session with new settings
alias update="source ~/.zshrc"

# Visualizacion de la lista de docs
alias l='colorls --group-directories-first --almost-all'
alias ll='colorls --group-directories-first --almost-all --long' # detailed list view

# Use differents node versions
alias node8='nvm alias default 8'
alias node10='nvm alias default 10'

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
alias mysql-status='sudo systemctl status mysql'


# Enable and Disable internal keyboard arch
alias enable-keyboard="xinput enable 'AT Translated Set 2 keyboard'"
alias disable-keyboard="xinput disable 'AT Translated Set 2 keyboard'"

# |=================================== Plugins ===================================|

fpath=($fpath "/home/oscar/.zfunctions")

# Set autojump
source /usr/share/autojump/autojump.zsh

# Tab completion for colorls
source $(dirname $(gem which colorls))/tab_complete.sh

# sintax highlighting
source /home/oscar/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# echo "source /home/oscar/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# Set Spaceship ZSH as a prompt
  autoload -U promptinit; promptinit
  prompt spaceship
fpath=($fpath "/home/oscar/.zfunctions")
