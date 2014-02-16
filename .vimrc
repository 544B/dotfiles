" ***********************************
"       __     ___
"       \ \   / (_)_ __ ___
"        \ \ / /| | '_ ` _ \
"         \ V / | | | | | | |
"          \_/  |_|_| |_| |_|
" ***********************************
" [ 1. Characterset     ] {{{
set nocompatible
filetype off
set fileformats=unix,dos,mac
set fileencoding=utf-8
set fileencodings=utf-8,sjis,japan,iso-2022-jp
" }}}
" [ 2. Backup,Swap,info ] {{{
set backupdir=~/.vim/files/BAK
set directory=~/.vim/files/SWP
set viminfo='50,\"1000,:0,n~/.vim/files/.viminfo

" バッファの一覧・移動・削除。QuickBuf使うまでもないときに
"nnoremap bb :b#<CR>
nnoremap bp :bprevious<CR>
nnoremap bn :bnext<CR>
nnoremap bd :bdelete<CR>
" 「最後に編集したテキスト」を選択するキーマップ
nnoremap gc '[v']
vnoremap gc :<C-u>normal gc<CR>
onoremap gc :<C-u>normal gc<CR>
" 表示中のバッファをVimスクリプトとみなして再読み込み
nnoremap <Space>r :<C-u>execute "source " expand("%:p")<CR>

" vimrc
" edit "_vimrc", "_gvimrc"
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>
" vimrcとgvimrcを再読み込み
nnoremap <Space>v :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
" }}}
" [ 3. Plugin List      ] {{{
"------------------------------------------------
" Plugin_Bundle
" - help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"------------------------------------------------
if has('vim_starting')
	set nocompatible
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

" install plugin
NeoBundleFetch 'Shougo/neobundle.vim'

" Plugin List ========================================================
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'

NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

" HTML ---------------------------------------------------------------
NeoBundle 'hokaccha/vim-html5validator'			" Validate html5
NeoBundle 'mattn/emmet-vim'						" Emmet for Vim
NeoBundle 'h1mesuke/vim-alignta'				" Text Formating
NeoBundle 'surround.vim'						" Wrap Word
NeoBundle 'Valloric/MatchTagAlways'			" MatchTag HighLight
NeoBundle 'matchit.zip'							" HTML Tag Jump
NeoBundle 'othree/html5.vim'					" Syntax html5
NeoBundle 'digitaltoad/vim-jade'				" jade Syntax

" CSS ----------------------------------------------------------------
NeoBundle 'miripiruni/CSScomb-for-Vim.git'		" Sourt CSS Propaty
NeoBundle 'css_color.vim'						" HEX Color Preview
NeoBundle 'Sass'								" Syntax Sass
NeoBundle 'cakebaker/scss-syntax.vim'			" Syntax scss
NeoBundle 'hail2u/vim-css3-syntax'				" Syntax css3

" Javascript ---------------------------------------------------------
NeoBundle 'basyura/jslint.vim'					" Validate jslint
NeoBundle 'pangloss/vim-javascript'				" JavascriptIndnt
NeoBundle 'JavaScript-syntax'					" Syntax Javascript
NeoBundle 'kchmck/vim-coffee-script'			" Syntax CoffeeScript
NeoBundle 'mklabs/vim-backbone'					" Syntax Backbone

" Other --------------------------------------------------------------
NeoBundle 'sakuraiyuta/commentout.vim'			" Toggle CommentOut
NeoBundle 'scrooloose/syntastic'				" SourceCode Validation
NeoBundle 'kana/vim-textobj-user'				" UserSet TextObj
NeoBundle 'sjl/gundo.vim'						" Undo Log
NeoBundle 'terryma/vim-multiple-cursors'		" Multi Cursor
NeoBundle 'kana/vim-smartinput'					" ()''{} OneSet Input
NeoBundle 'Lokaltog/vim-easymotion'				" Jump to Some Key
NeoBundle 'nathanaelkane/vim-indent-guides'		" IndentGuide
NeoBundle 'itchyny/lightline.vim'				" StatusLine Custom
NeoBundle 'YankRing.vim'						" Yank log
NeoBundle 'sudo.vim'							" sudo Write
NeoBundle 'L9'									" VimScriptLibrarry
NeoBundle 'QuickBuf'							" BufList
NeoBundle 'Quich-Filter'						" Search to Fliltaring
NeoBundle 'open-browser.vim'					" Open Browser UnderCursorLink
NeoBundle 'plasticboy/vim-markdown'				" MarkDown
" ToDo
" NeoBundle 'fuzzyjump.vim'						move to keyboard
" NeoBundle 'clever-f.vim'						move to 'f'

