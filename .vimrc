
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ru
set nocompatible
set ignorecase "Ignore case when searching
" set hlsearch "Highlight search things
set incsearch "Make search act like search in modern browsers
set magic "Set magic on, for regular expressions
set showmatch "Show matching bracets when text indicator is over them
set autoindent
set smartindent
syntax on
filetype plugin indent on

" 设置编码
set encoding=utf-8
set termencoding=utf8
" 设置文件编码
set fileencodings=utf-8,chinese,latin-1
" 指定菜单语言
set langmenu=zh_CN.UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set helplang=cn
"不产生临时文件
set nobackup
set nowritebackup
set noswapfile
colorscheme desert
"设置编程缩进
autocmd FileType c,cpp,h set tabstop=4 | set softtabstop=4 | set shiftwidth=4 | set expandtab | set nu | setl fdm=syntax | setl nofen

"Set mapleader
let mapleader = ","

"Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc 

""""""""""""""""""""""""""""""
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
""""""""""""""""""""""""""""""
" C的编译和运行
map <F6> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    exec "!gcc -g -Wall % -o %<"
    exec "! ./%<"
endfunc

" C++的编译和运行
map <F7> :call CompileRunGpp()<CR>
func! CompileRunGpp()
    exec "w"
    exec "!pwd"
    exec "!g++ -g -Wall % -o %<"
    exec "! ./%<"
endfunc

" gdb调试
map <F8> :call Gdb()<CR>
func! Gdb()
    exec "!gnome-terminal -e \"gdb %<\""
endfunc

" 将代码输出为html
map <F5> :call Cpp2html()<CR>
func! Cpp2html()
    exec "w"
    exec "set nonu"
    exec "colorscheme default"
    exec "TOhtml"
    exec "w"
    exec "clo"
    exec "set nu"
    exec "colorscheme desert"
endfunc
