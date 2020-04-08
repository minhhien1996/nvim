call plug#begin('~/.config/nvim/plugged')
" UI
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'Yggdroot/indentLine'
Plug 'jparise/vim-graphql'
Plug 'jiangmiao/auto-pairs'

Plug 'google/protobuf'

Plug 'djoshea/vim-autoread'

Plug 'scrooloose/nerdcommenter'

" fuzi search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Statusline
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'maximbaz/lightline-ale'

Plug 'dense-analysis/ale'

" Autocomplete
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}


" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ap/vim-css-color'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" Navigation
Plug 'mcchrish/nnn.vim'
call plug#end()

set regexpengine=1
set autoread 
set ruler
set number
set expandtab
set cursorline
set colorcolumn=80,120
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

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

inoremap jj <Esc>
nnoremap <Space> :

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" correct ident on paste
:nnoremap p p=`]

let g:nnn#set_default_mappings = 1 
nnoremap <silent> <C-O> :NnnPicker<CR>
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } } 
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }

nnoremap <C-P> :GFiles<CR>

nnoremap <C-F> :Rg<CR>

" copy paste clipboard
nnoremap <C-y> "+y
vnoremap <C-y> "+y
" nnoremap <C-p> "+gP
" vnoremap <C-p> "+gP

" move line
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" commenter
nmap // <leader>c<space>
vmap // <leader>c<space>

 " Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:gruvbox_contrast_dark="hard"
let g:indentLine_color_term=240
colorscheme tender

" ale linter
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" Commenter configs
let g:NERDCompactSexyComs = 1
let g:NERDSpaceDelims = 1


" Statusline configs
let g:lightline = {}
let g:lightline.colorscheme = 'tender'
let g:lightline.component_function = {
      \   'gitbranch': 'fugitive#head',
      \   'gutentags': 'gutentags#statusline'
      \ }
let g:lightline.component_expand = {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok'
      \ }
let g:lightline.component_type = {
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left'
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

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:nnn#replace_netrw = 1
