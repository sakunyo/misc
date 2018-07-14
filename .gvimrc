"--------------------------------
" STYLE
"--------------------------------

" Colors
if !empty(glob("~/.vim/colors/solarized.vim"))
  " https://github.com/altercation/vim-colors-solarized
  set background=light
  colorscheme solarized
  hi SpecialKey ctermfg=254 ctermbg=NONE
  hi SpaceKey   cterm=underline ctermfg=235
endif

set antialias                              " font antialias
set cmdheight=1                            " コマンドラインの高さ
set columns=220                            " 横幅
set cursorline                             " カーソル行を強調表示
set ff=unix
set fileencoding=utf8
set foldcolumn=2;
set guioptions+=b
set guioptions-=T                          " ツールバーを削除
set guioptions-=Tm                         " メニューを削除
set lines=64                               " 行数
set listchars=tab:>-,extends:>,precedes:<  " 不可視文字で表示される文字のフォーマットを指定する
set previewheight=5                        " プレビューウィンドウの高さ
set splitbelow                             " 横分割したら新しいウィンドウは下に
set splitright                             " 縦分割したら新しいウィンドウは右に
set title                                  " ウィンドウのタイトルを書き換える
set virtualedit+=block
set visualbell

"--------------------------------
" Auto commands
"--------------------------------

