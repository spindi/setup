alias bat='batcat'
alias b='browsh --startup-url www.duckduckgo.com'
alias diff='colordiff'
alias dc='docker-compose'
alias dm='docker-machine'
alias dms='socat tcp-listen:2376,reuseaddr,fork,bind=127.0.0.1 unix-client:/var/run/docker.sock'
alias e='date +"%s"'
alias e2d=~/Setup/e/e2d.sh
alias ep1d="echo \"\`e\` + 86400\" | bc"
alias ep1m="echo \"\`e\` + (86400 * 30)\" | bc"
alias ep2d="echo \"\`e\` + 86400 + 86400\" | bc"
alias ep2m="echo \"\`e\` + (86400 * 60)\" | bc"
alias ep3m="echo \"\`e\` + (86400 * 90)\" | bc"
alias fd="fdfind"
set GREP_BREW_DIR (brew --prefix grep)
if test -f $GREP_BREW_DIR/bin/grep
  alias grep=$GREP_BREW_DIR/bin/grep
else if test -f $GREP_BREW_DIR/bin/ggrep
  alias grep=$GREP_BREW_DIR/bin/ggrep
end
alias h='history'
alias ip='curl ifconfig.co'
alias ll='ls -al'
alias lll='find . | grep'
alias ls='gls --color=auto --group-directories-first'
alias n='nb'
set PYTHON_BREW_DIR (brew --prefix python)
alias python="$PYTHON_BREW_DIR/bin/python3"
alias pip="$PYTHON_BREW_DIR/bin/pip3"
alias t='tree -C'
alias vd='visidata'
alias ttfb='curl -s -o /dev/null -w "{ \"connect\": %{time_connect}, \"ttfb\": %{time_starttransfer}, \"total\": %{time_total} }\n"'