" colorscheme --------------------------------------------------------
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
" ====================================================================
filetype plugin indent on
filetype indent on

" Installation check.
NeoBundleCheck
" }}}
" [ 4. Plugins Setting  ] {{{
" matchit.vim: {{{
" ******************************************************
source $VIMRUNTIME/macros/matchit.vim
"}}}
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" vimshell {{{
" -
" ******************************************************
" ,is: シェルを起動
nnoremap <silent> ,is :VimShell<CR>
" ,ipy: pythonを非同期で起動
nnoremap <silent> ,irh :VimShell iexe rhino<CR>
"nnoremap <silent> ,irh :VimShellInteractive rhino<CR>
" ,irb: irbを非同期で起動
"nnoremap <silent> ,irb :VimShellInteractive irb<CR>
" ,ss: 非同期で開いたインタプリタに現在の行を評価させる
"vmap <silent> ,ss :VimShellSendString<CR>
" 選択中に,ss: 非同期で開いたインタプリタに選択行を評価させる
"nnoremap <silent> ,ss <S-v>:VimShellSendString<CR>
"}}}
" vim-smartinput: {{{
" -
" ******************************************************
" for `ruby`
"call smartinput#map_to_trigger('i', '#', '#', '#')
"call smartinput#define_rule({
"\   'at': '\%#',
"\   'char': '#',
"\   'input': '#{}<Left>',
"\   'filetype': ['ruby'],
"\   'syntax': ['Constant', 'Special'],
"\ })
"}}}
" jslint.vim: {{{
"  - https://github.com/basyura/jslint.vim
"  - :copen -> :cnext ...
" ******************************************************
" augroup jslint
"     autocmd! jslint
"     autocmd FileType javascript call s:javascript_filetype_settings()
" augroup END
"
" function! s:javascript_filetype_settings()
"   autocmd BufLeave     <buffer> call jslint#clear()
"   autocmd BufWritePost <buffer> call jslint#check()
"   autocmd CursorMoved  <buffer> call jslint#message()
" endfunction
"
"}}}
" syntastic: {{{
" - http://d.hatena.ne.jp/heavenshell/20120106/1325866974
" ******************************************************
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': []}
"}}}
" html5.vim: {{{
" - https://github.com/othree/html5.vim
" ******************************************************
let g:html5_event_handler_attributes_complete = 1
let g:html5_rdfa_attributes_complete = 1
let g:html5_microdata_attributes_complete = 1
let g:html5_aria_attributes_complete = 1
"}}}
" QuickBuf: {{{
" - https://github.com/vim-scripts/QuickBuf
" ******************************************************
let g:qb_hotkey = "<F2>"
"}}}
" vim-indent-guides: {{{
" - https://github.com/nathanaelkane/vim-indent-guides
" ******************************************************
"set ts=4 sw=4
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#333339 guifg=#404040 ctermbg=2 ctermfg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#292930 guifg=#333333 ctermbg=4 ctermfg=3
"let g:indent_guides_color_change_percent = 30
"}}}
" open-browser: {{{
" - https://gist.github.com/3668363
" ******************************************************
" カーソル下のURLをブラウザで開く
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
" ググる
nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>
"}}}
" vim-easymotion: {{{
" -
" ******************************************************
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key="<space>"
let g:EasyMotion_grouping=1
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue
" }}}
" vimfiler {{{
" -
" ******************************************************
nnoremap ,. :VimFiler -buffer-name=explorer -split -winwidth=35 -toggle -no-quit<Cr>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
endfunction

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', my_action)

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', my_action)
" }}}
" YankRing.vim {{{
" -
" ******************************************************
nnoremap <C-P> :<C-u>YRShow<cr>
let g:yankring_history_dir = "~/.vim/files/YNK"
" }}}
" emmet: {{{
" ******************************************************
imap <C-E> <C-Y>,
let g:user_zen_leader_key = '<C-Y>'
let g:user_zen_settings = {
\	'lang': 'ja',
\	'html': {
\		'indentation': '',
\		'snippets': {
\			'script:jq': "<script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js\" type=\"text/javascript\"></script>",
\		},
\	},
\	'css': {
\		'filters': 'fc'
\	},
\}
" }}}
" sass: {{{
" ******************************************************
let g:sass_compile_auto   = 1
let g:sass_compile_cdloop = 5
let g:sass_compile_cssdir = ['css', 'stylesheet']
let g:sass_compile_file   = ['scss', 'sass']
let g:sass_started_dirs   = []
autocmd FileType scss,less,sass  setlocal sw=2 sts=2 ts=2 et
" }}}
" lightline: {{{
" -
" ******************************************************
let g:lightline = {
			\ 'colorscheme': 'jellybeans',
			\ 'active': {
			\   'right': [ [ 'syntastic', 'lineinfo' ],
			\              [ 'percent' ],
			\              [ 'fileformat', 'fileencoding', 'filetype' ] ]
			\ },
			\ 'component_expand': {
			\   'syntastic': 'SyntasticStatuslineFlag',
			\ },
			\ 'component_type': {
			\   'syntastic': 'error',
			\ }
			\ }
