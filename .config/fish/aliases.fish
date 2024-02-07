
alias c "clear"

alias ipv4 "dig +short myip.opendns.com @resolver1.opendns.com"

alias gw "./gradlew"

alias g "git"
alias gaa "git add ."
alias gc "git commit"
alias gcm "git commit -m"
alias gco "git checkout"
alias gp "git push"
alias gpo "git push -u origin (git branch | grep \* | cut -d ' ' -f2)"
alias grhh "git reset HEAD --hard"
alias clone "git clone"

alias tf "terraform"
alias tg "terragrunt"

alias k "kubectl"
alias kctx "kubectx"

alias avl "aws-vault login $argv"
alias ave "aws-vault exec --no-session $argv"

alias ls "exa --icons"

alias docker-nuke "docker stop (docker ps -a -q); docker rm (docker ps -a -q); docker system prune -f"
alias tshfedstart "tsh login --auth=ad --proxy=https://tekapo.palantirfedstart.com:3080 wakatipu-production && tsh kube login --auth=ad --proxy=https://tekapo.palantirfedstart.com:3080 wakatipu-production"

alias helmlogin "aws ecr get-login-password --region us-east-1 --profile shared-infrastructure_tf | helm registry login --username AWS --password-stdin 623542229617.dkr.ecr.us-east-1.amazonaws.com"

alias awslogins "aws sso login && aws sso login --profile infra-worker_tf && aws sso login --profile shared-infrastructure_tf && aws sso login --profile development_tf && aws sso login --profile production_tf && aws sso login --profile manifest-cyber_tf && aws sso login --profile sandbox_tf"

