call plug#begin('~/.config/nvim/plugged')
" UI
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'Yggdroot/indentLine'
Plug 'jparise/vim-graphql'

" fuzi search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Statusline
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'maximbaz/lightline-ale'

Plug 'dense-analysis/ale'

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
\     [ 'gitbranch', 'readonly', 'filename', 'modified' ]
\   ],
\   'right': [
\     [ 'lineinfo' ],
\     [ 'percent' ],
\     [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
\     [ 'gutentags' ]
\   ]
\ }

" Autocomplete
Plug 'ajh17/vimcompletesme'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ap/vim-css-color'

" Navigation
Plug 'preservim/nerdtree'
call plug#end()


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

inoremap jj <Esc>
nnoremap <Space> :

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" correct ident on paste
:nnoremap p p=`]

nmap <silent> <C-O> :NERDTreeToggle<CR>
:let g:NERDTreeWinSize=30

nnoremap <C-P> :GFiles<CR>

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:gruvbox_contrast_dark="hard"
let g:indentLine_color_term=240
colorscheme tender
