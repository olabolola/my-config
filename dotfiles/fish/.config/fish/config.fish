# ==============================
# Homebrew Environment
# ==============================
eval "$(/opt/homebrew/bin/brew shellenv)"

# ==============================
# Path Customizations
# ==============================
# pipx installs
set -Ua PATH $HOME/.local/bin

# Docker CLI path
set -gx PATH /Applications/Docker.app/Contents/Resources/bin $PATH
set -gx PATH $HOME/.local/bin $PATH

# ==============================
# Runtime Environment Managers
# ==============================

# rbenv
status is-interactive; and type -q rbenv; and rbenv init - fish | source

# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
status is-interactive; and type -q pyenv; and pyenv init - | source

# fnm (Node.js)
type -q fnm; and fnm env --use-on-cd --shell fish | source

# ==============================
# Interactive Enhancements
# ==============================
status is-interactive; and type -q zoxide; and zoxide init fish --cmd cd | source
status is-interactive; and type -q fzf; and fzf --fish | source
status is-interactive; and type -q direnv; and direnv hook fish | source

# ==============================
# Appearance / UX
# ==============================
set -g fish_greeting  # Disable the default fish greeting

# Aliases
alias cat='bat'
alias eza='ls'

alias gitwork='git config user.name "Salih"; git config user.email "salih.jasim@cresconet.com"'
alias gitpersonal='git config user.name "olabola"; git config user.email "leolaola@gmail.com"'
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

