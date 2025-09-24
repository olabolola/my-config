# Homebrew Environment
eval "$(/opt/homebrew/bin/brew shellenv)"
set -x JAVA_HOME "/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home"
# open the git repo remote url from within any git repo
function gobrowse
    # grab the origin URL
    set url (git config --get remote.origin.url)
    # if it’s in git@… form, convert to https://host/user/repo
    set url (string replace -r '^git@([^:]+):(.+?)(\.git)?$' 'https://\1/\2' $url)
    # if it’s already https://… strip any trailing “.git”
    set url (string replace -r '^(https?://.+?)(\.git)?$' '$1' $url)
    open $url
end

# Navigate to git project root
function groot
    set git_root (git rev-parse --show-toplevel)
    cd $git_root
end

# Path Customizations
# pipx installs
set -Ua PATH $HOME/.local/bin

# Docker CLI path
set -gx PATH /Applications/Docker.app/Contents/Resources/bin $PATH
set -gx PATH $HOME/.local/bin $PATH

# duckdb
set -gx PATH '/Users/salihjasim/.duckdb/cli/latest' $PATH

#source "$HOME/.cargo/env.fish"

# Runtime Environment Managers
# rbenv
status is-interactive; and type -q rbenv; and rbenv init - fish | source

# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
status is-interactive; and type -q pyenv; and pyenv init - | source

# fnm (fast node manager)
type -q fnm; and fnm env --use-on-cd --shell fish | source

# ==============================
# Interactive Enhancements
# ==============================
status is-interactive; and type -q zoxide; and zoxide init fish --cmd cd | source
status is-interactive; and type -q fzf; and fzf --fish | source
status is-interactive; and type -q direnv; and direnv hook fish | source

# Appearance / UX
set -g fish_greeting  # Disable the default fish greeting

# Auto-use Node version on shell startup
nvm use 24.6.0 > /dev/null 2>&1

# sublime text
alias subl='open -a "Sublime Text"'

# Aliases
alias cat='bat'
alias ls='eza'
alias ll='eza -alh --icons --no-user --git --git-repos'

# Git Aliases
alias gitwork='git config user.name "Salih"; git config user.email "salih.jasim@allient.com"'
alias gitpersonal='git config user.name "olabolola"; git config user.email "leolabola@gmail.com"'
alias gco='git checkout'
alias ga='git add'
alias gc='git commit'
alias gs='git status'
alias gcane='git commit --amend --no-edit'
alias gw='git switch'
alias gw-='git switch -'
alias gl="git log --color --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gout='git log @{u}..'
alias gpf='git push --force-with-lease'
alias gf='git fetch -v -p'
alias gcm='git commit --message'
alias gbs='git --no-pager diff --stat develop..HEAD'
alias cempty='git commit --allow-empty -m "chore: Empty commit to re-trigger build"'
alias seemerged="git branch --merged | grep -vE '^\*|main|master|develop|cresconet-delivery|sit-env|environment/uat|environment/prod|environment/prd'"
