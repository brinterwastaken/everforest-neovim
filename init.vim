" Plugins
call plug#begin("~/.config/nvim/plugins")
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'Pocco81/AutoSave.nvim'
  Plug 'sainnhe/everforest'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ap/vim-css-color'
  Plug 'jiangmiao/auto-pairs'
call plug#end()

" Vim configuration
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
set noshowmode
set number
set mouse=a
set termguicolors
colorscheme everforest
let bufferline = get(g:, 'bufferline', {})
let bufferline.no_name_title = "New Tab"
let g:airline_right_sep = ' '
let g:airline_left_sep = ' '
let g:airline_symbols.linenr = '並 '
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
let g:neovide_transparency = 0.75
set omnifunc=javascriptcomplete#CompleteJS
set omnifunc=htmlcomplete#CompleteTags
set omnifunc=csscomplete#CompleteCSS
" tab spacing
set tabstop=4
set shiftwidth=4
set expandtab
" tabs
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
" system clipboard
nmap <c-c> "+y
vmap <c-c> "+y
nmap <c-v> "+p
inoremap <c-v> <c-r>+
cnoremap <c-v> <c-r>+
" use <c-r> to insert original character without triggering things like auto-pairs
inoremap <c-r> <c-v>
" Neovide configuration
set guifont=Iosevka\ Nerd\ Font:h16
" Lua script
lua <<EOF
require("autosave").setup(
    {
	enabled = true,
	execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
	events = {"InsertLeave", "TextChanged"},
	write_all_buffers = false,
	on_off_commands = true,
	clean_command_line_interval = 0,
	debounce_delay = 135
   }
)
EOF
