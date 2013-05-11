" List of mappings
let g:plugmgr = {}
"function! g:plugmgr.listPlugins () dict
"	let l:plugstr = ""
"	for l:plug in keys(g:plugmgr)
"		l:map = 
"		let l:plugstr = l:plugstr.printf("%s\t%s\t%s\n",g:plug
"		
"endfunction

" Plugin paths
let g:vimplugpath = g:vimfilepath."plugin/vim/"
let g:pyplugpath = g:vimfilepath."plugin/python/"

" Needs work for multiple mappings in a file
function! ParseMappings (plug)
	let l:lines = readfile(a:plug)
	for l:line in l:lines
		let l:pattern = '\([vni]\)\=\(nore\)\=map\s\+\(.\{-}\)\s\+\(.*\)'
		if match(l:line, l:pattern) == 0
			let l:maps = []
			let l:matches = split(substitute(l:line,l:pattern,'\1\n\3\n\4',""),"\n")
			if len(l:matches) == 2
				let l:matches = ["a"] + l:matches
			endif
			call add(l:maps, {'command':l:matches[2],'map':l:matches[1], 'mode':l:matches[0]})
		endif
	endfor
	let g:plugmgr[a:plug] = l:maps
endfunction

function! LoadPlugins (plugpath)
	let l:files = split(glob(a:plugpath."*.vim"),"\n")
	for l:plug in l:files
"		echom l:plug
		exec "source ".l:plug
"		call ParseMappings(l:plug)
	endfor
endfunction
