let g:inkscape_graphs_dir = "./Images/"
function! vim-inkscape-insert#Ink(image)
	if getcwd() !~ expand("%:p:h")
		cd %:p:h
	endif
	if !isdirectory(g:inkscape_graphs_dir)
	    call mkdir(g:inkscape_graphs_dir, "p")
	endif
	let b:inline = '![' . a:image . ']('. g:inkscape_graphs_dir . a:image . '.eps)\'
	call append(line('.'),b:inline)
	normal jo
	if filereadable(expand("~/.config/inkscape/templates/default.svg"))
		exe ":!cp ~/.config/inkscape/templates/default.svg" g:inkscape_graphs_dir . a:image . ".svg"
	elseif filereadable("/usr/share/inkscape/templates/default.svg")
		exe ":!cp /usr/share/inkscape/templates/default.svg" g:inkscape_graphs_dir . a:image . ".svg"
	else 
		finish
	endif
	exe ":!inkscape" g:inkscape_graphs_dir . a:image . ".svg"
endfunction

