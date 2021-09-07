syntax on
set nu
set rnu
set tabstop=4
set autoindent
set shiftwidth=4
set noswapfile
set nowrap
set t_Co=256
set encoding=utf-8
set ignorecase
set cursorline
set bg=dark

" Removes all trailing whitespace
autocmd BufWrite * :%s/\s\+$//e

" Vim-Plug -> Plugin Manager

call plug#begin()
Plug 'lifepillar/vim-mucomplete'
Plug 'mattn/emmet-vim'
Plug 'sainnhe/sonokai'
Plug 'morhetz/gruvbox'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
call plug#end()

colorscheme gruvbox
"colorscheme delek
set wildmenu
set completeopt+=noinsert

let g:user_emmet_leader_key=","
let g:mucomplete#enable_auto_at_startup=1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" Remaps
map <tab> :bnext<CR>
inoremap ii <Esc><CR>
map tt :Lexplore<CR>
"map nm :Lexplore

let g:netrw_winsize=20