let g:syntastic_mode_map = { 'mode': 'passive' }
augroup AutoSyntastic
	autocmd!
	autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
	SyntasticCheck
	call lightline#update()
endfunction
"}}}
" Gundo: {{{
" - http://uu59.blog103.fc2.com/blog-entry-7.html
" ******************************************************
nnoremap U :<C-u>GundoToggle<cr>
let g:gundo_auto_preview = 0
"}}}
" Matchtagalways: {{{
" - https://github.com/Valloric/MatchTagAlways
" ******************************************************
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
	\ 'php' : 1,
    \}
let g:mta_use_matchparen_group = 0
highlight MatchTag ctermfg=black ctermbg=lightgreen guifg=black guibg=lightgreen
"}}}
" }}}
" [ 5. Display          ] {{{
set number
set ruler
set cmdheight=4
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%v%8p
set title
set linespace=1
set showcmd
set wildmenu
set wildmode=list:longest,full

" カラー設定:
set t_Co=256
syntax on
colorscheme hybrid
cnoremap clr Unite -auto-preview colorscheme

set statusline=%m\ %<[%{expand('%:p:h')}/%{expand('%:p:t')}]%=\ [%{&fenc!=''?&fenc:&enc}][%{&ff}][%3c,%3l/%3L:%3p%%]
let g:netrw_liststyle=3
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup END
set cursorcolumn
set cursorline
hi clear CursoeColumn
hi clear CursorLine
hi CursorLine gui=underline
highlight CursorColumn ctermbg=black guibg=black
highlight CursorLine ctermbg=black guibg=black
set fillchars=vert:\|
set foldmethod=marker
hi Folded gui=bold term=standout ctermfg=Blue guibg=blue guifg=black
hi FoldColumn gui=bold term=standout ctermfg=Blue guibg=Grey guifg=black
" tab & line end string display on
set list

" listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>-,trail:_,extends:<
"set listchars=eol:$,tab:>\ ,extends:<
"set lcs=tab:>-,eol:$,trail:_,extends:\
"set listchars=tab:>-
"scriptencoding utf-8
"set listchars=tab:≫\ ,trail:-,eol:$

set showmatch
set backspace=indent,eol,start
set pastetoggle=<F12>
set guioptions+=a
set guioptions-=b
set guioptions+=c
set guioptions-=i
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
command! -nargs=1 -bang -bar -complete=file Rename sav<bang> <args> | call delete(expand('#:p'))

" tab
set tabstop=4
"set softtabstop=4
"?????
"set expandtab
set smarttab
set shiftwidth=4
set shiftround
set nowrap

