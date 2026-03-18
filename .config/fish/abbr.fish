# Fish abbreviations — expand in-place on Space/Enter.
# Unlike aliases, the full command is shown and recorded in history.
# Use for anything you want to inspect, tweak, or have auditable history for.

# ── Git ───────────────────────────────────────────────────────────────────────
abbr -a g     git
abbr -a ga    'git add'
abbr -a gaa   'git add .'
abbr -a gc    'git commit'
abbr -a gcm   'git commit -m'
abbr -a gca   'git commit --amend'
abbr -a gco   'git checkout'
abbr -a gsw   'git switch'
abbr -a gswc  'git switch -c'
abbr -a gp    'git push'
abbr -a gpo   'git push -u origin (git branch --show-current)'
abbr -a gpl   'git pull'
abbr -a gplr  'git pull --rebase'
abbr -a gst   'git status -sb'
abbr -a gd    'git diff'
abbr -a gds   'git diff --staged'
abbr -a glog  'git log --oneline --graph --decorate --all'
abbr -a grh   'git reset HEAD'
abbr -a grhh  'git reset HEAD --hard'
abbr -a grb   'git rebase'
abbr -a grbi  'git rebase -i'
abbr -a gstsh 'git stash'
abbr -a gstp  'git stash pop'
abbr -a clone 'git clone'

# ── Terraform ─────────────────────────────────────────────────────────────────
abbr -a tf    terraform
abbr -a tfi   'terraform init'
abbr -a tfiu  'terraform init -upgrade'
abbr -a tfp   'terraform plan'
abbr -a tfpa  'terraform plan -auto-approve'
abbr -a tfa   'terraform apply'
abbr -a tfaa  'terraform apply -auto-approve'
abbr -a tfd   'terraform destroy'
abbr -a tfda  'terraform destroy -auto-approve'
abbr -a tfv   'terraform validate'
abbr -a tff   'terraform fmt -recursive'
abbr -a tfw   'terraform workspace'
abbr -a tfwl  'terraform workspace list'
abbr -a tfws  'terraform workspace select'
abbr -a tfwn  'terraform workspace new'
abbr -a tfo   'terraform output'
abbr -a tfs   'terraform state'
abbr -a tfsl  'terraform state list'

# ── Terragrunt ────────────────────────────────────────────────────────────────
abbr -a tg    terragrunt
abbr -a tgp   'terragrunt plan'
abbr -a tga   'terragrunt apply'
abbr -a tgaa  'terragrunt apply -auto-approve'
abbr -a tgd   'terragrunt destroy'
abbr -a tgra  'terragrunt run-all'

# ── Kubernetes ────────────────────────────────────────────────────────────────
abbr -a k     kubectl
abbr -a kgp   'kubectl get pods'
abbr -a kgpa  'kubectl get pods -A'
abbr -a kgpw  'kubectl get pods -w'
abbr -a kgs   'kubectl get services'
abbr -a kgsA  'kubectl get services -A'
abbr -a kgn   'kubectl get nodes'
abbr -a kgd   'kubectl get deployments'
abbr -a kgdA  'kubectl get deployments -A'
abbr -a kgi   'kubectl get ingress'
abbr -a kgcm  'kubectl get configmap'
abbr -a kgsec 'kubectl get secret'
abbr -a kd    'kubectl describe'
abbr -a kdp   'kubectl describe pod'
abbr -a kdd   'kubectl describe deployment'
abbr -a kl    'kubectl logs -f'
abbr -a kla   'kubectl logs -f --all-containers'
abbr -a ke    'kubectl exec -it'
abbr -a kap   'kubectl apply -f'
abbr -a kdel  'kubectl delete'
abbr -a kns   'kubectl config set-context --current --namespace'
abbr -a kctx  'kubectl config use-context'
abbr -a kctxs 'kubectl config get-contexts'
abbr -a kconf 'kubectl config view'
abbr -a kpf   'kubectl port-forward'
abbr -a ksc   'kubectl scale'

# ── Docker ────────────────────────────────────────────────────────────────────
abbr -a d     docker
abbr -a dc    'docker compose'
abbr -a dcu   'docker compose up'
abbr -a dcud  'docker compose up -d'
abbr -a dcd   'docker compose down'
abbr -a dcb   'docker compose build'
abbr -a dcl   'docker compose logs -f'
abbr -a dps   'docker ps'
abbr -a dpsa  'docker ps -a'
abbr -a dex   'docker exec -it'
abbr -a di    'docker images'
abbr -a drm   'docker rm'
abbr -a drmi  'docker rmi'

# ── Python / uv ───────────────────────────────────────────────────────────────
abbr -a venv  'uv venv'
abbr -a pip   'uv pip'
abbr -a pipi  'uv pip install'
abbr -a pipr  'uv pip install -r requirements.txt'
abbr -a uvr   'uv run'
abbr -a uvs   'uv sync'
abbr -a uva   'uv add'

# ── AWS ───────────────────────────────────────────────────────────────────────
abbr -a awsp  'export AWS_PROFILE'
abbr -a awsw  'aws sts get-caller-identity'
abbr -a awsl  'aws sso login'

# ── Navigation ────────────────────────────────────────────────────────────────
abbr -a ..    'cd ..'
abbr -a ...   'cd ../..'
abbr -a ....  'cd ../../..'
abbr -a ws    'cd ~/Workspace'
