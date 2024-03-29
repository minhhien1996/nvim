let g:polyglot_disabled = ['ruby', 'javascript', 'jsx', 'go', 'yaml', 'yml']
call plug#begin('~/.config/nvim/plugged')

Plug 'konfekt/fastfold'

Plug 'Yggdroot/indentLine'
Plug 'jparise/vim-graphql'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-smooth-scroll'
Plug '907th/vim-auto-save'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'

Plug 'lmeijvogel/vim-yaml-helper'

Plug 'google/protobuf'

Plug 'djoshea/vim-autoread'

Plug 'scrooloose/nerdcommenter'

" fuzi search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Statusline
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'chemzqm/vim-jsx-improve'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'norcalli/nvim-colorizer.lua'

" Ruby
" Plug 'vim-ruby/vim-ruby'

" every other languages
Plug 'sheerun/vim-polyglot'

" Navigation
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Other language
" Plug 'stephpy/vim-yaml'

" Dim inactive
Plug 'blueyed/vim-diminactive'
" Plug 'sunjon/shade.nvim'

Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
" Plug 'antoinemadec/FixCursorHold.nvim'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'josa42/vim-lightline-coc'

Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'srcery-colors/srcery-vim'

Plug 'akinsho/nvim-toggleterm.lua'
Plug 'npxbr/glow.nvim', {'do': ':GlowInstall', 'branch': 'main'}

" find and replace
Plug 'nvim-lua/plenary.nvim'
Plug 'windwp/nvim-spectre'

Plug 'lewis6991/impatient.nvim'

Plug 'catppuccin/nvim', {'as': 'catppuccin'}

Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
" fzf-lua for icon support
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

syntax on
set title
set titlestring=%{split(getcwd(),\ '/')[-1]}
set clipboard+=unnamed  " use the same clipboards for vim and OS
set wildmode=longest,list,full
set nocompatible
set regexpengine=2
set autoread 
set ruler
set number
set expandtab
" set cursorline
set tabstop=2
set shiftwidth=2
set softtabstop=2
set splitbelow
set splitright
set number relativenumber
set scrolloff=15
set smartcase
set ignorecase
set lazyredraw
set ttyfast
set foldmethod=indent
set nofoldenable
set wrap
set encoding=UTF-8
set autowrite
" set cursorline!
set synmaxcol=2000
set re=2
set noswapfile
" syntax sync fromstart
syntax sync minlines=1000
set redrawtime=9999
set mouse=""
set termguicolors
set showmatch
set hidden
set background=dark
" colorscheme srcery

" let g:diminactive_use_colorcolumn = 0
" let g:diminactive_enable_focus = 1
" let g:diminactive_use_syntax = 1
" let g:diminactive_buftype_blacklist = ['nofile', 'nowrite', 'acwrite', 'quickfix', 'help']

" smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

inoremap jj <Esc>

" split Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-?> :nohl<CR>

