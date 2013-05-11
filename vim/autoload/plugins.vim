function! plugins#LoadPlugins (plugpath)
	let l:files = split(glob(a:plugpath."*.vim"),"\n")
	for l:plug in l:files
		exec "source ".l:plug
	endfor
endfunction
