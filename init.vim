set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

" Required
Plugin 'VundleVim/Vundle.vim'

" Treeview
Plugin 'scrooloose/nerdtree'

" Code Quality
Plugin 'ntpeters/vim-better-whitespace'

" Rust
" Plugin 'racer-rust/vim-racer'
" Plugin 'rust-lang/rust.vim'
" Plugin 'sebastianmarkow/deoplete-rust'

" Code completion
Plugin 'Shougo/deoplete.nvim', { 'do' : ':UpdateRemotePlugins' }

call vundle#end()            " required

filetype plugin indent on    " required

" Nerdtree config
autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd FileType nerdtree setlocal norelativenumber
autocmd FileType nerdtree setlocal nonumber
let NERDTreeShowHidden=1

set number relativenumber

" Indent with 4 spaces
" set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" override 'filetype off' required by vundle for rust files
"autocmd BufNewFile,BufRead *.rs set filetype=rust

" Rust things for naviagation
" au Filetype rust nmap gd <Plug>(rust-def)
" au Filetype rust nmap gs <plug>(rust-def-split)
" au Filetype rust nmap gx <Plug>(rust-def-vertical)

" Rust deoplete things
" let g:deoplete#sources#rust#racer_binary='/usr/local/bin/racer'
" let g:deoplete#sources#rust#rust_source_path='/home/vagrant/.rustup/toolchains/nightly-2017-09-15-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/'
" let g:deoplete#sources#rust#show_duplicates=1
" let g:deoplete#sources#rust#disable_keymap=1
" let g:deoplete#sources#rust#documentation_max_height=20