" correct ident on paste
:nnoremap p p=`]

" FZF
" nnoremap <C-P> :GFiles<CR>
nnoremap <C-P> <cmd>lua require('fzf-lua').git_files()<CR>
" nnoremap <C-F> :Rg<CR>
nnoremap <C-F> <cmd>lua require('fzf-lua').live_grep_glob()<CR>
" nnoremap <C-B> :BLines<CR>
nnoremap <C-B> <cmd>lua require('fzf-lua').buffers()<CR>
" nnoremap <C-\> :History<CR>
nnoremap <C-\> <cmd>lua require('fzf-lua').oldfiles()<CR>
" command! -bang -nargs=* History call fzf#vim#history({'options': '--no-sort'})
nnoremap <C-S> <cmd>lua require('fzf-lua').resume()<CR>

" commenter
nmap // <leader>c<space>
vmap // <leader>c<space>

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
highlight CursorLine gui=underline cterm=underline ctermfg=None guifg=None
highlight ColorColumn ctermbg=darkgray guibg=darkgray
highlight MatchParen cterm=underline ctermbg=none ctermfg=green
" highlight Visual  ctermfg=black ctermbg=cyan gui=none
" highlight Directory guifg=cyan ctermfg=cyan

" colorize the 121th char for long line notice
call matchadd('ColorColumn', '\%121v.', -1)

set fcs=eob:\ 

" Commenter configs
let g:NERDCompactSexyComs = 1
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" Statusline configs
let g:lightline = {}
" let g:lightline.colorscheme = 'srcery'
let g:lightline.component_function = {
      \   'gitbranch': 'fugitive#head',
      \   'gutentags': 'gutentags#statusline'
      \ }
let g:lightline.component_expand = {
  \   'linter_warnings': 'lightline#coc#warnings',
  \   'linter_errors': 'lightline#coc#errors',
  \   'linter_info': 'lightline#coc#info',
  \   'linter_hints': 'lightline#coc#hints',
  \   'linter_ok': 'lightline#coc#ok',
  \   'status': 'lightline#coc#status',
  \ }

" Set color to the components:
let g:lightline.component_type = {
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_info': 'info',
  \   'linter_hints': 'hints',
  \   'linter_ok': 'left',
  \ }
let g:lightline.active = {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'gitbranch', 'readonly', 'relativepath', 'modified' ]
      \   ],
      \   'right': [
      \     [ 'lineinfo' ],
      \     [ 'percent' ],
      \     [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \     [ 'gutentags' ]
      \   ]
      \ }

let g:python3_host_prog='/opt/homebrew/bin/python3'
let g:python_host_prog='/usr/local/bin/python2'

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_diagnosticsMaxSeverity = "Error"

let NERDTreeShowHidden=1

" Toggle NERDTree
function! OpenNerdTree()
  " if nerdtreefind if nerdtree already opened
  if &modifiable && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
  else
    NERDTreeToggle
  endif
endfunction
nmap <C-O> :call OpenNerdTree()<CR>

let g:NERDTreeHijackNetrw = 1
let g:NERDTreeIgnore = ['^node_modules$[[dir]]']
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeMapOpenVSplit = '<C-V>'
let g:NERDTreeMapOpenSplit = '<C-X>'

let g:auto_save = 1
let g:auto_save_events = ['CursorHold', 'BufLeave']
" let g:cursorhold_updatetime = 2000



let g:toggleterm_terminal_mapping = '<C-T>'
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>

let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'

let g:lens#disabled_filetypes = ['fzf', 'nerdtree', 'toggleterm', 'terminal']
let g:lens#width_resize_max = 160
let g:lens#width_resize_min = 60

let g:indentLine_char = '│'
let g:indentLine_color_term=240


" colorizer.lua
lua require'colorizer'.setup()

" let g:ruby_fold = 1

nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 0
let g:fastfold_fdmhook = 0
let g:fastfold_fold_command_suffixes = []
let g:fastfold_fold_movement_commands = []

let g:ruby_path="~/.rvm/bin/ruby"
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_layout = { 'down': '40%' }


" COC
let g:coc_global_extensions = ['coc-solargraph', 'coc-omnisharp', 'coc-tsserver']
let g:coc_user_config = {}
let g:coc_user_config['coc.preferences.jumpCommand'] = ':SplitIfNotOpen4COC'
call lightline#coc#register()

nmap <silent> gs :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gt :call CocAction('jumpDefinition', 'tabe')<CR>
nmap <silent> gn :call CocAction('diagnosticNext')<CR>

lua << EOF
require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    local size
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return math.min(vim.o.columns * 0.5, 120)
    end
  end,
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_terminals = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'vertical',
  close_on_exit = true, -- close the terminal window when the process exits
  shade_filetypes = { "none", "fzf" }
}
EOF


nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mZJ`z

" ESC to exit terminal mode, but not conflict FZF
if has("nvim")
      au TermOpen * tnoremap <Esc> <C-\><C-N>
      au FileType fzf tunmap <Esc>
endif

let g:startify_change_to_dir = 0

" lua << EOF
" require'shade'.setup({
"   overlay_opacity = 30,
" })
" EOF

let g:vim_yaml_helper#auto_display_path = 1


" nnoremap <C-s> :lua require('spectre').open()<CR>

lua <<  EOF
require('impatient')
EOF


let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha
lua << EOF
require("catppuccin").setup({
  transparent_background = true,
  dim_inactive = {
    enabled = true,
    shade = "light",
    percentage = 0.75,
  },
})
EOF
colorscheme catppuccin

lua << EOF
require('fzf-lua').setup{
  winopts = {
    split = "belowright new"  
  }
}
EOF
