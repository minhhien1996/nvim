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
" Plug 'ajh17/vimcompletesme'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}


" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ap/vim-css-color'

" Navigation
" Plug 'preservim/nerdtree'
Plug 'vifm/vifm.vim'
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

" nmap <silent> <C-O> :NERDTreeToggle<CR>
" let g:NERDTreeWinSize=30
" let g:NERDTreeMinimalUI = 1
" let g:NERDTreeDirArrows = 1

nmap <silent> <C-O> :VsplitVifm<CR> 

nnoremap <C-P> :GFiles<CR>

let s:git_path = substitute(system("git rev-parse --show-toplevel 2>/dev/null"), '\n', '', '')
function! s:ag_git_root(query, ...)
  if type(a:query) != type('')
    return s:warn('Invalid query argument')
  endif
  let query = empty(a:query) ? '^(?=.)' : a:query
  let args = copy(a:000)
  let ag_opts = len(args) > 1 && type(args[0]) == s:TYPE.string ? remove(args, 0) : ''
  let command = ag_opts . ' ' . fzf#shellescape(query) . ' ' . s:git_path
  return call('fzf#vim#ag_raw', insert(args, command, 0))
endfunction
command! -bang -nargs=* GAg
      \ call s:ag_git_root(<q-args>, <bang>0)
nnoremap <C-S-F> :GAg<CR>

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
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['eslint']
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
let g:vifm_replace_netrw = 1
