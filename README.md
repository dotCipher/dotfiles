# Dotfiles

Personal config files, symlinked to `$HOME` by the
[workstation-playbooks](https://github.com/dotCipher/workstation-playbooks)
Ansible setup via `geerlingguy.dotfiles`.

## What's Here

| Path | Purpose |
|------|---------|
| `.config/fish/` | Fish shell config, aliases, functions, plugins |
| `.config/alacritty/` | Alacritty terminal (TOML) |
| `.config/zed/` | Zed editor settings |
| `.config/gh/` | GitHub CLI config |
| `.bash_*`, `.bashrc` | Bash shell config (aliases, env, profile) |
| `.profile`, `.zshenv`, `.zprofile` | Portable shell env for Zsh/POSIX |
| `.gitconfig` | Git config (GPG signing, LFS, credential helpers) |
| `.gnupg/` | GPG agent config (pinentry-mac) |
| `.tmux.conf` | Tmux config |
| `.vimrc` | Vim config |
| `.actrc` | GitHub Actions local runner (act) image mappings |
| `.osx` | Standalone macOS defaults script (reference only) |

## Secrets

Sensitive values (API keys, tokens) go in `~/.config/fish/secrets.fish`,
which is gitignored. Never commit secrets to this repo.
