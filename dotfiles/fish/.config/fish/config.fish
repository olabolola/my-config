# ==============================
# Interactive Session Checks
# ==============================
if status is-interactive
    # zoxide
    if type -q zoxide
        zoxide init fish --cmd cd | source
    end

    # fzf
    if type -q fzf
        fzf --fish | source
    end

    # direnv
    if type -q direnv
        direnv hook fish | source
    end
end

# ==============================
# Homebrew Environment
# ==============================
eval "$(/opt/homebrew/bin/brew shellenv)"

# ==============================
# Runtime Environment Managers
# ==============================

# rbenv
if status is-interactive
    if type -q rbenv
        rbenv init - fish | source
    end
end

# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
if status is-interactive
    if type -q pyenv
        pyenv init - | source
    end
end

# fnm (Node.js)
if type -q fnm
    fnm env --use-on-cd --shell fish | source
end

# ==============================
# Path Customizations
# ==============================
# pipx installs
set -Ua PATH $HOME/.local/bin

# Docker CLI path
set -gx PATH /Applications/Docker.app/Contents/Resources/bin $PATH

# ==============================
# Appearance / UX
# ==============================
set -g fish_greeting  # Disable the default fish greeting

# ==============================
# Git Aliases
# ==============================
alias gco='git checkout'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gcane='git commit --amend --no-edit'
alias gw='git switch'
alias gw-='git switch -'
alias gl='git log --oneline'
alias gpf='git push --force-with-lease'
alias gf='git fetch -v -p'
alias gcm='git commit --message'
alias gbs='git --no-pager diff --stat develop..HEAD'

