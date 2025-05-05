### EXPORT
export TERM="xterm-256color"                      # getting proper colors
export HISTCONTROL=ignoredups:erasedups           # no duplicate entries
export LANG="en_GB.UTF-8"

### Set "vim" as manpager

export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### SET VI MODE ###
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

### CHANGE TITLE OF TERMINALS
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

### SHOPT
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # checks term size when bash regains control

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# navigation
up () {
  local d=""
  local limit="$1"

  # Default to limit of 1
  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi

  for ((i=1;i<=limit;i++)); do
    d="../$d"
  done

  # perform cd. Show error if cd fails
  if ! cd "$d"; then
    echo "Couldn't go up $limit dirs.";
  fi
}

garb() {
  if [ ! -d ~/Downloads/Shred ]; then
    mkdir -p ~/Downloads/Shred
  fi
  mv "$1" ~/Downloads/Shred
}

### ALIASES ###

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias lsa='ls -alps'			  		  # show files with enough infos

# git
alias gaddup='git add -u'
alias gaddall='git add .'
alias gbranch='git branch'
alias gcheckout='git checkout'
alias gclone='git clone'
alias gcommit='git commit -m'
alias gacm='git commit -am'
alias gfetch='git fetch'
alias gpull='git pull origin'
alias gpush='git push origin'
alias gpushf='git push -f origin'
alias gstat='git status'
alias gtag='git tag'
alias gnewtag='git tag -a'

# config
alias bc='vi ~/.bashrc'
alias ssc='vi ~/.config/starship.toml'
alias hist='vi ~/.bash_history'

# small
alias ctc='clip'
alias sf='shred -vfzu'
alias clear='/bin/clear'
alias grep='grep -n'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

runinbackground() {
    nohup $@ >/dev/null 2>&1 &
}

colorwheel () {
printf "\033[0m
    \033[49;35m|\033[49;31m|\033[101;31m|\033[41;97m|\033[49;91m|\033[49;93m|\033[0m
  \033[105;35m|\033[45;97m|\033[49;97m||\033[100;97m||\033[49;37m||\033[103;33m|\033[43;97m|\033[0m
  \033[49;95m|\033[49;94m|\033[100;37m||\033[40;97m||\033[40;37m||\033[49;33m|\033[49;32m|\033[0m
  \033[104;34m|\033[44;97m|\033[49;90m||\033[40;39m||\033[49;39m||\033[102;32m|\033[42;97m|\033[0m
    \033[49;34m|\033[49;36m|\033[106;36m|\033[46;97m|\033[49;96m|\033[49;92m|\033[0m

"
}

### SETTING THE STARSHIP PROMPT ###
eval "$(starship init bash)"
colorwheel
