let g:polyglot_disabled = ['ruby', 'javascript', 'jsx']
call plug#begin('~/.config/nvim/plugged')

Plug 'konfekt/fastfold'

Plug 'Yggdroot/indentLine'
Plug 'jparise/vim-graphql'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-smooth-scroll'
Plug '907th/vim-auto-save'
Plug 'cohama/lexima.vim' " auto close parentheses
Plug 'tpope/vim-endwise'

Plug 'kassio/neoterm'

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
Plug 'vim-ruby/vim-ruby'

" every other languages
Plug 'sheerun/vim-polyglot'

" Navigation
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Other language
Plug 'plasticboy/vim-markdown'
Plug 'stephpy/vim-yaml'

" Dim inactive
Plug 'blueyed/vim-diminactive'

Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
Plug 'antoinemadec/FixCursorHold.nvim'

Plug 'kdheepak/lazygit.nvim'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'josa42/vim-lightline-coc'

Plug 'tssm/fairyfloss.vim'
Plug 'joshdick/onedark.vim'

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
" set wrap!
set encoding=UTF-8
set autowrite
" set cursorline!
set synmaxcol=250
set re=1
set noswapfile
" syntax sync fromstart
" syntax sync minlines=200
set redrawtime=10000
set mouse=n
set termguicolors
set showmatch
colorscheme onedark


" let g:vimade = {}
" let g:vimade.detecttermcolors = 1

let g:diminactive_use_colorcolumn = 0
let g:diminactive_enable_focus = 1
let g:diminactive_use_syntax = 1
let g:diminactive_buftype_blacklist = ['nofile', 'nowrite', 'acwrite', 'quickfix', 'help']


"for LanguageClient
set hidden
let g:LanguageClient_serverCommands = {
      \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
      \ }


augroup ft_rb
  au!
  " fix the SLOOOW syntax highlighting
  au FileType ruby setlocal re=1 foldmethod=indent foldlevel=15
augroup END

" smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

inoremap jj <Esc>

" split Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-_> :nohl<CR>

" correct ident on paste
:nnoremap p p=`]

" FZF
nnoremap <C-P> :GFiles<CR>
nnoremap <C-F> :Rg<CR>
nnoremap <C-B> :Buffer<CR>
nnoremap <C-\> :History<CR>
command! -bang -nargs=* History call fzf#vim#history({'options': '--no-sort'})

" copy paste clipboard
" nnoremap <C-y> "+y
" vnoremap <C-y> "+y
" nnoremap <C-p> "+gP
" vnoremap <C-p> "+gP

" commenter
nmap // <leader>c<space>
vmap // <leader>c<space>

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
highlight CursorLine gui=underline cterm=underline ctermfg=None guifg=None
highlight ColorColumn ctermbg=darkgray guibg=darkgray
highlight MatchParen cterm=underline ctermbg=none ctermfg=green
highlight Visual  ctermfg=black ctermbg=cyan gui=none
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
" let g:lightline.colorscheme = 'dracula'
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

let g:python3_host_prog='/usr/local/bin/python3'
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
let g:cursorhold_updatetime = 2000

let g:diminactive_enable_focus = 1

" NeoTerm
nmap <C-T> :Topen<CR>
tnoremap <C-Q>  <C-\><C-N> :Tclose<CR>
tnoremap <C-R> :Tclear<CR>
noremap <C-Q> :Tclose<CR>

let g:neoterm_default_mod = ':vertical'
let g:neoterm_size = 80
let g:neoterm_autoscroll = 1
let g:neoterm_autoinsert = 1
let g:neoterm_keep_term_open = 0

" ESC to exit terminal mode, but not conflict FZF
if has("nvim")
  au TermOpen * tnoremap <Esc> <C-\><C-N>
  au FileType fzf tunmap <Esc>
endif

let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'

let g:lens#disabled_filetypes = ['fzf', 'nerdtree']
let g:lens#width_resize_max = 200
let g:lens#width_resize_min = 100

let g:indentLine_char = '│'
let g:indentLine_color_term=240


" colorizer.lua
lua require'colorizer'.setup()

let g:ruby_fold = 1
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 0
let g:fastfold_fdmhook = 0
let g:fastfold_fold_command_suffixes = []
let g:fastfold_fold_movement_commands = []

let g:ruby_path="~/.rvm/bin/ruby"
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_layout = { 'down': '40%' }

let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
noremap <C-G> :LazyGit<CR>


" COC
let g:coc_global_extensions = ['coc-solargraph']
let g:coc_user_config = {}
let g:coc_user_config['coc.preferences.jumpCommand'] = ':SplitIfNotOpen4COC'
call lightline#coc#register()

nmap <silent> gs :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gt :call CocAction('jumpDefinition', 'tabe')<CR>