" indent
" 新しい行のインデントを現在行と同じにする
set autoindent
set cindent
" 自動的に括弧を見てインデントしてくれる機能を使わない
set nosmartindent


" Enable folding.
set foldenable
set foldmethod=marker
set foldcolumn=5

" diff
set diffopt=filler,vertical

" window
set splitbelow
set splitright

" ウィンドウ分割時にウィンドウサイズを調節する。Shiftキー ＋ 矢印キー
nnoremap <silent> <S-Left>  :5wincmd <<CR>
nnoremap <silent> <S-Right> :5wincmd ><CR>
nnoremap <silent> <S-Up>    :5wincmd -<CR>
nnoremap <silent> <S-Down>  :5wincmd +<CR>

noremap gn :tabnew<CR>
noremap gh gT
noremap gl gt
set showtabline=2
set guioptions-=e
" set tabline=%!MakeTabLine()
" function! MakeTabLine()
" 	let titles = map(range(1, tabpagenr('$')), 's:tabpage_label(v:val)')
" 	let sep = '|'
" 	let tabpages = join(titles, sep) . sep . '%#TabLineFill#%T'
" 	let info = ''
" 	if exists('*FoldCCnavi')
" 		let info .= '%#TabLineInfo#'.substitute(FoldCCnavi()[-60:],'\s>\s','%#TabLineFill#> %#TabLineInfo#','g').'%0* '
" 	endif
" 	let info .= '['.fnamemodify(getcwd(), ":~") . ']'
" 	return tabpages . '%=' . info
" endfunction
"
" function! s:tabpage_label(tabpagenr)
" 	let title = gettabvar(a:tabpagenr, 'title')
" 	if title !=# ''
" 			return title
" 	endif
" 	let bufnrs = tabpagebuflist(a:tabpagenr)
" 	let hi = a:tabpagenr is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'
" 	let no = len(bufnrs)
" 	if no is 1
" 		let no = ''
" 	endif
" 	let mod = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ? '+' : ''
" 	let nomod = (no . mod) ==# '' ? '' : '['.no.mod.']'
" 	let curbufnr = bufnrs[tabpagewinnr(a:tabpagenr) - 1]
" 	let fname = fnamemodify(bufname(curbufnr), ':t')
" 	let fname = fname is '' ? 'No title' : fname
" 	let label = fname . nomod
" 	return '%' . a:tabpagenr . 'T' . hi .a:tabpagenr.': '. curbufnr.'-' . label . '%T%#TabLineFill#'
" endfunction
"
" hi TabLine     term=reverse ctermfg=black ctermbg=DarkGray guifg=black guibg=red
" hi TabLineSel  term=bold cterm=bold,underline ctermfg=blue ctermbg=black guifg=black guibg=red
" hi TabLineFill ctermfg=white ctermbg=DarkGray guifg=black guibg=blue
" hi TabLineInfo term=reverse ctermfg=Black ctermbg=LightBlue guifg=black guibg=blue
" }}}
" [ 6. Edit             ] {{{
" search
set ignorecase
set wrapscan
set hlsearch
" インクリメンタルサーチを行う
set incsearch
set grepprg=grep\ -nH
" 検索結果ハイライト解除
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap  <C-c><C-c> :<C-u>nohlsearch<cr><Esc>
" 検索結果に移動した時、その位置を画面の中央に変更
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap <silent> <S-Left>  :5wincmd <<CR>
nnoremap <silent> <S-Right> :5wincmd ><CR>
nnoremap <silent> <S-Up>    :5wincmd -<CR>
nnoremap <silent> <S-Down>  :5wincmd +<CR>
set scrolloff=3
" 検索時、「/」の入力をエスケープする
"cnoremap / getcmdtype() == '/' ? '\/': '/'

" for USkey
nnoremap ; :
" nnoremap : ;
"
let mapleader = ","

inoremap jj <ESC>
onoremap jj <ESC>

inoremap j<Space> j
onoremap j<Space> j
imap <C-h> <Esc>
imap <C-j> OB
imap <C-k> OA
imap <C-l> OC
" jkでのカーソルを表示行単位で移動できるように変更
noremap j gj
noremap k gk
noremap gj j
noremap gk k
" <CR>
inoremap <C-CR> <ESC>o
inoremap <S-CR> <ESC>o
inoremap <C-S-CR> <ESC>O


