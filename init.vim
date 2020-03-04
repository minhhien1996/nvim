call plug#begin('~/.config/nvim/plugged')
" UI
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jacoborus/tender.vim'
Plug 'Yggdroot/indentLine'

" Navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()



set colorcolumn=80,120
set tabstop=2
set shiftwidth=2
set softtabstop=2

inoremap jj <Esc>
nnoremap <Space> :

" Toggle NERDTree
let NERDTreeShowHidden = 1
function! OpenNerdTree()
  if &modifiable && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
  else
    NERDTreeToggle
  endif
endfunction
nnoremap <silent> <D-p> :call OpenNerdTree()<CR>

let g:dracula_colorterm=0
let g:indentLine_color_term=240
colorscheme tender
