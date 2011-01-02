# Check for an interactive session
[ -z "$PS1" ] && return
PS1='[\u@\h \W]\$ '

PATH+=:.
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias sshgfw='ssh -qTfnN -D 7070 scturtle@hoo.sshchina.com'
alias sshgfw6='ssh -qTfnN -D 7070 scturtle@hoo6.sshchina.com'
alias supc='sudo pacman'
alias supw='sudo powerpill'
alias pcop='sudo pacman-optimize && sync'

export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE=xim
export GTK_IM_MODULE=xim
