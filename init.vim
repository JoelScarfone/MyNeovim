call plug#begin(stdpath('data') . '/plugged')

" navigation
Plug 'scrooloose/nerdtree'

" whitespace
Plug 'ntpeters/vim-better-whitespace'

" rust code completion + navigation
Plug 'racer-rust/vim-racer'

call plug#end()

" nerdtree config
autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd FileType nerdtree setlocal norelativenumber
autocmd FileType nerdtree setlocal nonumber
let NERDTreeShowHidden=1

" show line numbers as well as relative line numbers
set number relativenumber

" indent with 4 spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" <Ctrl-l> redraws screen, removing highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Vagrant file detection
augroup vagrant
au!
au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup end

" Rust quick navigation
au Filetype rust nmap gd <Plug>(rust-def)
au Filetype rust nmap gs <Plug>(rust-def-vertical)
