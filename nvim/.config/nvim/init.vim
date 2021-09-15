lua <<EOF
require('init')
require('lua-ls')
EOF

fun! TrimWhitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()
" autocmd FileType cpp setlocal commentstring=//\ %s
" autocmd FileType cpp,c setlocal commentstring=//\ %s
"
" set clipboard=unnamedplus
if !has('unix')
	let g:clipboard = {
			  \   'name': 'win32yank-wsl',
			  \   'copy': {
			  \      '+': 'win32yank.exe -i --crlf',
			  \      '*': 'win32yank.exe -i --crlf',
			  \    },
			  \   'paste': {
			  \      '+': 'win32yank.exe -o --lf',
			  \      '*': 'win32yank.exe -o --lf',
			  \   },
			  \   'cache_enabled': 0,
			  \ }
endif
