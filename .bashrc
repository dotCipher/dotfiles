[ -n "$PS1" ] && source ~/.bash_profile;

# This file shouldn't have anything else in it, since I organize my bash settings into other files
#  (see ~/.bash_profile , ~/.bash_env , etc)


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -s "/mnt/c/Users/cmoore/.jabba/jabba.sh" ] && source "/mnt/c/Users/cmoore/.jabba/jabba.sh"
