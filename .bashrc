### EXPORT
export TERM="xterm-256color"                      # getting proper colors
export HISTCONTROL=ignoredups:erasedups           # no duplicate entries
# export ALTERNATE_EDITOR=""                        # setting for emacsclient
# export EDITOR="emacsclient -t -a ''"              # $EDITOR use Emacs in terminal
# export VISUAL="emacsclient -c -a emacs"           # $VISUAL use Emacs in GUI mode
export LANG="en_GB.UTF-8"

### Set "vim" as manpager

export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### "nvim" as manpager
# export MANPAGER="nvim -c 'set ft=man' -"

### SET VI MODE ###
# Comment this line out to enable default emacs-like bindings
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### PROMPT
# PS1='[\u@\h \W]\$ '

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

### ALIASES ###

# root privileges
# alias doas="doas --"

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

# vim and emacs
# alias vim='nvim'
# alias em='/usr/bin/emacs -nw'
# alias emacs="emacsclient -c -a 'emacs'"
# alias doomsync="~/.emacs.d/bin/doom sync"
# alias doomdoctor="~/.emacs.d/bin/doom doctor"
# alias doomupgrade="~/.emacs.d/bin/doom upgrade"
# alias doompurge="~/.emacs.d/bin/doom purge"

# Changing "ls" to "exa"
# alias ls='exa -al --color=always --group-directories-first' # my preferred listing
# alias la='exa -a --color=always --group-directories-first'  # all files and dirs
# alias ll='exa -l --color=always --group-directories-first'  # long format
# alias lt='exa -aT --color=always --group-directories-first' # tree listing
# alias l.='exa -a | egrep "^\."'

# get fastest mirrors
# alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
# alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
# alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
# alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

### ALIASES ###

# root privileges
# alias doas="doas --"

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# vim and emacs
# alias vim='nvim'
# alias em='/usr/bin/emacs -nw'
# alias emacs="emacsclient -c -a 'emacs'"
# alias doomsync="~/.emacs.d/bin/doom sync"
# alias doomdoctor="~/.emacs.d/bin/doom doctor"
# alias doomupgrade="~/.emacs.d/bin/doom upgrade"
# alias doompurge="~/.emacs.d/bin/doom purge"

# Changing "ls" to "exa"
# alias ls='exa -al --color=always --group-directories-first' # my preferred listing
# alias la='exa -a --color=always --group-directories-first'  # all files and dirs
# alias ll='exa -l --color=always --group-directories-first'  # long format
# alias lt='exa -aT --color=always --group-directories-first' # tree listing
# alias l.='exa -a | egrep "^\."'

# get fastest mirrors
# alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
# alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
# alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
# alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

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
# alias lynx='lynx -cfg=~/.lynx/lynx.cfg -lss=~/.lynx/lynx.lss -vikeys'
# alias vifm='./.config/vifm/scripts/vifmrun'
# alias ncmpcpp='ncmpcpp ncmpcpp_directory=$HOME/.config/ncmpcpp/'
# alias mocp='mocp -M "$XDG_CONFIG_HOME"/moc -O MOCDir="$XDG_CONFIG_HOME"/moc'

# ps
# alias psa="ps auxf"
# alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
# alias psmem='ps auxf | sort -nr -k 4'
# alias pscpu='ps auxf | sort -nr -k 3'

### Merge Xresources
# alias merge='xrdb -merge ~/.Xresources'

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
alias gstat='git status'
alias gtag='git tag'
alias gnewtag='git tag -a'

# gpg encryption
# verify signature for isos
# alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
# alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# switch default shells
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Default shells changed to bash.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Default shells changed to fish.'"

# bare git repo alias for dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/Dotfiles --work-tree=$HOME"

# apt
alias update='sudo apt update && sudo apt full-upgrade -y'
alias clean='sudo apt autoremove && sudo apt clean'
alias upkg='sudo snap refresh && flatpak update && flatpak remove --unused'
alias cero='update && upkg && clean'

# config
alias ac='vi ~/.config/alacritty/alacritty.yml'
alias bc='vi ~/.bashrc'
alias fc='vi ~/.config/fish/config.fish'
alias ssc='vi ~/.config/starship.toml'
alias hist='vi ~/.local/share/fish/fish_history'

# xrandr
alias scr='xrandr --output DP-4 --brightness'
alias rotate='xrandr --output DP-4 --rotate'
alias night='xrandr --output DP-4 --gamma 1.0:0.88:0.76 --brightness 0.55'

# bleachbit
alias bs='bleachbit -s'
alias sbs='sudo bleachbit -s'

# games
alias tetris=/snap/bin/tetris-thefenriswolf.tetris

# small
alias ctc='xclip -se c'
alias mat='mat2 --inplace'
alias sf='shred -vfzu'
alias hist='vi ~/.local/share/fish/fish_history'
alias r='radian'
alias clear='/bin/clear && colorscript random'
alias grep='grep -n'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

### SETTING THE STARSHIP PROMPT ###
# eval "$(starship init bash)"

# to use fish, in case of OS crashes
fish
