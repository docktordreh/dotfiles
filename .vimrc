set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim

set exrc
set secure

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'w0rp/ale'
Plugin 'junegunn/fzf.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'terryma/vim-multiple-cursors'
" ctrl+n, c,i,a -> more: github.com/terryma/vim-multiple-cursors
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'davidhalter/jedi-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'WolfgangMehner/bash-support'
Plugin 'WolfgangMehner/latex-support'
Plugin 'WolfgangMehner/c-support'
Plugin 'maelvalais/gmpl.vim'
Plugin 'gentoo/gentoo-syntax'
Plugin 'morhetz/gruvbox'
Plugin 'ayu-theme/ayu-vim'
call vundle#end()
syntax enable
" set background=light
colorscheme ayu
" expandtab: insert space chars instead of tab
" tabstop: x spaces 1 tab
" shiftwidth: identation
" softtabstop: backspace goes back x spaces
autocmd FileType * set expandtab|set shiftwidth=4|set tabstop=4
autocmd FileType c set expandtab|set tabstop=2|set shiftwidth=3
autocmd FileType python set softtabstop=4|set expandtab
autocmd FileType sh set shiftwidth=3|set tabstop=3|set expandtab
