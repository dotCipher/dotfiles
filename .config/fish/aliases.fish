# ── General ───────────────────────────────────────────────────────────────────
alias c "clear"
alias ipv4 "dig +short myip.opendns.com @resolver1.opendns.com"

# ── File listing (eza) ────────────────────────────────────────────────────────
alias ls "eza --icons --group-directories-first"
alias ll "eza --icons --group-directories-first -la --git"
alias lt "eza --icons --tree --level=2"
alias lta "eza --icons --tree --level=3"

# ── File viewing (bat) ────────────────────────────────────────────────────────
# bat config (~/.config/bat/config) sets: no pager, plain style, Catppuccin Mocha theme.
# `cat` is a clean drop-in: syntax-highlighted, copy-pasteable, no decorations.
# `batp` enables the full reading experience with pager + decorations.
alias cat "bat"
alias batp "bat --style=full --paging=always"

# ── Search (ripgrep + fd) ─────────────────────────────────────────────────────
alias rg "rg --smart-case"
alias find "fd"

# ── Navigation (zoxide) ───────────────────────────────────────────────────────
# zi  → interactive jump with fzf (built into zoxide)
# z   → smart jump (replaces cd)

# ── Git ───────────────────────────────────────────────────────────────────────
alias g "git"
alias gaa "git add ."
alias gc "git commit"
alias gcm "git commit -m"
alias gco "git checkout"
alias gp "git push"
alias gpo "git push -u origin (git branch --show-current)"
alias grhh "git reset HEAD --hard"
alias gst "git status -sb"
alias glog "git log --oneline --graph --decorate --all"
alias gdiff "git diff"
alias clone "git clone"
alias lg "lazygit"

# ── Terraform / Terragrunt ────────────────────────────────────────────────────
alias tf "terraform"
alias tg "terragrunt"
alias tfi "terraform init"
alias tfp "terraform plan"
alias tfa "terraform apply"
alias tfd "terraform destroy"
alias tfv "terraform validate"
alias tff "terraform fmt -recursive"

# ── Kubernetes ────────────────────────────────────────────────────────────────
alias k "kubectl"
alias kx "kubectx"
alias kns "kubens"
alias kgp "kubectl get pods"
alias kgpa "kubectl get pods -A"
alias kgs "kubectl get services"
alias kgn "kubectl get nodes"
alias klogs "kubectl logs -f"
alias kdesc "kubectl describe"
alias kexec "kubectl exec -it"
alias kctx "kubectl config current-context"
alias kctxs "kubectl config get-contexts"

# ── Docker ────────────────────────────────────────────────────────────────────
alias d "docker"
alias dc "docker compose"
alias dps "docker ps"
alias dpsa "docker ps -a"
alias docker-nuke "docker stop (docker ps -a -q) 2>/dev/null; docker rm (docker ps -a -q) 2>/dev/null; docker system prune -f"

# ── Python / uv ───────────────────────────────────────────────────────────────
alias py "python3"
alias venv "uv venv"
alias pip "uv pip"

# ── Process / system ─────────────────────────────────────────────────────────
alias ports "lsof -iTCP -sTCP:LISTEN -n -P"
alias myip "ipv4"
