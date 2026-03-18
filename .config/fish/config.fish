# ── PATH ─────────────────────────────────────────────────────────────────────
fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/bin

# ── EDITOR ───────────────────────────────────────────────────────────────────
set -gx EDITOR vim

# ── GoLang ───────────────────────────────────────────────────────────────────
set -gx GOPATH $HOME/Workspace/Go
set -gx GOROOT /opt/homebrew/opt/go/libexec
fish_add_path $GOROOT/bin
fish_add_path $GOPATH/bin

# ── pnpm ─────────────────────────────────────────────────────────────────────
set -gx PNPM_HOME "$HOME/Library/pnpm"
fish_add_path $PNPM_HOME

# ── Bun ──────────────────────────────────────────────────────────────────────
set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path $BUN_INSTALL/bin

# ── GPG ──────────────────────────────────────────────────────────────────────
set -gx GPG_TTY (tty)

# ── AWS ──────────────────────────────────────────────────────────────────────
set -q AWS_DEFAULT_PROFILE; or set -gx AWS_DEFAULT_PROFILE dev

# ── Ansible ──────────────────────────────────────────────────────────────────
set -gx ANSIBLE_VAULT_PASSWORD_FILE $HOME/.ansible/.vault_pass.txt

# ── Dir colors ───────────────────────────────────────────────────────────────
set -gx LS_COLORS "no=00;38;5;244:rs=0:di=00;38;5;33:ln=00;38;5;37:mh=00:pi=48;5;230;38;5;136;01:so=48;5;230;38;5;136;01:do=48;5;230;38;5;136;01:bd=48;5;230;38;5;244;01:cd=48;5;230;38;5;244;01:or=48;5;235;38;5;160:su=48;5;160;38;5;230:sg=48;5;136;38;5;230:ca=30;41:tw=48;5;64;38;5;230:ow=48;5;235;38;5;33:st=48;5;33;38;5;230:ex=00;38;5;64:*.tar=00;38;5;61:*.tgz=00;38;5;61:*.zip=00;38;5;61:*.gz=00;38;5;61:*.bz2=00;38;5;61:*.deb=00;38;5;61:*.rpm=00;38;5;61:*.jar=00;38;5;61:*.jpg=00;38;5;136:*.jpeg=00;38;5;136:*.gif=00;38;5;136:*.png=00;38;5;136:*.svg=00;38;5;136:*.md=00;38;5;245:*.yml=00;38;5;245:*.yaml=00;38;5;245:*.toml=00;38;5;245:*.json=00;38;5;245:*.go=00;38;5;245:*.py=00;38;5;245:*.rs=00;38;5;245:*.tf=00;38;5;245:*.sh=00;38;5;64"

# ── TFSwitch – auto-switch on cd into terraform dirs ─────────────────────────
function switch_terraform --on-event fish_postexec
    string match --regex '^cd\s' "$argv" >/dev/null; or return
    if count *.tf >/dev/null 2>&1
        if grep -qc "required_version" *.tf 2>/dev/null
            command tfswitch
        end
    end
end

# ── Zoxide (smart cd) ────────────────────────────────────────────────────────
zoxide init fish | source

# ── fzf key bindings ─────────────────────────────────────────────────────────
if command -q fzf
    fzf --fish | source
end

# ── Atuin (shell history) ────────────────────────────────────────────────────
if command -q atuin
    atuin init fish | source
end

# ── Starship prompt ──────────────────────────────────────────────────────────
if command -q starship
    starship init fish | source
end

# ── Secrets & secure env (not tracked in dotfiles) ───────────────────────────
[ -f $HOME/.config/fish/secrets.fish ]; and source $HOME/.config/fish/secrets.fish
[ -f $HOME/.config/fish/secure_env.fish ]; and source $HOME/.config/fish/secure_env.fish

# ── Aliases & Abbreviations ───────────────────────────────────────────────────
[ -f $HOME/.config/fish/aliases.fish ]; and source $HOME/.config/fish/aliases.fish
[ -f $HOME/.config/fish/abbr.fish ];    and source $HOME/.config/fish/abbr.fish
