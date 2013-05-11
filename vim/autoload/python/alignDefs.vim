vnoremap <leader>ad <esc>:py alignDefs()<cr>gv
nnoremap <leader>ad :py alignDefs()<cr>
python << EOF
import vim

DEBUG=True
def echom(obj):
	if DEBUG:
		vim.command("echom '%s'" % str(obj).replace("'","\""))

def alignDefs():
	import re
	PATTERN = r'(\s*)(.*?)(\s*)[=]\s*(.*?)\s*$'
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
	maxLen = 1
	for line in r:
		m = re.match(PATTERN, line)
		if m is None:
			continue
		before,dec,padding,after = m.groups()
		leading = len(before.replace('\t', ' '*tabStop))
		if not dec and not after:
			continue
		if initLen is None:
			initLen = leading
		elif initLen > leading:
			initLen = leading
		length = len(dec)
		if length > maxLen:
			maxLen = length
	
	for i in xrange(len(r)):
		line = r[i]
		m = re.match(PATTERN, line)
		if not m:
			continue
		before,dec,padding,after = m.groups()
		before = ' '*initLen
		if noet:
			before = before.replace(' '*tabStop, '\t')
		padding = ' ' * (maxLen - len(dec))
		r[i] = before + dec + padding + ' = ' + after
EOF
