call plug#begin('~/.config/nvim/plugged')
" UI
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'Yggdroot/indentLine'

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

inoremap jj <Esc>
nnoremap <Space> :

nmap <silent> <C-P> :NERDTreeToggle<CR>

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:gruvbox_contrast_dark="hard"
let g:indentLine_color_term=240
colorscheme tender
