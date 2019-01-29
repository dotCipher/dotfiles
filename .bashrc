[ -n "$PS1" ] && source ~/.bash_profile;


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/cmoore/.sdkman"
[[ -s "/home/cmoore/.sdkman/bin/sdkman-init.sh" ]] && source "/home/cmoore/.sdkman/bin/sdkman-init.sh"

[ -s "/home/cmoore/.jabba/jabba.sh" ] && source "/home/cmoore/.jabba/jabba.sh"
