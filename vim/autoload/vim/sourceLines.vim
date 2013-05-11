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
