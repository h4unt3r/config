syn on
set bg=dark
set ts=4 sw=4 noet
set nowrap
set nobackup
set mouse=""
set backspace=indent

" Auto save/load views
autocmd BufWinLeave ?* mkview
autocmd BufWinEnter ?* silent loadview

" Use foldmarkers...
set foldmethod=marker
if &ft == "vim"
    set cms="\ FOLD\ %s
elseif &ft == "maxscript"
    set cms=\-\-\ FOLD\ %s
elseif &ft == "python"
    set cms=#\ FOLD\ %s
else
    set cms=//\ FOLD\ %s
endif

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

"   Maxscript commenting
nnoremap <leader>c <home>i--<esc>j<home>
nnoremap <leader>u <home>xx<esc>j<home>
"   Python commenting
"nnoremap <leader>c <home>i#<esc>j<home>
"nnoremap <leader>u <home>x<esc>j<home>
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
