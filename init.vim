syntax on
set autoindent
set encoding=utf-8
set nu
set ignorecase
set relativenumber
set cursorline
set shiftwidth=4
set tabstop=4 softtabstop=4
set nowrap
set noswapfile
set completeopt-=preview
set completeopt+=noinsert
set colorcolumn=100
set wildmenu
set termguicolors
let mapleader="-"

source $HOME/.config/nvim/plugs.vim
colorscheme tokyonight

" Remaps
nnoremap tt :NERDTreeToggle<CR>
nnoremap <tab> :bnext<CR>
nnoremap vv :vsp<CR>
nnoremap vh :sp<CR>
nnoremap vb :vertical resize +10<CR>
nnoremap vc :vertical resize -10<CR>
nnoremap hj :resize +10<CR>
nnoremap hg :resize -10<CR>
nnoremap <space>h <C-W>h
nnoremap <space>j <C-W>j
nnoremap <space>k <C-W>k
nnoremap <space>l <C-W>l
nnoremap <space><Left> <C-W>h
nnoremap <space><Down> <C-W>j
nnoremap <space><Up> <C-W>k
nnoremap <space><Right> <C-W>l
inoremap ii <Esc>
nnoremap <space><space> i<space><Esc>
nnoremap <C-q> :copen<CR>
nnoremap <C-j> :cNext<CR>
nnoremap <C-k> :cprevious<CR>
nnoremap <C-c> :cclose<CR>
nnoremap <leader>l :lopen<CR>
nnoremap <leader>j :lNext<CR>
nnoremap <leader>k :lprevious<CR>
nnoremap <leader>c :lclose<CR>
inoremap <c-d> <Esc>ddi
nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fg <cmd>Telescope live_grep<cr>
nnoremap fb <cmd>Telescope buffers<cr>
" End of remaps

let g:airline#extensions#tabline#enabled = 1
let g:mucomplete#enable_auto_at_startup=1
let g:user_emmet_leader_key=',' " use , for the emmet plugin
let g:mkdp_browser = 'firefox'


" Python Language Server
lua << EOF
	require'lspconfig'.pylsp.setup{}
	require('telescope').load_extension('fzf')
EOF

" Removes all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType python set omnifunc=v:lua.vim.lsp.omnifunc

" LSP Remaps
nnoremap <silent> gD :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent> sd :lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> K  :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> rn :lua vim.lsp.buf.rename()<CR>
nnoremap <silent> [d :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]d :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <space>f :lua vim.lsp.buf.formatting()<CR>
" End of LSP Remaps

" Source this Config file
nnoremap <leader>sv :source $HOME/.config/nvim/init.vim<CR>

function! MarkdownFile()
	set spell
endfunction

autocmd FileType markdown set spell
autocmd FileType html,css,xml EmmetInstall
