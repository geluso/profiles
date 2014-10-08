if [ -e ~/.local_bash_profile ]
then
  source ~/.local_bash_profile
else
  echo "no local profile"
fi

if [ -e ~/.private_bash_profile ]
then
  source ~/.private_bash_profile
else
  echo "no private profile"
fi

# bashy
alias ls='ls -G'
alias ll='ls -l'
alias grep='grep --color=auto'
alias epoch='date -j -f "%a %b %d %T %Z %Y" "`date`" "+%s"'
export PS1="\[\e[0;32m\w$ \e[m\]"
export EDITOR="vim"
alias x="exit"
alias vim="vim -p"

rmn () {
  if [ -z "$1" ]
  then
    rm `ls | head -1` ; clear ; ls
  else
    rm `ls | head -$1` ; clear ; ls
  fi
}

#webdev
function serve {
  open 'http://localhost:8000'
  python -m SimpleHTTPServer
}

#git
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gd="git diff"
alias gco="git checkout"
alias gs="git status"
alias ginspect="echo 'git show --name-only'"

# SSH servers
alias ssh="ssh -i ~/.ssh/id_rsa"
alias scp="scp -i ~/.ssh/id_rsa"

function vimr() {
  touch $1
  chmod +x $1
  vim $1
}

# configure
alias vedit='vim ~/.vimrc'
alias ve='vedit'
alias brefresh='source ~/.bash_profile'
alias br='brefresh'
alias bedit='vim ~/.bash_profile'
alias be='bedit'
alias bep='vim ~/.private_bash_profile'
alias brp='source ~/.private_bash_profile'
alias bel='vim ~/.local_bash_profile'
alias brl='source ~/.local_bash_profile'

alias pingg='ping google.com'

# Define pretty OS X colors
export LSCOLORS=gxfxcxdxbxegedabagacad
export GREP_COLOR='1;32'

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
