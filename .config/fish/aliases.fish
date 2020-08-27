
alias c "clear"

alias gw "./gradlew"

alias g "git"
alias gaa "git add ."
alias gcm "git commit -m"
alias gco "git checkout"
alias gp "git push"
alias gpo "git push -u origin (git branch | grep \* | cut -d ' ' -f2)"
alias clone "git clone"

alias tf "terraform"
alias tg "terragrunt"

alias k "kubectl"
alias kctx "kubectx"

alias aws "set -e AWS_VAULT; aws-vault exec \$AWS_DEFAULT_PROFILE -- /usr/local/bin/aws $argv"
alias avl "set -e AWS_VAULT; aws-vault login $argv"
alias ave "set -e AWS_VAULT; aws-vault exec $argv"

alias exa "exa --icons"
alias ls "exa --icons"

alias docker-nuke "docker stop (docker ps -a -q); docker rm (docker ps -a -q); docker system prune -f"
