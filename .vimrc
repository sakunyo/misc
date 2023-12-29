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
Plug 'previm/previm'

Plug 'Quramy/tsuquyomi'

Plug 'Shougo/denite.nvim'

Plug 'Shougo/deoplete.nvim'

Plug 'airblade/vim-gitgutter'

Plug 'altercation/vim-colors-solarized', {
  \ 'do': 'cp plugged/vim-colors-solarized/colors/* ~/.vim/colors/' }

Plug 'bronson/vim-trailing-whitespace'

Plug 'h1mesuke/vim-alignta'

Plug 'leafgarland/typescript-vim'

Plug 'mattn/emmet-vim'

Plug 'mattn/vim-terminal'

Plug 'mtscout6/syntastic-local-eslint.vim'

Plug 'neovimhaskell/haskell-vim'

Plug 'othree/yajs.vim'

Plug 'rhysd/vim-gfm-syntax'

Plug 'scrooloose/nerdtree'

Plug 'slim-template/vim-slim'

Plug 'thinca/vim-quickrun'

Plug 'thinca/vim-themis'

Plug 'tomtom/tcomment_vim'

Plug 'tpope/vim-surround'

Plug 'tyru/open-browser.vim'

Plug 'vim-syntastic/syntastic'

Plug 'posva/vim-vue'

" spelling @see https://github.com/kamykn/spelunker.vim
Plug 'kamykn/spelunker.vim'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()

"--------------------------------
" STYLE
"--------------------------------
syntax enable

" Colors
hi SpecialKey ctermfg=254 ctermbg=NONE
hi SpaceKey   cterm=underline ctermfg=235

hi clear SpellBad " Spelling Highlight の削除
hi clear SpellCap " Spelling Highlight の削除 キャピタライズなので無視する
hi SpellBad cterm=underline ctermfg=yellow


"--------------------------------
set ambiwidth=double
set autoread                               " 編集ファイルの自動更新
set backup
set backupdir=~/.vim/backup
set cmdheight=1                            " コマンドラインの高さ
set directory=~/.vim/swap
set encoding=utf-8
set expandtab                              " <TAB> => <SPACE>
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set hlsearch                               " 検索結果をハイライトする
set ignorecase                             " 検索で、大文字小文字を区別しない
set laststatus=2                           " ステータスラインを表示する
set lazyredraw                             " 初期値：オフ " スクリプト実行中に画面を描画しない。
set list                                   " 不可視文字を表示する
set listchars=tab:>-,extends:>,precedes:<  " 不可視文字で表示される文字のフォーマットを指定する
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
set spell spelllang=en,cjk

"--------------------------------
" Auto commands
"--------------------------------
autocmd BufRead,BufNew * match SpaceKey / /
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
autocmd BufNewFile,BufRead *.{mjs} set filetype=javascript
autocmd BufNewFile,BufRead *.md setlocal wrap
" autocmd BufWritePre * :%s/\s\+$//ge " It  omments out this line. because problem when git * -p 


"--------------------------------
" FORMATTER
" - jiangmiao/simple-javascript-indenter
"--------------------------------
let g:SimpleJsIndenter_BriefMode = 1


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
let g:syntastic_html_tidy_exec           = 'tidy5' " HTML5 attributes
let g:syntastic_enable_signs             = 1 " エラー行に sign を表示
let g:syntastic_always_populate_loc_list = 0 " location list を常に更新
let g:syntastic_auto_loc_list            = 0 " location list を常に表示
let g:syntastic_check_on_open            = 1 " ファイルを開いた時にチェックを実行する
let g:syntastic_check_on_wq              = 0 " :wq で終了する時もチェックする
let g:syntastic_javascript_checkers      = ['eslint']
let g:syntastic_typescript_checkers      = ['tsuquyomi']


"--------------------------------
" NERDTree
"--------------------------------
let g:NERDTreeWinPos   = "right"
let g:NERDTreeWinSize  = 50
let NERDTreeShowHidden = 1


"--------------------------------
" Prettier
"--------------------------------
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

