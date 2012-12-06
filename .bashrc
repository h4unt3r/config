alias l='ls -A --color=auto'
alias ls='ls --color=auto'
alias ll='ls -Alh'
alias l.='ls -d .* --color=auto'

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias mount='mount | column -t'

alias pacin='pacman --needed -S'
alias pacupd='pacman -Syy'
alias pacupg='pacman -Syu'
alias pacfind='pacman -Ss | grep'

OFF="\e[m"
CYN="\e[36m"
RED="\e[31m"
GRE="\e[32m"
BLU="\e[34m"
PIN="\e[35m"
BOLD="\e[1m"

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
