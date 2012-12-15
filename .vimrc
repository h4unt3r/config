syn on
set bg=dark
set ts=4 sw=4 noet
set nowrap
set nobackup
set mouse=n
set backspace=indent

" Auto save/load views
autocmd BufWinLeave ?* mkview
autocmd BufWinEnter ?* silent loadview

" Source visually selected lines
function! SourceLines () range
	if a:firstline == a:lastline
		let s:cmd = getline(a:firstline)
	else
		let s:cmd = join(getline(a:firstline, a:lastline), "\n")
	endif
	exec s:cmd
endfunction
nnoremap <leader>so :call SourceLines()<cr>
vnoremap <leader>so :call SourceLines()<cr>

" Use foldmarkers...
set foldmethod=marker
function! SetCMS ()
	if &ft == "vim"
		let comment='"'
	elseif &ft == "maxscript"
		let comment='--'
	elseif &ft == "python"
		let comment='#'
	else
		let comment='//'
	endif
	exec 'set cms='.comment.'\ FOLD\ %s'
	exec 'nnoremap <leader>c 0i'.comment.'<esc>j'
	exec 'nnoremap <leader>u 0'.strlen(comment).'xj'
endfunction
autocmd FileType ?* call SetCMS()

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

if has("python")
python << EOF
def loadPlugins():
	import vim
	import glob
	PLUGINPATH = vim.eval("$HOME") + "/.vimfiles/plugin/python"
	plugins = glob.glob("%s/*.vim" % PLUGINPATH)
	for plug in plugins:
		try: vim.command("source %s" % plug)
		except vim.error:
			vim.command("echom 'Failed to import %s'" % plug)

loadPlugins()
EOF
else
	echom "No python, cant load python plugins! :0"
endif
