lua <<EOF
require('init')
require('lua-ls')
-- require('lsp/installer')
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

let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}
autocmd filetype cpp nnoremap <F10> :w !g++ -std=c++14 -O2 -Wall % -o %:r && %:r.exe
autocmd filetype cpp nnoremap <leader>br :w !g++ -std=c++14 -O2 -Wall % -o %:r && %:r
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
