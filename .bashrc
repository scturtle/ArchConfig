# Check for an interactive session
[ -z "$PS1" ] && return
PS1='[\u@\h \W]\$ '

PATH+=:.
alias sudo='sudo '
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias sshgfw='ssh -qTfnN -D 7070 scturtle@hoo.sshchina.com'
alias sshgfw6='ssh -qTfnN -D 7070 scturtle@hoo6.sshchina.com'
alias supc='sudo pacman-color'
alias supw='sudo powerpill'
alias pcop='sudo pacman-optimize && sync'
alias rm='trash-put'

export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE=xim
export GTK_IM_MODULE=xim
xset b off