" Encode
command! -bang -nargs=? Utf8 edit<bang> ++enc=utf-8 <args>
command! -bang -nargs=? Sjis edit<bang> ++enc=sjis <args>
command! -bang -nargs=? Euc edit<bang> ++enc=euc-jp <args>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <Leader><Leader> ~/

" 現在のファイルをブラウザで開く
noremap <F12> :silent ! start chrome.exe "%:p"<CR>
noremap <Leader>0 :silent ! start firefox.exe "%:p"<CR>
noremap <Leader>9 :silent ! start IEXPLORE.EXE "%:p"<CR>
noremap <Leader>8 :silent ! start Safari.exe "%:p"<CR>

" help shortcut key
nnoremap <C-h>  :<C-u>help<Space>

" 日本語入力切り替え
" 挿入モード終了時にIME状態を保存しない
inoremap <silent> <ESC> <ESC>
inoremap <silent> <C-[> <ESC>

" 「日本語入力固定モード」切替
inoremap <silent> <C-j> <C-^>

" 外部grep
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nH

" 現在のファイルをブラウザで開く
noremap <F12> :silent ! start chrome.app "%:p"<CR>
noremap <Leader>0 :silent ! start firefox.exe "%:p"<CR>
noremap <Leader>9 :silent ! start IEXPLORE.EXE "%:p"<CR>
noremap <Leader>8 :silent ! start Safari.exe "%:p"<CR>
" }}}
" [ 7. For CUI          ] {{{
set ttyfast
set mouse=a
set guioptions+=a
set ttymouse=xterm2
inoremap <Esc> <Esc>gg`]
if has('multi_byte_ime') || has('xim')
	hi Cursor ctermfg=black ctermbg=red guifg=black guibg=red
	hi CursorIM ctermfg=black ctermbg=blue guifg=black guibg=blue
endif

if &term =~ "tmux"
  let &t_SI = "\eP\e]50;CursorShape=1\x7\e\\"
  let &t_EI = "\eP\e]50;CursorShape=0\x7\e\\"
elseif &term =~ "xterm"
  let &t_SI = "\e]50;CursorShape=1\x7"
  let &t_EI = "\e]50;CursorShape=0\x7"
endif
let g:hi_insert = 'highlight StatusLine guifg=blue guibg=black gui=none ctermfg=white ctermbg=black cterm=none'

if has('syntax')
	augroup InsertHook
		autocmd!
		autocmd InsertEnter * call s:StatusLine('Enter')
		autocmd InsertLeave * call s:StatusLine('Leave')
	augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
	if a:mode == 'Enter'
		silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
		silent exec g:hi_insert
	else
		highlight clear StatusLine
		silent exec s:slhlcmd
	endif
endfunction

function! s:GetHighlight(hi)
	redir => hl
	exec 'highlight '.a:hi
	redir END
	let hl = substitute(hl, '[\r\n]', '', 'g')
	let hl = substitute(hl, 'xxx', '', '')
	return hl
endfunction
" }}}
" [ 8. Script           ] {{{
" HTML Key Mappings for Typing Character Codes: {{{
"
" |--------------------------------------------------------------------
" |Keys     |Insert   |For  |Comment
" |---------|---------|-----|-------------------------------------------
" |\&       |&amp;    |&    |ampersand
" |\<       |&lt;     |<    |less-than sign
" |\>       |&gt;     |>    |greater-than sign
" |\.       |&middot; |・   |middle dot (decimal point)
" |\?       |&#8212;  |?    |em-dash
" |\2       |&#8220;  |“    |open curved double quote
" |\"       |&#8221;  |”    |close curved double quote
" |\`       |&#8216;  |‘    |open curved single quote
" |\'       |&#8217;  |’    |close curved single quote (apostrophe)
" |\`       |`        |`    |OS-dependent open single quote
" |\'       |'        |'    |OS-dependent close or vertical single quote
" |\<Space> |&nbsp;   |     |non-breaking space
" |---------------------------------------------------------------------
"
" > http://www.stripey.com/vim/html.html
"
"
autocmd BufEnter * if &filetype == "html" | call MapHTMLKeys() | endif
function! MapHTMLKeys(...)
  if a:0 == 0 || a:1 != 0
    inoremap \\ \
    inoremap \& &amp;
    inoremap \< &lt;
    inoremap \> &gt;
    inoremap \. ・
    inoremap \- &#8212;
    inoremap \<Space> &nbsp;
    inoremap \` &#8216;
    inoremap \' &#8217;
    inoremap \2 &#8220;
    inoremap \" &#8221;
    autocmd! BufLeave * call MapHTMLKeys(0)
  else
    iunmap \\
    iunmap \&
    iunmap \<
    iunmap \>
    iunmap \-
    iunmap \<Space>
    iunmap \`
    iunmap \'
    iunmap \2
    iunmap \"
    autocmd! BufLeave *
  endif " test for mapping/unmapping
endfunction " MapHTMLKeys()
"}}}
" Like CdCurrent: {{{
"  - http://vim-users.jp/2009/09/hack69/
"  - :CD
"
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction
"}}}
" copy&paste: {{{
nmap _ :.w !nkf -Ws\|pdcopy<CR><CR>
vmap _ :w !nkf -Ws\|pdcopy<CR><CR>
" copy to clipboard
if has("unix") && match(system("uname"),'Darwin') != -1 " mac
  " http://www.mail-archive.com/vim-latex-devel@lists.sourceforge.net/msg00773.html
  nnoremap fc :call system("pbcopy", @")<CR>
  nnoremap fp :r! pbpaste<CR>
elseif has('win32unix') " cygwin
  nnoremap fc :call system("putclip", @")<CR>
  nnoremap fp :r! getclip<CR>
endif

set clipboard+=unnamed
set clipboard=unnamed
set lazyredraw

if filereadable($VIM . '/vimrc') && filereadable($VIM . '/ViMrC')
  set tags=./tags,tags
endif

if !has('gui_running') && has('xterm_clipboard')
  set clipboard=exclude:cons\\\|linux\\\|cygwin\\\|rxvt\\\|screen
endif
if has('mac')
  set iskeyword=@,48-57,_,128-167,224-235
endif
"}}}
" augroups: {{{
"
" For noexpandtab
augroup MyAutoCmd
    " reset autocmd-list
    autocmd!

    " If open new-buffer, set expandtab
    "autocmd BufNewFile,BufRead * set expandtab

    " go to file!
    autocmd FileType html,xhtml setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/

    " Custom folding
    "autocmd BufEnter * if &filetype == "javascript" | set foldmarker={,} | set foldlevel=3 | set foldcolumn=7 | endif
    "
    " for Sass.vim
    autocmd BufRead,BufNewFile *.sass setfiletype sass

	" grep
	autocmd QuickFixCmdPost vimgrep cw
	autocmd QuickFixCmdPost grep cw

	" jQuery Mobile snippets
	"autocmd BufNewFile *.html inoremap data<TAB> <div data-=""></div><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

	" JavaScript dictionaries
	autocmd FileType javascript :set dictionary=$HOME/vimfiles/dict/javascript.dict,$HOME/vimfiles/dict/jQuery.dict

	" Sass interporation snippets
	"autocmd filetype scss inoremap ip<TAB> #{}<Left>

	" xml, html insert end tag
	autocmd FileType html,xhtml,xml inoremap <buffer> </ </<C-x><C-o>

	" insert "<br />"
	autocmd FileType html,xhtml inoremap <S-CR> <br /><CR>

	" Disable Indent for HTML file
	autocmd FileType html,xhtml set indentexpr&

	" delete whitespace
	autocmd BufWritePre * :%s/\s\+$//e

augroup END

" .vimrc auto load
if !has('gui_running') && !(has('win32') || has('win64'))
    " .vimrcの再読込時にも色が変化するようにする
    autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
else
    " .vimrcの再読込時にも色が変化するようにする
    autocmd MyAutoCmd BufWritePost $MYVIMRC source $MYVIMRC |
				\if has('gui_running') | source $MYGVIMRC
    autocmd MyAutoCmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
endif"
"}}}
" }}}
