syntax on
set autoindent
set encoding=utf-8
set nu
"set relativenumber
"set cursorlines
set shiftwidth=4
set noswapfile
set t_Co=256
set termguicolors

filetype plugin on
set completeopt=longest,menu
set complete+=k
set wildmenu
autocmd Filetype javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd Filetype html setlocal omnifunc=htmlcomplete#CompleteTags

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

" jedi-vim for python autocompletion
Plug 'davidhalter/jedi-vim'
" airline
Plug 'vim-airline/vim-airline'

" Nerd Tree
Plug 'preservim/nerdtree'

" vim-fugitive
Plug 'tpope/vim-fugitive'

" Color Pigments
Plug 'gko/vim-coloresque'

" indent-line
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'

call plug#end()


colorscheme elly
nnoremap <C-t> :NERDTreeToggle<CR>
map <tab> :bnext<CR>

let g:airline#extensions#tabline#enabled = 1
