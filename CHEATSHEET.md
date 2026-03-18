# Cheatsheet

## Tmux `Ctrl-a`

| Key | Action |
|-----|--------|
| `Ctrl-a \|` | Split vertical |
| `Ctrl-a -` | Split horizontal |
| `Ctrl-a c` | New window |
| `Ctrl-a h/j/k/l` | Move between panes |
| `Ctrl-a H/J/K/L` | Resize pane |
| `Ctrl-a p/n` | Prev/next window |
| `Ctrl-a Tab` | Last window |
| `Ctrl-a ,` | Rename window |
| `Ctrl-a $` | Rename session |
| `Ctrl-a d` | Detach session |
| `Ctrl-a r` | Reload config |
| `Ctrl-a Enter` | Copy mode |
| `v` → `y` | Select → copy to clipboard |

---

## Alacritty

| Key | Action |
|-----|--------|
| `Cmd-N` | New window |
| `Cmd-W` | Close window |
| `Cmd-+/-` | Font size |
| `Cmd-F` | Search |
| `Cmd-Shift-Space` | Vi mode |

---

## Fish

| Key | Action |
|-----|--------|
| `Ctrl-r` | Atuin history search |
| `Ctrl-f` | Accept autosuggestion |
| `Alt-→` | Accept next word of suggestion |
| `Ctrl-w` | Delete word back |
| `Alt-d` | Delete word forward |
| `Ctrl-a/e` | Jump start/end of line |
| `Alt-l` | `ls` current dir |
| `Alt-p` | Page output of prev command |

### Navigation
```
z <query>    # zoxide jump to frecent dir
..  ...  ... # cd up 1/2/3 levels
ws           # ~/Workspace
```

---

## Git

```
gst   git status -sb         glog  log --graph --all
ga    git add                gd    diff
gaa   git add .              gds   diff --staged
gc    git commit             grb   rebase
gcm   git commit -m ""       grbi  rebase -i
gca   git commit --amend     gstsh stash
gco   git checkout           gstp  stash pop
gsw   git switch             grh   reset HEAD
gswc  git switch -c          grhh  reset HEAD --hard
gp    git push               gpo   push -u origin <branch>
gpl   git pull               gplr  pull --rebase
```

---

## Kubernetes `k`

```
kgp   get pods              kgn   get nodes
kgpa  get pods -A           kgd   get deployments
kgpw  get pods -w           kl    logs -f
kd    describe              kla   logs -f --all-containers
kdp   describe pod          ke    exec -it
kap   apply -f              kpf   port-forward
kdel  delete                kns   set namespace
kctx  use-context           kctxs get-contexts
```

---

## Docker `d`

```
dps    ps                   dex   exec -it
dpsa   ps -a                di    images
dc     compose              drm   rm
dcu    compose up           drmi  rmi
dcud   compose up -d        docker-nuke  kill+rm everything
dcd    compose down
dcl    compose logs -f
```

---

## Terraform `tf` / Terragrunt `tg`

```
tfi   init          tfp   plan          tfa   apply
tfiu  init -upgrade tfpa  plan -auto    tfaa  apply -auto
tfv   validate      tfw   workspace     tfd   destroy
tff   fmt -r        tfwl  ws list       tfda  destroy -auto
tfo   output        tfws  ws select
tfs   state         tfwn  ws new

tgp   tg plan       tga   tg apply      tgra  run-all
```

---

## Python / uv

```
venv   uv venv          uvr   uv run
pip    uv pip           uvs   uv sync
pipi   uv pip install   uva   uv add
pipr   pip install -r requirements.txt
```

---

## AWS

```
awsl   sso login
awsw   sts get-caller-identity (whoami)
awsp   export AWS_PROFILE=<name>
```

---

## System

```
ll     eza long list + git status
lt     eza tree depth 2
lta    eza tree depth 3
cat    bat (syntax highlighted)
find   fd
rg     ripgrep --smart-case
ports  lsof listening TCP ports
ipv4   public IP
lg     lazygit
py     python3
c      clear
```
