syn on
set bg=dark
set ts=4 sw=4 noet
set nowrap
set nobackup
set mouse=""

" Custom mappings etc
"   Editing vim config
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"   Files
nnoremap <leader>w :w<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>qq :q!<CR>
nnoremap <leader>ww :w!<CR>

"   Movement / changing modes
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <esc> <nop>
inoremap jk <esc>

nnoremap <up> ddkkp
nnoremap <down> ddp
nnoremap <left> <<
nnoremap <right> >>

vnoremap <left> <gv
vnoremap <right> >gv

nnoremap <leader>c <home>i--<esc>j<home>
nnoremap <leader>u <home>xx<esc>j<home>
nnoremap <leader>t vl:s/\t/    /g<cr>:let @/ = ""<cr>:echo<cr>
nnoremap <leader>tt vl:s/    /\t/g<cr>:let @/ = ""<cr>:echo<cr>

nnoremap + <c-w>+
nnoremap - <c-w>-

if has("python")
	source $HOME/.vimpyrc
else
	echom "No python, cant load python plugins! :0"
endif
