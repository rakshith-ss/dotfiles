call plug#begin()
" mu-complete
Plug 'lifepillar/vim-mucomplete'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'tamelion/neovim-molokai'
Plug 'sainnhe/sonokai'
Plug 'altercation/vim-colors-solarized'
Plug 'sonjapeterson/1989.vim'
Plug 'junegunn/goyo.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ajmwagar/vim-deus'
Plug 'ulwlu/elly.vim'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'arcticicestudio/nord-vim'
" End of Colorschemes

Plug 'vim-airline/vim-airline'        " Status line
Plug 'tpope/vim-fugitive'             " git
Plug 'ap/vim-css-color'               " To see color pigments
Plug 'Yggdroot/indentLine'            " show indented lines
Plug 'mattn/emmet-vim'                " emmet plugins for html snippet
Plug 'preservim/nerdtree'             " Nerd-Tree File Manager
Plug 'neovim/nvim-lspconfig'          " Plugin to use a Language Server
Plug 'ryanoasis/vim-devicons'         " Icons
Plug 'kyazdani42/nvim-web-devicons'   " Icons
Plug 'nvim-lua/plenary.nvim'          " Telescope
Plug 'nvim-telescope/telescope.nvim'  "
Plug 'nvim-lua/popup.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
call plug#end()
