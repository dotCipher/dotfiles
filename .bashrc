[[ -n "$PS1" ]] && source ~/.bash_profile;

# This file shouldn't have anything else in it, since I organize my bash settings into other files
#  (see ~/.bash_profile , ~/.bash_env , etc)

# Cargo (Rust)
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# UV / local bin
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# VoiceMode shell completion
if command -v voicemode >/dev/null 2>&1; then
    # Check bash version for nosort compatibility
    bash_version="${BASH_VERSION%%.*}"
    bash_minor="${BASH_VERSION#*.}"
    bash_minor="${bash_minor%%.*}"

    if [[ $bash_version -gt 4 ]] || [[ $bash_version -eq 4 && $bash_minor -ge 4 ]]; then
        eval "$(_VOICEMODE_COMPLETE=bash_source voicemode)"
    else
        # Filter out nosort for older bash versions
        eval "$(_VOICEMODE_COMPLETE=bash_source voicemode | sed 's/complete -o nosort/complete/g')"
    fi
fi
