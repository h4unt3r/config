" Use foldmarkers...
set foldmethod=marker
let g:cmarker = ""
function! SetCMS ()
	if &ft == "vim"
		let g:cmarker='"'
	elseif &ft == "maxscript"
		let g:cmarker='--'
	elseif &ft == "python" || &ft == "sh"
		let g:cmarker='#'
	else
		let g:cmarker='//'
	endif
	exec 'set cms='.g:cmarker.'\ FOLD\ %s'
	exec 'nnoremap <leader>c 0i'.g:cmarker.'<esc>j'
	exec 'nnoremap <leader>u 0'.strlen(g:cmarker).'xj'
	vnoremap <leader>c <esc>'<'>o*/<esc>''O/*<esc>''
	vnoremap <leader>u <esc>?\/*<CR>dd/*\/<CR>dd''
	vnoremap <leader>cr <esc>'<'>o*/<esc>''O/*<esc>''
	vnoremap <leader>ur <esc>?\/*<CR>dd/*\/<CR>dd''
endfunction
autocmd FileType ?* call SetCMS()
