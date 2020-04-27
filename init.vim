call plug#begin('~/.config/nvim/plugged')
" UI
Plug 'morhetz/gruvbox'
Plug 'plasticboy/vim-markdown'

Plug 'jacoborus/tender.vim'
Plug 'mhartington/oceanic-next'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'Yggdroot/indentLine'
Plug 'jparise/vim-graphql'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'google/protobuf'
Plug 'uber/prototool', { 'rtp':'vim/prototool' }

Plug 'djoshea/vim-autoread'

Plug 'scrooloose/nerdcommenter'

Plug 'andrewradev/splitjoin.vim'

" fuzi search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Statusline
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'maximbaz/lightline-ale'

Plug 'dense-analysis/ale'

Plug 'airblade/vim-gitgutter'

" Autocomplete
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'fgrsnau/ncm2-otherbuf'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ap/vim-css-color'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" Navigation
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" motion
Plug 'justinmk/vim-sneak'

call plug#end()

syntax enable
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
set foldmethod=syntax
" set wrap!
set encoding=UTF-8
set autowrite

let g:sneak#label = 1
let g:sneak#s_next = 1

"for LanguageClient
set hidden
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ 'javascript': ['typescript-language-server', '--stdio', '--log-level 1'],
    \ 'javascript.jsx': ['typescript-language-server', '--stdio', '--log-level 1'],
    \ 'typescript': ['typescript-language-server', '--stdio', '--log-level 1'],
    \ }

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
let g:ncm2#complete_length=2


inoremap jj <Esc>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-_> :nohl<CR>
nnoremap <C-\> :vsplit<CR>

" split join
nnoremap <C-S> gS<C-S>
nnoremap <C-B> gJ<C-D>

" correct ident on paste
:nnoremap p p=`]


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
" colorscheme tender
" colorscheme OceanicNext
colorscheme dracula
hi CursorLine gui=underline cterm=underline ctermfg=None guifg=None

" ale linter
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\   'proto': ['prototool-lint'],
\}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}
" let g:ale_ruby_rubocop_options = '--lint'
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" Commenter configs
let g:NERDCompactSexyComs = 1
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1



" Statusline configs
let g:lightline = {}
let g:lightline.colorscheme = 'dracula'
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

let g:ruby_fold = 1
let g:ruby_foldable_groups = 'def # describe { do'

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
" let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeWinSize = 40
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeMapOpenVSplit = '<C-V>'
let g:NERDTreeMapOpenSplit = '<C-X>'
