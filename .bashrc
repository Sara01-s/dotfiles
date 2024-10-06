#
# ~/.bashrc
#

# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# use cls to clear terminal (like Windows).
alias cls='clear'

# use bat instead of cat.
alias cat='bat'

# use eza instead of ls.
alias ls='eza --icons --color=always --group-directories-first'
alias ll='eza -alF --icons --color=always --group-directories-first'
alias la='eza -a --icons --color=always --group-directories-first'
alias l='eza -F --icons --color=always --group-directories-first'
alias l.='eza -a | egrep "^\."'


alias rm='trash' # use trash-cli to prevent deleting stuff permanently

# colorize grep.
alias grep='grep --color=auto'

. "$HOME/.cargo/env"

# personal git shortcuts.
alias ga="git add"
alias gs="git status -s"
alias gp="git push"
alias gl="git log --oneline"
alias gc="git commit -m $1"
alias gpl="git pull"
alias gplr="git pull --rebase"
alias gfp="git fetch && git pull"

gcl() {
	git clone "https://github.com/$1.git"
}

gcls() {
	git clone "git@github.com:$1.git"
}

gcp() { # git add all, commit and push.
	git add . && git commit -m "$1" && git push
}

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# default prompt if starship dies.
PS1='[\u@\h \W]\$ '

# Setup starship command prompt.
eval "$(starship init bash)"

# Setup zoxide to replace cd command.
# if you don't want this behaviour, delete '--cmd cd' ('z' will be used instead).
eval "$(zoxide init --cmd cd bash)"

# secret aliases
alias blender="prime-run blender"
alias minecraft-launcher="prime-run minecraft-launcher"
