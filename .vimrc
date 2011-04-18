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
if has("gui_running")
  color desert
else
  color pablo
endif
set guifont=Monospace\ 11

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
"设置编程缩进
autocmd FileType c,cpp,h set tabstop=4 softtabstop=4 shiftwidth=4 expandtab nu fdm=syntax nofen
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType html,htmldjango setlocal et sta sw=2 sts=2
autocmd FileType python setlocal makeprg=python2\ %
autocmd FileType tex set makeprg=xelatex\ %
autocmd FileType tex map <F10> :!evince %<.pdf<CR>
" persistent undo
set undodir=~/.vim/undodir
set undofile
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
map <F3> :call CompileRunOpengl()<CR>
func! CompileRunOpengl()
    exec "w"
    exec "!gcc -g -Wall % -o %< -lglut -lGL -lGLU -lm -L/usr/X11R6/lib"
    exec "! ./%<"
endfunc
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
    exec "!time ./%<"
endfunc

" gdb调试
map <F8> :call Gdb()<CR>
func! Gdb()
    exec "!urxvt -e gdb %<"
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
""""""""""""""""""""""""""""
" ctags
"map <C-F11> :!ctags -R .<CR>
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . <CR>
" taglist
nnoremap <silent> <F4> :TlistToggle<CR>
let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
" cscope
map <F12> :!cscope -Rbq<CR>:cs add cscope.out<CR>
