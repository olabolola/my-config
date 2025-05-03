# ==============================
# Homebrew Environment
# ==============================
eval "$(/opt/homebrew/bin/brew shellenv)"

function gobrowse
    # grab the origin URL
    set url (git config --get remote.origin.url)
    # if it’s in git@… form, convert to https://host/user/repo
    set url (string replace -r '^git@([^:]+):(.+?)(\.git)?$' 'https://\1/\2' $url)
    # if it’s already https://… strip any trailing “.git”
    set url (string replace -r '^(https?://.+?)(\.git)?$' '$1' $url)
    # echo $url
    # open it
    open $url
end

# ==============================
# Path Customizations
# ==============================
# pipx installs
set -Ua PATH $HOME/.local/bin

# Docker CLI path
set -gx PATH /Applications/Docker.app/Contents/Resources/bin $PATH
set -gx PATH $HOME/.local/bin $PATH

if not pgrep -x yabai > /dev/null
    yabai --start-service
end

if not pgrep -x skhd > /dev/null
    skhd --start-service
end

# Vim mode
set -g fish_key_bindings fish_vi_key_bindings
set fish_vi_force_cursor 1
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
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
alias ls='eza'

alias gitwork='git config user.name "Salih"; git config user.email "salih.jasim@cresconet.com"'
alias gitpersonal='git config user.name "olabolola"; git config user.email "leolabola@gmail.com"'
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
alias cempty='git commit --allow-empty -m "chore: Empty commit to re-trigger build"'
alias seemerged="git branch --merged | grep -vE '^\*|main|master|develop|cresconet-delivery|sit-env|environment/uat|environment/prod|environment/prd'"
