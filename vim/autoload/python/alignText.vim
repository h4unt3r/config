vnoremap <leader>at <esc>:py alignText()<cr>gv
nnoremap <leader>at :py alignText()<cr>
python << EOF
import vim

DEBUG=True
def echom(obj):
	if DEBUG:
		vim.command("echom '%s'" % str(obj).replace("'","\""))

def alignText():
	import re
	PATTERN = r'(\S*?[\'"].*?["\']|\S+)(\s*)'
	tabStop = int(vim.eval("&ts"))
	noet = not bool(int(vim.eval("&et")))

	vim.command("'<")
	start = vim.current.window.cursor[0]
	vim.command("'>")
	end = vim.current.window.cursor[0]
	r = vim.current.buffer.range(start, end)

	if len(r) <= 1:
		return
	
	initLen = None
	maxLen = []
	for line in r:
		m = re.match(r'^(\s*)(.*)$', line)
		leading = len(m.groups()[0].replace('\t',' '*tabStop))
		if not m.groups()[1]:
			continue
		if initLen is None:
			initLen = leading
		elif initLen > leading:
			initLen = leading
		finds = re.findall(PATTERN, m.groups()[1])
		for i in xrange(len(finds)):
			find = finds[i]
			length = len(find[0]) + len(find[1].replace('\t', ' '*tabStop))
			if i == len(maxLen):
				maxLen.append(length)
			elif length > maxLen[i]:
				maxLen[i] = length
	
	for i in xrange(len(r)):
		line = r[i]
		m = re.match(r'^(\s*)(.*)$', line)
		padding = initLen * ' '
		if noet:
			padding = padding.replace(' '*tabStop, '\t')
		r[i] = padding
		finds = re.findall(PATTERN, m.groups()[1])
		for j in xrange(len(finds)):
			find = finds[j]
			padding = (' '*(maxLen[j] - len(find[0])))
			r[i] += find[0] + padding
	return
EOF
