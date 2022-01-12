"-------------------------
" Vundle settings
"-------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'gmarik/Vundle.vim'
    Plugin 'itchyny/lightline.vim'
    Plugin 'nathanaelkane/vim-indent-guides'
    Plugin 'airblade/vim-gitgutter'
call vundle#end()
filetype plugin indent on

" lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'path', 'modified' ] ],
      \ },
      \ 'component_function': {
      \   'path': 'Path'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! Path()
    let b = substitute(expand('%:p'), $HOME, '~', '')
    let path_list = split(b,'/')
    if 2 < len(path_list)
        return join([path_list[-3], path_list[-2], path_list[-1]], '  ')
    elseif 0 == len(path_list)
        return "[No Name]"
    else
        return join([path_list[-2], path_list[-1]], '  ')
endfunction

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=darkgray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=239

" vim-gitgutter
augroup vimrc_vim_gitgutter
    autocmd!
    " sign column bg color
    autocmd VimEnter,ColorScheme * hi SignColumn guibg=bg ctermbg=bg
    " sign column color
    autocmd VimEnter,ColorScheme * hi GitGutterAdd             ctermfg=darkgreen ctermbg=236 cterm=bold
    autocmd VimEnter,ColorScheme * hi GitGutterChange          ctermfg=darkgreen ctermbg=236 cterm=bold
    autocmd VimEnter,ColorScheme * hi GitGutterDelete          ctermfg=darkgreen ctermbg=236 cterm=bold
    autocmd VimEnter,ColorScheme * hi GitGutterChangeDelete    ctermfg=darkgreen ctermbg=236 cterm=bold
augroup END



"-------------------------
" Auto save settings
"-------------------------
set autowrite
autocmd CursorHold *  wall
autocmd CursorHoldI *  wall


"-------------------------
" Complement settings
"-------------------------
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
    exec "imap " . k . " " . k . "<C-N><C-P>"
endfor
imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"


"-------------------------
" Color settings
"-------------------------
syntax on
colorscheme molokai

hi String       ctermfg=darkred
hi Include      ctermfg=126
hi Comment      ctermfg=25
hi Structure    ctermfg=2
hi Statement    ctermfg=130
hi Type         ctermfg=2
hi Number       ctermfg=darkred
hi Float        ctermfg=darkred
hi Boolean      ctermfg=darkred
hi cConstant    ctermfg=darkred
hi conditional  ctermfg=130
hi Exception    ctermfg=130
hi SpecialChar  ctermfg=126
hi StorageClass ctermfg=2
hi Repeat       ctermfg=130
hi Visual       ctermbg=235
hi Search       ctermfg=cyan ctermbg=12
hi LineNr       ctermfg=darkgreen
hi WarningMsg   ctermfg=Yellow
hi MatchParen   term=reverse ctermfg=14 ctermbg=12 guifg=#FFFFFF guibg=Cyan

" vimdiff
hi DiffAdd    cterm=bold ctermfg=10 ctermbg=22
hi DiffDelete cterm=bold ctermfg=10 ctermbg=52
hi DiffChange cterm=bold ctermfg=10 ctermbg=17
hi DiffText   cterm=bold ctermfg=10 ctermbg=21


"-------------------------
" Basic settings
"-------------------------
set encoding=utf-8                  " ターミナルに表示される出力エンコーディング
set fileformat=unix                 " 改行フォーマット
set fileformats=unix,mac,dos        " 改行フォーマット自動判別
set clipboard=unnamed,unnamedplus   " OSのクリップボードをレジスタ指定無しでYank, Put出来るように設定
set belloff=all                     " ビープ音無効
set tabpagemax=30                   " vimで開く最大ファイル数
set history=10000                   " コマンドと検索パターンの履歴保存数
set noswapfile                      " スワップファイルを作らない
set nobackup                        " バックアップファイルを作らない
set updatetime=0                    " CursorHold系の更新時間
set showcmd                         " 入力中のコマンドを右下に表示する
set laststatus=2                    " ステータスラインを常に表示
set wildmenu                        " ステータスラインに候補を表示
set wildmode=list:longest           " wildmenuの動作設定
set virtualedit=block               " 矩形ビジュアルモードでフリーカーソルを有効
set whichwrap=b,s,[,],<,>           " 特定キーで行頭行末の回り込みカーソル移動を許可
set scrolloff=16                    " 画面端でのスクロールに余裕を追加
set wrap                            " ウィンドウの幅より長い行は折り返して表示
set linebreak                       " 折り返し表示する時は適切なワード区切りで表示
set showmatch                       " 閉じ括弧が入力された時に対応する括弧を表示
set nrformats-=octal                " <C-a> <C-x>の増減で8進数のオプションを削除
set backspace=indent,eol,start      " <Backspace> の動作設定

set title                           " タイトルを表示
set number                          " 行番号を表示
set mouse=n                         " ノーマルモード時はマウスを有効にする
set hlsearch                        " 検索ワードをハイライト
set incsearch                       " 検索ワードを打ち始めで検索開始
set ignorecase                      " 検索ワードが小文字の場合は大文字小文字を区別なく検索
set smartcase                       " 検索ワードに大文字が含まれている場合は区別して検索
set nowrapscan                      " 検索をファイル末尾まで行ったら再検索しない
set expandtab                       " ソフトタブを使用
"set noexpandtab                    " ハードタブを使用
set tabstop=4                       " <Tab> キーを押した時の空白の数
set shiftwidth=4                    " 自動インデントで使われる空白の数
set softtabstop=4                   " <Tab> の幅として認識する空白の数
set autoindent                      " 改行した時に前の行のインデントを継続
set smarttab                        " 行頭の前で<Tab>を打ち込むと、'shiftwidth' の数空白を挿入
set smartindent                     " 自動インデントを有効
set cindent                         " C言語に特化した自動インデントを有効

" ファイルタイプインデント
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.yaml   setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.yml    setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.html   setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.rb     setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.erb    setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END


"-------------------------
" Keymap settings
"-------------------------
noremap h b
noremap b h
noremap l w
noremap w l
noremap j gj
noremap k gk
noremap J <C-d>
noremap K <C-u>
noremap o 0
noremap e $

nnoremap L gt
nnoremap H gT
nnoremap [[ [[zz
nnoremap ]] ]]zz
nnoremap ; :
nnoremap : ;
nnoremap * *N
nnoremap ' *N
nnoremap O              A<return><ESC>k
nnoremap <return>       i<return><ESC>
nnoremap <tab>          i<tab><ESC>l
nnoremap <space>        i<space><ESC>
nnoremap <backspace>    i<backspace><ESC>l
" 置換モードを無効化
nnoremap R <NOP>
" 上行ペーストを無効化
nnoremap P <NOP>
" 検索のハイライト解除
nnoremap <Esc><Esc> :noh<CR><Esc>
" 全ての行をコピー
nnoremap <C-c> maggVGy'a
" タグ検索
nnoremap t /tags<Enter>
" 区切り線を挿入
nnoremap C 0i------------<ESC>0
" 現在時刻の挿入
nnoremap T <ESC>I<C-R>=strftime("[%Y/%m/%d (%a) %H:%M]")<CR><CR><ESC>
" ノートの挿入
nnoremap <silent> Z <ESC>I<C-R>=strftime("************************************************************\n・  [%Y/%m/%d (%a) %H:%M]")<CR><CR><ESC>ka

" jjでノーマルモード
inoremap jj <Esc>

" ビジュアルモードで選択した部分を検索
vnoremap ' "zy:let @/ = @z<CR>nN


"-------------------------
" Other settings
"-------------------------

" 別ウィンドウでの編集内容を即反映
set autoread
augroup vimrc-checktime
    autocmd!
    autocmd WinEnter * checktime
augroup END

" 前回閉じた行番号でファイルを開く
augroup RegisterLineNo
    au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
                \ exe "normal g`\"" | endif
augroup END

" ファイル保存時に余分な行末の空白を削除
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//ge
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" 行末の半角スペースをハイライト
hi ExtraWhitespace ctermbg=darkred guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" 特定ワードを強調表示
augroup HilightsWords
    autocmd!
    autocmd WinEnter,BufRead,BufNew,Syntax * :silent! call matchadd('Todo', '\(TODO\|todo\|MEMO\|memo\|TAGS\|tags\):')
    autocmd WinEnter,BufRead,BufNew,Syntax * hi Todo term=bold cterm=bold,underline ctermfg=10 ctermbg=22 guibg=#13354A
augroup END

" vimdiff 編集可
if &diff
    set noreadonly
endif


