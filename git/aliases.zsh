# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias gpp='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'

# Remove `+` and `-` from start of diff lines; just rely upon color.
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'
alias gl='glg $(git show-ref | cut -d " " -f 2 | grep -v stash$) HEAD'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gac='git add -A && git commit -m'
alias ge='git-edit-new'
alias gd='git diff'
alias gap='git add -p'
alias gds='gd --cached'
alias gdw='gd --word-diff=color --word-diff-regex="[A-z0-9_-]+"'

function git-log-graph() {
	git log --graph --pretty=format:'%Cred%h%Creset%C(yellow)%d%Creset %s %C(green bold)- %an %C(black bold)%cd (%cr)%Creset' --abbrev-commit --date=short "$@"
}

# git log
function glg() {
if [[ $# == 0 ]] && git rev-parse @{u} &> /dev/null; then
	git-log-graph @{u} HEAD
     else
	git-log-graph "$@"
     fi
}
