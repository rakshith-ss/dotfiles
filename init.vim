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
set numberwidth=8

let mapleader="-"

source $HOME/.config/nvim/plugs.vim
colorscheme nord

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
inoremap <c-d> <Esc>dd
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
" End of remaps

let g:user_emmet_leader_key=',' " use , for the emmet plugin
let g:mkdp_browser = 'firefox'
let g:airline#extensions#tabline#enabled=1

" Lua configsr
" Need to port lua soon
lua << EOF
	-- Nvim-cmp config
	local cmp = require'cmp'

	cmp.setup({
	  snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
		vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	  },
	  mapping = {
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		['<C-e>'] = cmp.mapping({
		i = cmp.mapping.abort(),
		c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
	    ['<CR>'] = cmp.mapping.confirm({ select = true }),
	  },
	  sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'ultisnips' }, -- For ultisnips users.
	  }, {
	    { name = 'buffer' },
	  })
	})

	-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline('/', {
	  sources = {
	    { name = 'buffer' }
	  }
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(':', {
	  sources = cmp.config.sources({
	    { name = 'path' }
	  }, {
	    { name = 'cmdline' }
	  })
	})

	-- Setup lspconfig.
	local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	local nvim_lsp = require('lspconfig')
	local servers = {'pylsp', 'html', 'cssls', 'clangd', 'eslint', 'solargraph'}
	for _,lsp in ipairs(servers) do
		nvim_lsp[lsp].setup{
			capabilities = capabilities
		}
	end

	-- lua indent line
	vim.opt.list = true
	vim.opt.listchars:append("space:⋅")
	vim.opt.listchars:append("eol:↴")
	require("indent_blankline").setup {
		space_char_blankline = " ",
		space_char_blankline = " ",
	}

	-- lua line
	--require'lualine'.setup{
	--options = {
	--	section_separators = { left = '', right = ''},
	--	component_separators = { left = '', right = ''}
	--	}
	--}
EOF

" Removes all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

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
nnoremap <C-s> :source $HOME/.config/nvim/init.vim<CR>

function! MarkdownFile()
	set spell
endfunction

autocmd FileType markdown setlocal spell
autocmd FileType html,css,xml EmmetInstall

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
