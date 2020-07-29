
alias c "clear"

alias gw "./gradlew"

alias g "git"
alias gaa "git add ."
alias gcm "git commit -m"
alias gco "git checkout"
alias gp "git push"
alias gpo "git push -u origin (git branch | grep \* | cut -d ' ' -f2)"
alias clone "git clone"

alias k "kubectl"
alias kctx "kubectx"

alias aws "set -x AWS_VAULT; aws-vault exec \$AWS_DEFAULT_PROFILE -- /usr/local/bin/aws $argv"
alias avl "set -x AWS_VAULT; aws-vault login $argv"
alias ave "set -x AWS_VAULT; aws-vault exec $argv"
alias exa "exa --icons"
alias ls "exa --icons"
