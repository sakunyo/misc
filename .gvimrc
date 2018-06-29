"--------------------------------
" STYLE
"--------------------------------
colorscheme landscape
set antialias                              " font antialias
set cmdheight=2                            " コマンドラインの高さ
set columns=220                            " 横幅
set cursorline                             " カーソル行を強調表示
set ff=unix
set fileencoding=utf8
set foldcolumn=2;
set guioptions+=b
set guioptions-=T                          " ツールバーを削除
set guioptions-=Tm                         " メニューを削除
set lines=64                               " 行数
set list                                   " 不可視文字を表示する
set listchars=tab:>_,extends:>,precedes:<  " 不可視文字で表示される文字のフォーマットを指定する
set previewheight=5                        " プレビューウィンドウの高さ
set splitbelow                             " 横分割したら新しいウィンドウは下に
set splitright                             " 縦分割したら新しいウィンドウは右に
set title                                  " ウィンドウのタイトルを書き換える
set virtualedit+=block
set visualbell

highlight CursorLine gui=NONE guifg=NONE ctermbg=black
highlight LineNr     ctermfg=208
highlight SpecialKey ctermfg=235
highlight SpaceKey   ctermbg=0   cterm=underline ctermfg=235


"--------------------------------
" Auto commands
"--------------------------------
autocmd BufRead,BufNew * match SpaceKey / /

