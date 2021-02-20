syntax on

set tabstop=4 softtabstop=4     "number of tabs in a file, no of tabs when you hit tabspace
set shiftwidth=2           		"gives an indent of 4 spaces
set smartindent
set nu                          "gives a numberline
set nowrap
set smartcase
set expandtab                   "convert tab character to spaces
set noswapfile                  "does not create .swp files
set incsearch
set bg=dark
set colorcolumn=100
set termguicolors
"Plugin Manager- Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"ADD PLUGINS HERE
"colorschemes
Plugin 'morhetz/gruvbox'
Plugin 'sickill/vim-monokai'         
Plugin 'tomasr/molokai'
Plugin 'phanviet/vim-monokai-pro'
Plugin 'blueshirts/darcula'

"AutoComplete Plugin
Plugin 'ycm-core/YouCompleteMe'
"file explorer plugin
Plugin 'preservim/nerdtree'
call vundle#end()

colorscheme gruvbox
