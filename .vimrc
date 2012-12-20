syn on
set bg=dark
set ts=4 sw=4 noet
set nowrap
set nobackup
set mouse=n
set backspace=indent

" Auto save/load views
"autocmd BufWinLeave ?* mkview
"autocmd BufWinEnter ?* silent loadview

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

nnoremap <leader>t vl:s/\t/    /g<cr>:let @/ = ""<cr>:echo<cr>
nnoremap <leader>tt vl:s/    /\t/g<cr>:let @/ = ""<cr>:echo<cr>

" teh winsize
nnoremap + <c-w>+
nnoremap - <c-w>-

" teh folding
nnoremap zz va)zfjjj
vnoremap zz zfjjj

" Plugins!
if has("win32")
	set dir=c:\\temp
	let g:vimfilepath = "~/config/.vimfiles/"
else
	set dir=/tmp
	let g:vimfilepath = "~/.vimfiles/"
endif
exec "source ".g:vimfilepath."plugin/plugins.vim"
call LoadPlugins(g:vimplugpath)
if has("python")
	call LoadPlugins(g:pyplugpath)
endif
