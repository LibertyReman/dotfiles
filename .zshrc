autoload -Uz compinit && compinit   # 補完機能を有効にして実行する

setopt no_beep                      # ビープ音の停止
setopt nolistbeep                   # ビープ音の停止(補完時)
setopt auto_cd                      # cd なしでもディレクトリ移動
setopt auto_pushd                   # cd -[TAB] で以前移動したディレクトリを表示
setopt pushd_ignore_dups            # 同じものをpushdに登録しない
setopt list_packed                  # 補完リストの表示間隔を狭くする
setopt no_flow_control              # Ctrl+sのロック, Ctrl+qのロック解除を無効にする
setopt share_history                # 他のzshで履歴を共有する
setopt inc_append_history           # 即座に履歴を保存する
setopt hist_ignore_dups             # 直前と同じコマンドは履歴に追加しない
setopt hist_ignore_all_dups         # 同じコマンドを履歴に残さない
setopt hist_ignore_space            # スペースから始まるコマンド行は履歴に残さない
setopt hist_reduce_blanks           # 履歴に保存するときに余分なスペースを削除する

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'     # 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*:default' menu select=2            # 補完侯補をアローキーから選択可能にする
zstyle ':completion:*' format '%B%U%F{yellow}%d%f%u%b'  # 補完時のメッセージの表示設定
zstyle ':completion:*' group-name ''                    # 補完時リストを項目毎にグループ化する
zstyle ':completion:*' list-colors 'di=01;34' 'ln=01;36' 'so=32' 'ex=32' 'bd=46;34' 'cd=43;34' # 補完候補に色を付ける。

export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
export LSCOLORS=ExGxcxdxcxegedabagacad  # ls 色設定(Mac用)
export GREP_COLOR="30;43"               # grep 色設定
export EDITOR=/usr/bin/vim              # デフォルトエディタをvimに設定
export HOMEBREW_NO_AUTO_UPDATE=1        # brew install時にbrew updateが行われないようにする

bindkey \^U backward-kill-line          # ctrl-uで行頭まで削除を有効にする(Mac用)

alias l='ls -1tr --color=auto -F'
alias e='exit'
alias o='open .'
alias cl='clear'
alias ls='ls -G -F'
alias ..='cd ..'
alias vim='vim -p'
alias Note='vim -p ~/Documents/Memo.txt'
alias cgrep='grep --color=always -n'
alias mkdir='mkdir -p'
alias DateMkdir='date +%Y%m%d | xargs mkdir'
alias gs='git status'
alias ga='git add'
alias ga.='git add .'
alias gd='git diff --ws-error-highlight=new,old'
alias gda='git diff --ws-error-highlight=new,old --cached'
alias gl='git lg'
alias gls='git lg -n8'
alias gla='git lga'
alias glas='git lga -n12'
alias glp='git log -p'

function cd(){
    builtin cd "$@" && l
}
function gc(){
    git commit -m "$*"
}
function gdc(){
    git show "$@"
}
function gdcs(){
    git show --name-status "$1"
}
function CalcDate(){
    if [[ $# -eq 1 ]]; then
        tmp=`date "+%Y%m%d"`
        expr \( `date -j -f "%Y%m%d" "$1" "+%s"` - `date -j -f "%Y%m%d" "$tmp" "+%s"` \) \/ 86400
    elif [[ $# -eq 2 ]]; then
        expr \( `date -j -f "%Y%m%d" "$2" "+%s"` - `date -j -f "%Y%m%d" "$1" "+%s"` \) \/ 86400
    else
        echo "ARGUMENTS ERROR "
        echo "  USAGE: $ Calc_date newer_date "
        echo "  USAGE: $ Calc_date older_date newer_date "
    fi
}
# Powerline settings
function powerline_precmd() { PS1="

$(~/powerline-shell.py --shell zsh $? 2> /dev/null)
%F{12}`LC_ALL=C date | awk '{printf "%s %s.%s %s",$1,$2,$3,$4}' | sed "s/...$//g"`%f%F{2} $ %f"
}
function install_powerline_precmd() {
    for s in "${precmd_functions[@]}"; do
        if [ "$s" = "powerline_precmd" ]; then
            return
        fi
    done
    precmd_functions+=(powerline_precmd)
}
install_powerline_precmd


