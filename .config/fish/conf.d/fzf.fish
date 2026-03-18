# fzf configuration
# Key bindings are initialized in config.fish via `fzf --fish | source`

# Default command: use fd for faster, git-aware file listing
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git --exclude node_modules --exclude .venv'

# Default options: layout, colors (Catppuccin Mocha), preview window
set -gx FZF_DEFAULT_OPTS "\
  --height=60% \
  --layout=reverse \
  --border=rounded \
  --border-label-pos=3 \
  --prompt='  ' \
  --pointer=' ' \
  --marker='  ' \
  --info=inline \
  --ansi \
  --bind='ctrl-/:toggle-preview' \
  --bind='ctrl-u:preview-page-up' \
  --bind='ctrl-d:preview-page-down' \
  --bind='ctrl-a:select-all' \
  --bind='ctrl-y:execute-silent(echo -n {+} | pbcopy)' \
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
  --color=selected-bg:#45475a \
  --color=border:#313244,label:#cdd6f4"

# Ctrl-T (file search): preview files with bat, dirs with eza
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_CTRL_T_OPTS "\
  --preview 'if test -d {}; eza --icons --tree --level=2 --color=always {}; else; bat --color=always --style=numbers --line-range=:200 {}; end' \
  --preview-window='right:55%:wrap'"

# Alt-C (directory jump): preview dir tree with eza
set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --follow --exclude .git --exclude node_modules'
set -gx FZF_ALT_C_OPTS "\
  --preview 'eza --icons --tree --level=2 --color=always {}' \
  --preview-window='right:55%'"

# Ctrl-R (history search): show full command in preview
set -gx FZF_CTRL_R_OPTS "\
  --preview 'echo {}' \
  --preview-window='down:3:wrap' \
  --bind='ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'"
