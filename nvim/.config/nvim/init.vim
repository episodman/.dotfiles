lua <<EOF
require('init')
EOF

fun! TrimWhitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()
" autocmd FileType cpp setlocal commentstring=//\ %s
" autocmd FileType cpp,c setlocal commentstring=//\ %s
