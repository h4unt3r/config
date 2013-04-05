syn on
set bg=dark
set ts=4 sw=4 noet
set nowrap
set nobackup
set mouse=
set backspace=indent
filetype plugin indent on

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
nnoremap <leader>qq :qa!<CR>
nnoremap <leader>ww :w!<CR>
"   Open a file relative to file editing if its in a string
function! SplitFile( file, ... )
	" If true passed, split vertical
	if a:0 && a:1 
		let l:basecmd = "vsp"
	else
		let l:basecmd = "sp"
	endif
	exec l:basecmd." ".fnamemodify(expand('%'),":h")."/".a:file
endfunction
nnoremap <leader>vsf ""yi":call SplitFile(@",1)<CR><C-w>r
nnoremap <leader>sf ""yi":call SplitFile(@",0)<CR>
vnoremap <leader>vsf ""y:call SplitFile(@",1)<CR><C-w>r
vnoremap <leader>sf ""y:call SplitFile(@",0)<CR>

"   Movement / changing modes
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <esc> <nop>
inoremap jk <esc>
inoremap kj <esc>O

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
" moving through windows
nnoremap <leader>l 1000<C-w><<C-w>l0
nnoremap <leader>h 1000<C-w><<C-w>h0
nnoremap <leader>j 1000<C-w>-<C-w>j0
nnoremap <leader>k 1000<C-w>-<C-w>k0

" teh folding
nnoremap zz va)zfjjj
vnoremap zz zfjjj

" Plugins!
if has("win32")
	set dir=c:\\temp
	if !exists("g:vimfilepath")
		let g:vimfilepath = "~/config/.vimfiles/"
	endif
else
	set dir=/tmp
	if !exists("g:vimfilepath")
		let g:vimfilepath = "~/.vimfiles/"
	endif
endif
if isdirectory(expand(g:vimfilepath))
	exec "source ".g:vimfilepath."plugin/plugins.vim"
	call LoadPlugins(g:vimplugpath)
	if has("python")
		call LoadPlugins(g:pyplugpath)
	endif
else
	echom "Failed to load plugins, g:vimfilepath doesnt exist"
endif
