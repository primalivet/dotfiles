func findfunc#GitFiles(cmdarg, cmdcomplete)
		let fnames = systemlist('git ls-files --cached --others --exclude-standard')
		return fnames->filter('v:val =~? a:cmdarg')
endfunc

func findfunc#Find(cmdarg, cmdcomplete)
		let fnames = systemlist("find . -type d \\( -path '*/pack/user/*' -o -name .git -o -name node_modules \\) -prune -o -type f")
		return fnames->filter('v:val =~? a:cmdarg')
endfunc

