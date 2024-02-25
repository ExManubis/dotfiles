let mapleader=','
let maplocalleader='<Space>'
noremap <Space>n :NERDTreeToggle<CR>
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
set nocompatible 	" disable vi-compatability
set showmatch		" show matching
set number		" add line-numbers
set ignorecase		" case insensitive
set mouse=v		" middle-click paste
set hlsearch		" highlight search
set incsearch		" incremental search
set tabstop=4		" number of columns of bt tab
set expandtab		" converts tab to whitespace
set shiftwidth=4	" width for auto-indents
set autoindent		" indent a new line same amount
set wildmode=longest, list
set mouse+=a
"set termguicolors
set cc=80		" column border
filetype plugin indent on " allow auto-indent dependent on file
syntax enable " syntax highlight
set clipboard=unnamedplus	" use system clipboard
set cursorline		" hightlight cursorline
set ttyfast		" speed up scrolling
"set spell		" enable spell-check

call plug#begin()
Plug 'morhetz/gruvbox'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'startup-nvim/startup.nvim'
Plug 'tribela/vim-transparent'
Plug 'goolord/alpha-nvim'
Plug 'lervag/vimtex'
Plug 'Mofiqul/dracula.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'romgrk/barbar.nvim'
Plug 'sainnhe/everforest'
"Plug 'sirver/ultisnips'
"Plug 'honza/vim-snippets'
call plug#end()
colorscheme everforest
let g:bargreybars_auto=0
"let g:airline_solorized_bg='dark'
"let g:airline_powerline_fonts=1
"let g:airline#extension#tabline#enable=1
"let g:airline#extension#tabline#left_sep=' '
"let g:airline#extension#tabline#left_alt_sep='|'
"let g:airline#extension#tabline#formatter='unique_tail'
let NERDTreeQuitOnOpen=1
let g:vimtex_view_method = 'zathura'

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <C-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

lua << EOF
 require'alpha'.setup(require'alpha.themes.dashboard'.config)
 require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
  }

  require'barbar'.setup {
    animation = true,
    auto_hide = 1,
    tabpages = false,
    clickable = true,
    preset = 'slanted',
    sidebar_filetypes = {
      NERDTree = true
      },
  }
  
EOF
