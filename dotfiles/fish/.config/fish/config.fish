if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval "$(/opt/homebrew/bin/brew shellenv)"
status --is-interactive; and rbenv init - fish | source

set -g fish_greeting
fnm env --use-on-cd --shell fish | source
zoxide init fish --cmd cd | source
fzf --fish | source

direnv hook fish | source

# git aliases
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
