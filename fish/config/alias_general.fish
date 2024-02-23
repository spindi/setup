# Helpers
for file in ~/Documents/Repo/Setup/helpers/*.sh
  set alias_name (echo $file | sed -e 's/.*\///' | sed -e 's/.sh$//')
  alias $alias_name=$file
end
alias loadtest='oha' # just so i can remember the name of the thing
alias bat='batcat'
alias bc_sum='paste -sd+ - | bc'
alias bqq='bq query --use_legacy_sql=false --format=pretty'
alias config-nvim='cd ~/.config/nvim/ && vi init.vim && cd -'
alias diff='colordiff'
alias dc='docker-compose'
alias dm='docker-machine'
alias dms='socat tcp-listen:2376,reuseaddr,fork,bind=127.0.0.1 unix-client:/var/run/docker.sock'
alias e='date +"%s"'
alias ep1d="echo (e)\" + 86400\" | bc"
alias ep2d="echo (e)\" + (86400 * 2)\" | bc"
alias ep1m="echo (e)\" + (86400 * 30)\" | bc"
alias ep2m="echo (e)\" + (86400 * 60)\" | bc"
alias ep3m="echo (e)\" + (86400 * 90)\" | bc"
alias em1d="echo (e)\" - 86400\" | bc"
alias em2d="echo (e)\" - (86400 * 2)\" | bc"
alias em1m="echo (e)\" - (86400 * 30)\" | bc"
alias em2m="echo (e)\" - (86400 * 60)\" | bc"
alias em3m="echo (e)\" - (86400 * 90)\" | bc"
alias fd="fdfind"
alias glab_base="perl -i -pe 's/(?<=glab-resolved = base:)code\///g' .git/config" # run in base of repo
alias gsw_main="gsw main 2>/dev/null; gsw master 2>/dev/null"
set GREP_BREW_DIR (brew --prefix grep)
if test -f $GREP_BREW_DIR/bin/grep
  alias grep=$GREP_BREW_DIR/bin/grep
else if test -f $GREP_BREW_DIR/bin/ggrep
  alias grep=$GREP_BREW_DIR/bin/ggrep
end
alias h='history'
alias hs='numfmt --to=iec-i --suffix=B --format="%.3f"' # human size output
alias lg='lazygit'
alias l='ls'
alias ll='ls -al'
alias lll='find . | grep'
alias ls='gls --color=auto --group-directories-first'
alias mamba='/home/conor.boyd/miniforge3/bin/mamba'
alias n='nb'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
set PYTHON_BREW_DIR (brew --prefix python)
# alias python="$PYTHON_BREW_DIR/bin/python3"
# alias pip="$PYTHON_BREW_DIR/bin/pip3"
alias profile3.11='python3.11 -m cProfile -o output.profile' # then run snakeviz on the output
alias pyenv='/home/linuxbrew/.linuxbrew/bin/pyenv'
alias ranger='pipx run --spec ranger-fm ranger' # install with same command
alias r='pipx run --spec ranger-fm ranger' # install with same command
alias t='tree -C'
alias ttfb='curl -s -o /dev/null -w "{ \"connect\": %{time_connect}, \"ttfb\": %{time_starttransfer}, \"total\": %{time_total} }\n"'
alias vd='visidata'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias ww5='watch -n 5 -d'
alias ww10='watch -n 10 -d'
