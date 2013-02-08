#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PATH=$PATH:~/bin

alias l='ls -A --color=auto'
alias ls='ls --color=auto'
alias ll='ls -Alh'
alias l.='ls -d .* --color=auto'

alias cdpwd='cd $OLDPWD'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'

alias mount='mount | column -t'
alias kkill='pkill -KILL'

# Pacman
alias pacin='pacman --needed -S'
alias pacupd='pacman -Syy'
alias pacupg='pacman -Syu'
alias pacfind='pacman -Ss | grep'

# Yum
alias yumin='yum -y install'
alias yumup='yum -y update'
alias yumfind='yum search'

OFF="\[\e[m\]"
CYN="\[\e[36m\]"
RED="\[\e[31m\]"
GRE="\[\e[32m\]"
BLU="\[\e[34m\]"
PIN="\[\e[35m\]"
BOLD="\[\e[1m\]"

function exitok {
   RET="$?"
   PMT=$RED
   USR=$GRE
   [[ $UID -eq 0 ]] && USR=$RED
   [[ $RET -eq 0 ]] && PMT=$CYN
   PROMPT="\u@\h \W"
   PS1="${PMT}.:[ ${OFF}$PROMPT ${PMT}]:.\n#${OFF}(${PMT}${RET}${OFF})> "
}
   
PROMPT_COMMAND=exitok

# If we are on /dev/tty6 and not root then startx
if [ -z "$DISPLAY" ] && [ $(tty) == /dev/tty6 ] && [ "$UID" -ne 0 ]; then
	startx
elif [ -f "$(which fortune)" ] && [ -f "$(which cowsay)" ]; then
	if [ "$UID" -eq 0 ]; then
		echo -ne "\e[31m"
		fortune | cowsay -f daemon
		echo ""
	else
		echo -ne "\e[32m"
		fortune | cowsay -f tux
		echo ""
	fi
fi

