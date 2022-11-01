vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<leader>prw', ':CocSearch <C-R>=expand("<cword>")<CR><CR>',{noremap = true})
vim.api.nvim_set_keymap('n', '<leader>pw', ':Rg <C-R>=expand("<cword>")<CR><CR>',{noremap = true})
vim.api.nvim_set_keymap('n', '<leader>phw', ':h <C-R>=expand("<cword>")<CR><CR>',{noremap = true})
vim.api.nvim_set_keymap('n', '<leader>h', ':wincmd h<CR>',{noremap = true})
vim.api.nvim_set_keymap('n', '<leader>2h', ':wincmd 2h<CR>',{noremap = true})
vim.api.nvim_set_keymap('n', '<leader>j', ':wincmd j<CR>',{noremap = true})
vim.api.nvim_set_keymap('n', '<leader>k', ':wincmd k<CR>',{noremap = true})
vim.api.nvim_set_keymap('n', '<leader>l', ':wincmd l<CR>',{noremap = true})
vim.api.nvim_set_keymap('n', '<leader>2l', ':wincmd 2l<CR>',{noremap = true})
vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeShow<CR>',{noremap = true})
-- "nnorevim.api.nvim_set_keymap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
-- "nnorevim.api.nvim_set_keymap <leader>pv :NERDTreeToggle<CR>
-- vim.api.nvim_set_keymap('n', '<leader>t', ':NERDTreeToggle<CR>',{noremap = true})
vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>',{noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>ps', ':Rg<SPACE>',{noremap = true})
vim.api.nvim_set_keymap('n', '<C-p>', ':GFiles<CR>',{noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>pf', ':Files<CR>',{noremap = true})
--vim.api.nvim_set_keymap('n', '<Leader><CR>', ':so ~/.config/nvim/init.lua<CR>',{noremap = true})
vim.api.nvim_set_keymap('n', '<Leader><CR>', ':so ~/.config/nvim/init.vim<CR>',{noremap = true})

vim.api.nvim_set_keymap('n', '<leader>settag', ':!ctags -R --exclude=oe-logs --exclude=oe-workdir --exclude=env --exclude=venv3 --exclude=.ccls-cache --exclude=resources<CR>',{noremap = true})
vim.api.nvim_set_keymap('n', '<leader>sync', ':set tags=$PWD/tags<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F5>', ':!ctags -R --exclude=oe-logs --exclude=oe-workdir --exclude=env --exclude=tests --exclude=venv3 --exclude=.ccls-cache --exclude=resources<CR>',{noremap = true})
vim.api.nvim_set_keymap('n', '<F6>', ':set tags=$PWD/tags<CR>',{noremap = true})
vim.api.nvim_set_keymap('n', '<F3>', ':vimgrep /<C-r><C-w>/gj **/*<CR>',{noremap = true})

vim.api.nvim_set_keymap('n', '<Leader>+', ':vertical resize +5<CR>',{noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>-', ':vertical resize -5<CR>',{noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>ee', 'oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>',{noremap = true})
-- nnorevim.api.nvim_set_keymap '<Leader><CR>' ':so ~/.config/nvim/init.vim<CR>''
-- "nnorevim.api.nvim_set_keymap <Leader><CR> :so ~/.vimrc<CR>
-- "nnorevim.api.nvim_set_keymap <Leader><CR> :so ~/config/nvim/init.vim<CR>
vim.api.nvim_set_keymap('v', 'J', ':m \'>+1<CR>gv=gv',{noremap = true})
vim.api.nvim_set_keymap('v', 'K', ':m \'>-2<CR>gv=gv',{noremap = true})
vim.api.nvim_set_keymap('n', '<F9>', ':Tlist<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<silent> <F9>', ':Rgrep<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>q',':q<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>w',':wa<CR>')
vim.api.nvim_set_keymap('n', '<leader>w',':w<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>x',':bdelete<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>q',':bdelete<CR>')
-- vim.api.nvim_set_keymap('n', '<leader>q',':bdelete<CR>')
-- " next greatest revim.api.nvim_set_keymap ever : asbjornHaland
-- nnorevim.api.nvim_set_keymap <leader>y "+y
-- vnorevim.api.nvim_set_keymap <leader>y "+y
-- nnorevim.api.nvim_set_keymap <leader>Y gg"+yG

-- nnorevim.api.nvim_set_keymap <leader>d "_d
-- vnorevim.api.nvim_set_keymap <leader>d "_d
-- " Start interactive EasyAlign in visual mode (e.g. vipga)
-- vim.api.nvim_set_keymap('x', 'ga','<Plug>(EasyAlign)')
-- vim.api.nvim_set_keymap('n', 'ga','<Plug>(EasyAlign)')
vim.api.nvim_set_keymap('v', 'X', '"_d', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>', {noremap = true})
vim.api.nvim_set_keymap('i', 'ii', '<Esc>', {noremap = true})
-- vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {noremap = true})
vim.api.nvim_set_keymap('v', 'ii', '<Esc>', {noremap = true})
-- vim.api.nvim_set_keymap('v', 'jk', '<Esc>', {noremap = true})
-- vim.api.nvim_set_keymap('n', 'jk', '<Esc>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-space>', 'coc#refresh()', {expr = true})

-- " GoTo code navigation.
-- vim.api.nvim_set_keymap('n', '<leader>gd', '<Plug>(coc-definition)')
-- vim.api.nvim_set_keymap('n', '<leader>gy', '<Plug>(coc-type-definition)')
-- vim.api.nvim_set_keymap('n', '<leader>gi', '<Plug>(coc-implementation)')
-- vim.api.nvim_set_keymap('n', '<leader>gr', '<Plug>(coc-references)')
-- vim.api.nvim_set_keymap('n', '<leader>rr', '<Plug>(coc-rename)')
-- vim.api.nvim_set_keymap('n', '<leader>g[', '<Plug>(coc-diagnostic-prev)')
-- vim.api.nvim_set_keymap('n', '<leader>g]', '<Plug>(coc-diagnostic-next)')
-- vim.api.nvim_set_keymap('n', '<silent> <leader>gp', '<Plug>(coc-diagnostic-prev-error)')
-- vim.api.nvim_set_keymap('n', '<silent> <leader>gn', '<Plug>(coc-diagnostic-next-error)')
-- vim.api.nvim_set_keymap('n', '<leader>cr', ':CocRestart', {noremap = true})


-- " Sweet Sweet FuGITive
vim.api.nvim_set_keymap('n', '<leader>gh', ':diffget //3<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gu', ':diffget //2<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gs', ':G<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<C-c>', '"+y', {noremap = true})
vim.api.nvim_set_keymap('n', 'yy', '"+yy', {noremap = true})
vim.api.nvim_set_keymap('n', 'y', '"+y', {noremap = true})
vim.api.nvim_set_keymap('n', 'Y', '"+y$', {noremap = true})
vim.api.nvim_set_keymap('n', 'x', '"+x', {noremap = true})
vim.api.nvim_set_keymap('n', 'D', '"+D', {noremap = true})
vim.api.nvim_set_keymap('n', 'dd', '"+dd', {noremap = true})


vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

-- for telescope
--
vim.api.nvim_set_keymap('n', '<leader>pf', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-p>', [[<cmd>lua require('telescope.builtin').git_files({previewer = false, layout_config = {width = 0.5}})<cr>]], { noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<C-p>', [[<cmd>lua require('telescope.builtin').git_files()<cr>]], { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<C-p>', [[<cmd>lua require('telescope.builtin').git_files()<cr>]], {})
vim.api.nvim_set_keymap('n', '<leader>pb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>pw', [[<cmd>lua require('telescope.builtin').grep_string{ search = vim.fn.expand("<cword>")}<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ps', [[<cmd>lua require('telescope.builtin').grep_string{ search = vim.fn.input("Grep for > ")}<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>o', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<cr>]], { noremap = true, silent = true})


-- harpoon
-- local nnoremap = require("theprimeagen.keymap").nnoremap
-- local silent = { silent = true }

-- Terminal commands
-- ueoa is first through fourth finger left hand home row.
-- This just means I can crush, with opposite hand, the 4 terminal positions
--
-- These functions are stored in harpoon.  A plugn that I am developing
--
--
--
-- nnoremap("<leader>a", function() require("harpoon.mark").add_file() end, silent)
-- nnoremap("<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, silent)
-- 
-- nnoremap("<C-h>", function() require("harpoon.ui").nav_file(1) end, silent)
-- nnoremap("<C-t>", function() require("harpoon.ui").nav_file(2) end, silent)
-- nnoremap("<C-n>", function() require("harpoon.ui").nav_file(3) end, silent)
-- nnoremap("<C-s>", function() require("harpoon.ui").nav_file(4) end, silent)
--[[ vim.api.nvim_set_keymap('n', '<leader>f',
  <cmd>function()
    vim.lsp.buf.format()
  end , { noremap = true, silent = true}) ]]


vim.api.nvim_set_keymap('n', '<leader>f', [[<cmd>lua vim.lsp.buf.format()<cr>]], { noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>a', [[<cmd>lua require("harpoon.mark").add_file()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-e>', [[<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>]], { noremap = true, silent = true})


vim.api.nvim_set_keymap('n', '<C-h>', [[<cmd>lua require("harpoon.ui").nav_file(1)<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-t>', [[<cmd>lua require("harpoon.ui").nav_file(2)<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-n>', [[<cmd>lua require("harpoon.ui").nav_file(3)<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-s>', [[<cmd>lua require("harpoon.ui").nav_file(4)<cr>]], { noremap = true, silent = true})









vim.cmd 'au FileType json noremap <buffer> <F8> :%!python -m json.tool <CR>'
vim.cmd 'au FileType python noremap <buffer> <F8> :call Autopep8()<CR>'
vim.cmd 'au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown'
vim.cmd 'au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif'
vim.cmd 'au BufWritePost plugins.lua PackerCompile'
vim.cmd 'au FileType python noremap <buffer> <F8> :call Autopep8()<CR>'

vim.cmd 'au Filetype json let g:indentLine_enabled = 0' -- " Override LineNr

vim.g.indentLine_color_gui = '#808080'
vim.g.indentLine_showFirstIndentLevel = 1
-- vim.g.indentLine_char = 'c'
vim.g.indentLine_defaultGroup = 'SpecialKey'
vim.g.indentLine_concealcursor = 'inc'
vim.g.indentLine_conceallevel = 2
vim.g.vim_json_conceal=0
vim.g.vim_json_syntax_conceal = 0
vim.opt.listchars:append("eol:↴")

vim.opt.clipboard='unnamedplus'


