syntax on
set autoindent
set encoding=utf-8
set nu
set ignorecase
set relativenumber
set cursorline
set shiftwidth=4
set nowrap
set noswapfile
set t_Co=256
set termguicolors
filetype plugin on
autocmd Filetype javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" Removes all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e


" Vim Plug- Plugin Manager
call plug#begin()

Plug 'lifepillar/vim-mucomplete'

"colorschemes
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'wadackel/vim-dogrun'
Plug 'ulwlu/elly.vim'
Plug 'embark-theme/vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'ajmwagar/vim-deus'
Plug 'srcery-colors/srcery-vim'
Plug 'ackyshake/Spacegray.vim'
Plug 'sainnhe/sonokai'
" airline
Plug 'vim-airline/vim-airline'

" Nerd Tree
Plug 'preservim/nerdtree'

" vim-fugitive
Plug 'tpope/vim-fugitive'

" Color Pigments
"Plug 'gko/vim-coloresque'

Plug 'ap/vim-css-color'

" indent-line
Plug 'Yggdroot/indentLine'

" emmet plugin for vim
Plug 'mattn/emmet-vim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


" Maybe someother day :'c :'c
" LSP Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'nvim-lua/completion-nvim'

call plug#end()


colorscheme gruvbox

" Remaps

nnoremap tt :NERDTreeToggle<CR>
map <tab> :bnext<CR>
nnoremap hh <C-w>h
nnoremap ll <C-w>l
nnoremap jj <C-w>j
nnoremap kk <C-w>k
noremap vv :vsp<CR>
noremap vh :sp<CR>
noremap vb :vertical resize +10<CR>
noremap vc :vertical resize -10<CR>
noremap hj :resize +10<CR>
nnoremap hg :resize -10<CR>
inoremap ii <Esc>
nnoremap <space><space> i<space><Esc>

" End of Remaps

"" For Fun ascii art

nnoremap fs :.!figlet -f slant<CR>
nnoremap fw :.!figlet -f future<CR>

lua require'lspconfig'.pylsp.setup{on_attach=require'completion'.on_attach}

set completeopt+=noinsert
"set complete=b
set wildmenu
let g:airline#extensions#tabline#enabled = 1
let g:user_emmet_leader_key=','


" Telescope remaps
nnoremap ff :Telescope find_files<CR>
nnoremap fg :Telescope live_grep<CR>

" startup
let g:mucomplete#enable_auto_at_startup=1
