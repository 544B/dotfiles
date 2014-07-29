#    _____    _
#   |__  /___| |__
#     / // __| '_ \
#    / /_\__ \ | | |
#   /____|___/_| |_|
#=======================
# [ Base_Setting ] {{{
#
export LESSCHARSET=utf-8
export LANG=ja_JP.UTF-8
export OUTPUT_CHARSET=utf-8
export LC___MESSAGES=c

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.tmux/bin:$PATH"
export PATH="$HOME/.tmux/plugins/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

export BROWSER=w3m
export EDITOR=vim

bindkey -v
autoload colors; colors
# }}}

# [ Prompt_Setting ] {{{
# ======================
setopt prompt_subst
PROMPT="%(?.%{$fg[green]%}.%{$fg[red]%})%(?!\(*'A'%)/!\(#'A'%)/)%{${reset_color}%} { "
PROMPT2='%{$fg[blue]$bg[black]%} [%n] %{${reset_color}%}>'
RPROMPT="%{$fg[blue]$bg[black]%} [ %~ ] %{${reset_color}%} "
SPROMPT="%{$fg[gray]%}%{$suggest%}( ',_>'%) { やれやれ、%{$fg[yellow]%} %B%r%b% %{$fg[gray]%} かね? )%{${reset_color}%}
%{$fg[blue]%}<(;'A'%)> %{${reset_color}%}{ そう!%{$fg[blue]%}(y)%{${reset_color}%}, 違う!%{$fg[red]%}(n)%{${reset_color}%} : "

# commandLine_stac
show_buffer_stack() {
				POSTDISPLAY="
				(*'x') { $LBUFFER )"
				zle push-line
}
zle -N show_buffer_stack
bindkey "^[q" show_buffer_stack
# }}}

# [ Option_Setting ] {{{
setopt no_beep
setopt auto_cd
setopt auto_pushd
setopt correct
setopt magic_equal_subst
# }}}

# [ History_Setting ] {{{
HISTFILE=~/.zsh/.zhistory
HISTSIZE=100000
SAVEHIST=100000
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する
# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
# すべてのヒストリを表示する
function history-all { history -E 1 }
# }}}

# [ ListColor_Setting ] {{{
export CLICOLOR=true
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors \
'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
# }}}

# [ Alias_Setting ] {{{
# =====================
alias v='vim'
alias gvim='open -a MacVim'
# alias vim='/usr/local/Cellar/vim/HEAD/bin/vim'
# jalias pf='pyful'
# alias rm='trash-put'
# alias cal='/usr/local/bin/ghcal/ghcal'
alias o='open .'
alias cp='cp -i'
alias mv='mv -i'
alias df='df -H'
alias tree='tree -NC'
alias treee='tree -NC | less -R'
alias ls='ls -FG'
alias rerc='source ~/.zshrc'
alias remem='$ du -sx / &> /dev/null & sleep 25 && kill $!'
alias path='pwd | pbcopy'
alias -g C='| pbcopy'
function cdls() {
\cd $1; ls;}
alias cd='cdls'
alias qp='qlmanage -p "$@" >& /dev/null'
#}}}

## [ fu + z ] {{{
## ==============
## auto-fu.zsh
#{ . ~/.zsh/auto-fu; auto-fu-install; }
#zstyle ':completion:*' completer _oldlist _complete
#zstyle ':auto-fu:highlight' input fg=white
#zstyle ':auto-fu:highlight' completion fg=black,bold
#zstyle ':auto-fu:highlight' completion/one fg=white,bold,underline
#zstyle ':auto-fu:var' postdisplay $'\n( \',_>`) { ふぅ。。。 )'
#zstyle ':auto-fu:var' track-keymap-skip opp
#zle-line-init () {auto-fu-init;}; zle -N zle-line-init
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない
#setopt   auto_list auto_param_slash list_packed rec_exact
#zstyle ':completion:*' menu select
#zstyle ':completion:*' format '%F{white}%d%f'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#zstyle ':completion:*' keep-prefix
#zstyle ':completion:*' completer _oldlist _complete _match _ignored \
#_approximate _list _history
#autoload -U compinit
#compinit -u -d "~/zsh/.zcopmdump"
#unsetopt sh_wordsplit
#unsetopt list_beep
#zle -N zle-keymap-select auto-fu-zle-keymap-select
#bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
#
## z
##_Z_CMD=j
##source ~/.zsh/z.sh
##precmd() {
##				  _z --add "$(pwd -P)"
##	}
## }}}


# [ Start_TMUX ] {{{
# ==================
# is_tmux_runnning() {
# 	[ ! -z "$TMUX" ]
# }
# is_screen_or_tmux_running() {
# 	is_tmux_runnning
# }
# shell_has_started_interactively() {
# 	[ ! -z "$PS1" ]
# }
# resolve_alias() {
# 	cmd="$1"
# 	while \
# 		whence "$cmd" >/dev/null 2>/dev/null \
# 		&& [ "$(whence "$cmd")" != "$cmd" ]
# do
# 	cmd=$(whence "$cmd")
# done
# echo "$cmd"
# }
# if ! is_screen_or_tmux_running && shell_has_started_interactively; then
# 	for cmd in tmux tscreen screen; do
# 		if whence $cmd >/dev/null 2>/dev/null; then
# 			$(resolve_alias "$cmd")
# 			break
# 		fi
# 	done
# fi
# figlet lpc://www.com
# #}}}

# [ Web_Search ] {{{
# =====================
# function web_search {
# local url=$1       && shift
# local delimiter=$1 && shift
# local prefix=$1    && shift
# local query
#
# while [ -n "$1" ]; do
# 				if [ -n "$query" ]; then
# 								query="${query}${delimiter}${prefix}$1"
# 				else
# 								query="${prefix}$1"
# 				fi
# 				shift
# done
#
# w3m "${url}${query}"
# }
# function ggl () {
#   web_search "https://www.google.co.jp/search?&q=" "+" "" $*
# }
# function wiki () {
#   web_search "http://ja.wikipedia.org/w/index.php?search=" "+" "" $*
# }
# }}}

###-begin-npm-completion-###{{{
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#
COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###}}}
# [[ -s /Users/staffmbp2011/.tmuxinator/scripts/tmuxinator ]] && source /Users/staffmbp2011/.tmuxinator/scripts/tmuxinator
