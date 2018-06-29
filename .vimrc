"--------------------------------
" IMPORTANT: load defaults.vim
"--------------------------------
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim


"--------------------------------
" VIM-PLUG
" TODO: Plugin の非同期読み込み
"--------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'Shougo/denite.nvim'
Plug 'mattn/emmet-vim'
Plug 'mattn/googletranslate-vim'
Plug 'itchyny/landscape.vim'
Plug 'glidenote/memolist.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'tyru/open-browser.vim'
Plug 'kannokanno/previm'
Plug 'vim-syntastic/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'tomtom/tcomment_vim'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'h1mesuke/vim-alignta'
Plug 'kchmck/vim-coffee-script'
Plug 'rhysd/vim-gfm-syntax'
Plug 'airblade/vim-gitgutter'
Plug 'digitaltoad/vim-pug'
Plug 'thinca/vim-quickrun'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-surround'
Plug 'mattn/vim-terminal'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Shougo/vimfiler.vim'
Plug 'othree/yajs.vim'
call plug#end()


"--------------------------------
" STYLE
"--------------------------------
colorscheme landscape
set ambiwidth=double
set autoread                               " 編集ファイルの自動更新
set backup
set backupdir=~/.vim/backup
set cmdheight=2                            " コマンドラインの高さ
set directory=~/.vim/swap
set encoding=utf-8
set expandtab                              " <TAB> => <SPACE>
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set hlsearch                               " 検索結果をハイライトする
set ignorecase                             " 検索で、大文字小文字を区別しない
set laststatus=2                           " ステータスラインを表示する
set lazyredraw                             " 初期値：オフ " スクリプト実行中に画面を描画しない。
set list                                   " 不可視文字を表示する
set listchars=tab:>_,extends:>,precedes:<  " 不可視文字で表示される文字のフォーマットを指定する
set nowrap                                 " 右端で折り返さない
set number                                 " 行番号を表示
set ruler                                  " ルーラー表示
set shiftwidth=2                           " 自動インデントの各段階に使われる空白の数
set showmatch                              " 対応する括弧を表示(ハイライト)する
set showtabline=2                          " 画面タブ行を常に表示
set swapfile
set tabstop=4                              " Tab桁数
set ttyfast
set undodir=~/.vim/undo
set virtualedit+=block
highlight LineNr     ctermfg=208
highlight SpecialKey ctermfg=235
highlight SpaceKey   cterm=underline ctermfg=235


"--------------------------------
" Auto commands
"--------------------------------
autocmd BufRead,BufNew * match SpaceKey / /
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
autocmd BufNewFile,BufRead *.{mjs} set filetype=javascript
autocmd BufWritePre * :%s/\s\+$//ge


"--------------------------------
" FORMATTER
" - jiangmiao/simple-javascript-indenter
"--------------------------------
let g:SimpleJsIndenter_BriefMode = 1


"--------------------------------
" NEOCOMPLETE
" NOTE: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"--------------------------------
let g:acp_enableAtStartup                           = 0
let g:neocomplete#enable_at_startup                 = 1
let g:neocomplete#enable_smart_case                 = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern          = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries   = {
  \ 'default' :  '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' :   $HOME.'/.gosh_completions' }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" Recommended key-mappings.
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Enable omni completion.
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"--------------------------------
" QUICKRUN
" NOTE: https://github.com/thinca/vim-quickrun/
"   Options
"     https://github.com/thinca/vim-quickrun/blob/8d864e7feb7ac9dded84808f76fcb3fcd3ed8ae3/doc/quickrun.jax#L279-L309
"--------------------------------
if !exists('g:quickrun_config')
  let g:quickrun_config = {}
endif
let g:quickrun_config = {
      \ '*': { 'runmode': 'async:remote:vimproc'}}
let g:quickrun_config['typescript'] = {
      \ 'command': 'tsc',
      \ 'exec': ['%c --target ES2018 --module commonjs %o %s', 'node %s:r.js'],
      \ 'tempfile': '%{tempname()}.ts',
      \ 'hook/sweep/files': ['%S:p:r.js']}
let g:quickrun_config['markdown'] = {
      \ 'outputter': 'browser' }


"--------------------------------
" SYNTASTIC
"--------------------------------
let g:syntastic_enable_signs             = 1 " エラー行に sign を表示
let g:syntastic_always_populate_loc_list = 0 " location list を常に更新
let g:syntastic_auto_loc_list            = 0 " location list を常に表示
let g:syntastic_check_on_open            = 1 " ファイルを開いた時にチェックを実行する
let g:syntastic_check_on_wq              = 0 " :wq で終了する時もチェックする
let g:syntastic_javascript_checkers      = ['eslint']
let g:syntastic_typescript_checkers      = ['tsuquyomi']


"--------------------------------
" MEMOlIST
" :MemoNew :MemoList :MemoGrep
"--------------------------------
let g:memolist_memo_suffix = "md"
let g:memolist_path        = $HOME."/Dropbox/reports"


"--------------------------------
" CALENDAR
"--------------------------------
let g:calendar_google_calendar = 1


"--------------------------------
" DENITE
"--------------------------------
" call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
"       \ [
"       \ '.git/',
"       \ 'node_modules/',
"       \ 'vender/',
"       \ 'images/',
"       \ '*.min.*',
"       \ 'img/',
"       \ 'fonts/'])
" call denite#custom#var('file/rec', 'command',
"       \ [
"       \ 'rg',
"       \ '--color',
"       \ 'never',
"       \ '--files'])


