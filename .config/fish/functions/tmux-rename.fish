# tmux-rename.fish
# Smart tmux window renaming — called from fish_prompt hook
# Detects meaningful process names instead of just 'fish' or 'node'
#
# Priority order:
#   1. Known CLI tools by exact process name
#   2. node processes — inspect cmdline for known wrappers (opencode, etc.)
#   3. python processes — inspect cmdline
#   4. Fallback to basename of current directory

function tmux-rename
    # Only run inside tmux
    if not set -q TMUX
        return
    end

    set -l cmd (tmux display-message -p '#{pane_current_command}' 2>/dev/null)
    set -l dir (tmux display-message -p '#{pane_current_path}' 2>/dev/null)
    set -l name ""

    switch $cmd
        # Shells → use directory name
        case fish zsh bash sh
            set name (basename $dir)

        # Editors
        case vim nvim vi
            set name "nvim"
        case emacs
            set name "emacs"
        case hx
            set name "helix"

        # Git
        case git
            set name "git"
        case lazygit
            set name "lazygit"

        # Kubernetes / infra
        case kubectl
            set name "kubectl"
        case helm
            set name "helm"
        case k9s
            set name "k9s"
        case terraform terragrunt
            set name $cmd
        case tfswitch
            set name "tfswitch"

        # Containers
        case docker
            set name "docker"

        # Databases
        case psql
            set name "psql"
        case redis-cli
            set name "redis"
        case mongosh mongo
            set name "mongo"

        # Node — inspect cmdline to detect wrappers
        case node
            set -l cmdline (cat /proc/$fish_pid/cmdline 2>/dev/null | tr '\0' ' ')
            # macOS: use ps instead
            set -l full_cmd (ps -o args= -p (tmux display-message -p '#{pane_pid}') 2>/dev/null)
            if string match -q "*opencode*" $full_cmd
                set name "opencode"
            else if string match -q "*pnpm*" $full_cmd
                set name "pnpm"
            else if string match -q "*next*" $full_cmd
                set name "next"
            else if string match -q "*vite*" $full_cmd
                set name "vite"
            else if string match -q "*jest*" $full_cmd
                set name "jest"
            else if string match -q "*ts-node*" $full_cmd
                set name "ts-node"
            else
                set name "node"
            end

        # Python — inspect cmdline
        case python python3 python3.13
            set -l full_cmd (ps -o args= -p (tmux display-message -p '#{pane_pid}') 2>/dev/null)
            if string match -q "*ansible*" $full_cmd
                set name "ansible"
            else if string match -q "*pytest*" $full_cmd
                set name "pytest"
            else if string match -q "*uvicorn*" $full_cmd
                set name "uvicorn"
            else if string match -q "*manage.py*" $full_cmd
                set name "django"
            else
                set name "python"
            end

        # Go
        case go
            set name "go"

        # Rust
        case cargo
            set name "cargo"

        # Build / task runners
        case make
            set name "make"
        case task
            set name "task"

        # AI / LLM tools
        case opencode
            set name "opencode"
        case ollama
            set name "ollama"
        case claude
            set name "claude"

        # Network / monitoring
        case htop btop
            set name $cmd
        case curl wget
            set name $cmd
        case ssh
            set name "ssh"

        # Default: use whatever the command is
        case '*'
            set name $cmd
    end

    # Rename the tmux window
    if test -n "$name"
        tmux rename-window "$name" 2>/dev/null
    end
end
