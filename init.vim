call plug#begin('~/.config/nvim/plugged')

Plug 'konfekt/fastfold'

Plug 'Yggdroot/indentLine'
Plug 'jparise/vim-graphql'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-smooth-scroll'
Plug '907th/vim-auto-save'
Plug 'cohama/lexima.vim' " auto close parentheses

Plug 'kassio/neoterm'

Plug 'google/protobuf'
Plug 'uber/prototool', { 'rtp':'vim/prototool' }

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
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
Plug 'ap/vim-css-color'
Plug 'jparise/vim-graphql'
Plug 'chemzqm/vim-jsx-improve'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Ruby
Plug 'vim-ruby/vim-ruby'

" Navigation
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Other language
Plug 'plasticboy/vim-markdown'
Plug 'stephpy/vim-yaml'

" Dim inactive
Plug 'TaDaa/vimade'

Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
Plug 'antoinemadec/FixCursorHold.nvim'

call plug#end()

syntax on
set clipboard+=unnamed  " use the same clipboards for vim and OS
set wildmode=longest,list,full
set nocompatible
set regexpengine=1
set autoread 
set ruler
set number
set expandtab
set cursorline
" set colorcolumn=120
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
set foldmethod=syntax
" set wrap!
set encoding=UTF-8
set autowrite
set cursorline!
set synmaxcol=128
set re=1
set noswapfile
syntax sync fromstart
set redrawtime=10000
" set mouse=a

let g:vimade = {}
let g:vimade.detecttermcolors = 1

"for LanguageClient
set hidden
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ 'javascript': ['typescript-language-server', '--stdio', '--log-level 1'],
    \ 'javascript.jsx': ['typescript-language-server', '--stdio', '--log-level 1'],
    \ 'typescript': ['typescript-language-server', '--stdio', '--log-level 1'],
    \ }

" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd BufEnter * silent! ncm2#blacklist_for_buffer(['cwdpath', 'rootpath'])

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
let g:ncm2#complete_length=2


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

let $NVIM_TUI_ENABLE_TRUE_COLOR=0
let g:gruvbox_contrast_dark="hard"
let g:indentLine_color_term=240
highlight CursorLine gui=underline cterm=underline ctermfg=None guifg=None
highlight ColorColumn ctermbg=darkgray guibg=darkgray
highlight MatchParen cterm=underline ctermbg=none ctermfg=green
highlight Visual  ctermfg=black ctermbg=cyan gui=none
" highlight Directory guifg=cyan ctermfg=cyan

call matchadd('ColorColumn', '\%81v.', 100)

set fcs=eob:\ 

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
let g:ale_ruby_rubocop_options = '--safe-auto-correct'

let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1

" highlight ALEErrorSign ctermbg=NONE ctermfg=red
" highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

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
let g:ruby_foldable_groups = 'def # describe { do ('

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
" let g:NERDTreeWinSize = 40
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

let g:lens#disabled_filetypes = ['fzf']
let g:lens#width_resize_max = 100
let g:lens#width_resize_min = 30

let g:indentLine_char = '│'
