" Use foldmarkers...
set foldmethod=marker
let g:cmarker = ""
function! SetCMS ()
	if &ft == "vim"
		let g:cmarker='"'
	elseif &ft == "maxscript"
		let g:cmarker='--'
	elseif &ft == "python"
		let g:cmarker='#'
	else
		let g:cmarker='//'
	endif
	exec 'set cms='.g:cmarker.'\ FOLD\ %s'
	exec 'nnoremap <leader>c 0i'.g:cmarker.'<esc>j'
	exec 'nnoremap <leader>u 0'.strlen(g:cmarker).'xj'
endfunction
autocmd FileType ?* call SetCMS()
