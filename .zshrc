# |=================================== NVM ===================================|

# Config de NVM
export NVM_DIR=~/.nvm
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

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

# |=================================== Comands ===================================|

# Open .zshrc to be edited in VS Code
alias change="vscodium ~/.zshrc"

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
alias mongo-log='sudo nano /var/log/mongodb/mongod.log '



# |=================================== Plugins ===================================|

fpath=($fpath "/home/leafnoise/.zfunctions")

# Allow the use of the z plugin to easily navigate directories
source /usr/local/etc/profile.d/z.sh

# Set autojump
source /usr/share/autojump/autojump.sh

# Tab completion for colorls
source $(dirname $(gem which colorls))/tab_complete.sh

# sintax highlighting
echo "source /home/leafnoise/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# Set Spaceship ZSH as a prompt
  autoload -U promptinit; promptinit
  prompt spaceship

source /home/leafnoise/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
