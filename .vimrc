set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim

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
call vundle#end()

syntax enable
let g:solarized_contrast="high"
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
hi Normal guibg=NONE ctermbg=NONE
