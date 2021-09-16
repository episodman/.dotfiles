-------------------- HELPERS -------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

opt.syntax = 'on'
opt.relativenumber = true
opt.hlsearch = true
opt.hidden = true
opt.tabstop=4
opt.softtabstop=4
opt.shiftwidth=4
opt.expandtab = true
opt.smartindent = true
opt.nu = true
opt.smartcase = true
vim.cmd [[set nobackup]]
vim.cmd [[set noswapfile]]
--opt.undodir=~/.vim/undodir
opt.undodir='~/.vim/undodir'
opt.undofile = true
opt.incsearch = true
opt.termguicolors = true
opt.scrolloff=8
opt.ignorecase = true
vim.cmd [[set t_Co=256]]
vim.cmd [[set nowrap]]
vim.cmd [[set noimd]]
vim.cmd [[set cul]]
opt.cmdheight=2


-- " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- " delays and poor user experience.
opt.updatetime=50
opt.colorcolumn='80'
-- " Don't pass messages to |ins-completion-menu|.
vim.cmd [[set shortmess+=c]]

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- dracula
-- cmd 'au ColorScheme * highlight LineNr guifg=#ff79c6' -- " Override LineNr
-- cmd 'au ColorScheme * highlight CursorLineNr guifg=#50fa7b' --" Override CursorLineNr
-- cmd 'au ColorScheme * highlight Comment gui=italic'

-- gruvbox & nightfox
cmd 'au ColorScheme * highlight LineNr guifg=#d3869b' -- " Override LineNr
cmd 'au ColorScheme * highlight CursorLineNr guifg=#fabd2f' --" Override CursorLineNr
cmd 'au ColorScheme * highlight Comment gui=italic'

cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
-- " Theme
paq {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
paq {'Mofiqul/dracula.nvim'}
paq {'folke/tokyonight.nvim'}
paq {'ful1e5/onedark.nvim'}
paq {'EdenEast/nightfox.nvim'}
paq {'shaunsingh/nord.nvim'}
paq {'marko-cerovac/material.nvim'}
paq {'ackyshake/Spacegray.vim'}
paq {'habamax/vim-polar'}
paq {'tomasr/molokai'}
paq {'altercation/vim-colors-solarized'}
paq {'NLKNguyen/papercolor-theme'}
paq {'herrbischoff/cobalt2.vim'}

-- utils
paq {'psliwka/vim-smoothie'}
paq {'flazz/vim-colorschemes'}
paq {'Vimjas/vim-python-pep8-indent'}
-- paq {'jiangmiao/auto-pairs'}
paq {'windwp/nvim-autopairs'}
paq {'tell-k/vim-autopep8'}
paq {'dart-lang/dart-vim-plugin'}
paq {'preservim/nerdcommenter'}
paq {'tpope/vim-surround'}
paq {'iamcco/markdown-preview.nvim', run = fn['mkdp#util#install()']}
paq {'preservim/nerdtree'}
paq {'rainux/vim-desert-warm-256'}
paq {'rakr/vim-one'}
paq {'iamcco/markdown-preview.vim'}
paq {'iamcco/mathjax-support-for-mkdp'}
paq {'justinmk/vim-sneak'}
paq {'b3nj5m1n/kommentary'}
paq {'godlygeek/tabular'}
paq {'plasticboy/vim-markdown'}
paq {'tiagofumo/vim-nerdtree-syntax-highlight'}
paq {'ryanoasis/vim-devicons'}
paq {'Yggdroot/indentLine'}
paq {'junegunn/vim-easy-align'}
-- paq {'neoclide/coc.nvim', branch = 'release'}
paq {'tweekmonster/gofmt.vim'}
paq {'tpope/vim-fugitive'}
paq {'vim-utils/vim-man'}
paq {'mbbill/undotree'}
paq {'sheerun/vim-polyglot'}
paq {'junegunn/fzf', run = fn['fzf#install()']}
paq {'junegunn/fzf.vim'}
-- note taking
-- paq {'oberblastmeister/neuron.nvim'}
-- "5.0
--
paq {'hrsh7th/vim-vsnip'}
paq {'hrsh7th/vim-vsnip-integ'}
paq {'neovim/nvim-lspconfig'}
-- paq {'hrsh7th/nvim-compe'}
-- auto completion
paq {'hrsh7th/nvim-cmp'}
paq {'hrsh7th/cmp-nvim-lsp'}
paq {'hrsh7th/vim-vsnip'}
paq {'hrsh7th/cmp-buffer'}
paq {'saadparwaiz1/cmp_luasnip'}
paq {'L3MON4D3/LuaSnip'}

paq {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
paq {'karb94/neoscroll.nvim'}
paq {'ray-x/lsp_signature.nvim'}
paq {'nvim-treesitter/nvim-treesitter', run = fn['TSUpdate']}
-- paq {'nvim-lua/completion-nvim'}
paq {'nvim-lua/popup.nvim'}
paq {'nvim-lua/plenary.nvim'}
paq {'nvim-telescope/telescope.nvim'}
paq {'nvim-telescope/telescope-fzy-native.nvim'}
paq {'nvim-treesitter/playground'}
g['deoplete#enable_at_startup'] = 1  -- e


vim.g.rainbow_active = 0
vim.g.coc_node_path = '/usr/bin/node'

-- The Greatest plugin of all time.  I am not bias
vim.g.vim_be_good_floating = 1
-- auto-pair
-- vim.g.AutoPairsShortcutToggle='<M-t>'
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})

--- ctrlp
cmd 'set wildignore+=*/tmp/*,*.so,*\\tmp\\*,*.swp,*.zip,*.exe'
cmd 'set wildignore+=build*/**,oe*/**,*env*/**,env/**,venv3/**,env/*,venv3/*,tags'

-- " --- vim go (polyglot) settings.
vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_methods = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_structs = 1
vim.g.go_highlight_types = 1
vim.g.go_highlight_function_parameters = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_generate_tags = 1
vim.g.go_highlight_format_strings = 1
vim.g.go_highlight_variable_declarations = 1
vim.g.go_auto_sameids = 1
--- coc
vim.g.coc_disable_startup_warning = 1
--- vim python
vim.g.python_highlight_all = 1
-- " let g:autopep8_on_save = 1
vim.g.autopep8_disable_show_diff=1
vim.g.autopep8_max_line_length=79

cmd 'au FileType python noremap <buffer> <F8> :call Autopep8()<CR>'

-- " --- netrw
vim.g.netrw_liststyle=3
vim.g.netrw_altv = 1
-- Example config in Lua
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme
-- vim.cmd[[colorscheme tokyonight]]



local nightfox = require('nightfox').load()
local nightfox = require('nightfox')
nightfox.setup(
	{
	  -- fox = "palefox", -- change the colorscheme to use nordfox
	  fox = "nightfox", -- change the colorscheme to use nordfox
	  -- fox = "nordfox", -- change the colorscheme to use nordfox
	  styles = {
		strings = "italic", -- Style that is applied to strings: see `highlight-args` for options
		comments = "italic", -- change style of comments to be italic
		keywords = "italic", -- change style of keywords to be bold
		variables = "italic", -- change style of keywords to be bold
		--functions = "italic,bold" -- styles can be a comma separated list
	  },
	  colors = {
		red = "#FF000", -- Override the red color for MAX POWER
		bg_alt = "#000000",
	  },
	  hlgroup = {
		TSPunctDelimiter = { fg = "${red}" }, -- Override a highlight group with the color red
		LspCodeLens = { bg = "#000000" },
	  }
	}
)
nightfox.load()

require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = "nightfox"
    -- theme = "dracula"
  },
  extensions = {'quickfix'}
}


-- Example config in lua

-- cmd 'colorscheme tokyonight'
-- "set termguicolors     " enable true colors support
-- "let ayucolor="dark" " for mirage version of theme
-- " IndentLine {{
-- " let g:indentLine_char = ''
-- " let g:indentLine_first_char = ''
-- vim.g.indentLine_char_list = [['|', '¦', '┆', '┊']]
-- vim.g.indentLine_char_list = [['¦', '┆', ]]
vim.g.indentLine_showFirstIndentLevel = 1
-- vim.g.indentLine_char = 'c'
vim.g.indentLine_defaultGroup = 'SpecialKey'
vim.g.indentLine_concealcursor = 'inc'
vim.g.indentLine_conceallevel = 2
-- " let g:indentLine_setColors = 0
-- " let g:smoothie_enabled = 1
-- " }}

vim.g.smoothie_enabled = 0
-- " colorscheme gruvbox
opt.background='dark'
vim.g.dracula_termcolors=256
vim.g.dracula_term_italic=1
vim.g.dracula_italic=1

vim.g.dracula_allow_italics = 1
vim.g.gruvbox_italic = 1
vim.g.gruvbox_contrast_dark = 'hard'
-- vim.cmd[[colorscheme gruvbox]]
-- vim.g.gruvbox_allow_italics = 1
-- vim.cmd[[colorscheme dracula]]

-- if executable('rg')
--     set grepprg=rg\ --vimgrep\ --no-heading
--     set grepformat=%f:%l:%c:%m,%f:%l:%m
--     let g:rg_derive_root='true'
-- endif

-- Markdown
vim.g.mkdp_path_to_chrome = "/usr/bin/firefox"
vim.g.loaded_matchparen = 1
vim.g.mapleader = " "
vim.g.netrw_browse_split = 2
vim.g.vrfr_rg = 'true'
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- note taking
-- require'neuron'.setup {
--     virtual_titles = true,
--     mappings = true,
--     run = nil, -- function to run when in neuron dir
--     neuron_dir = "~/neuron", -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
--     leader = "gz", -- the leader key to for all mappings, remember with 'go zettel'
-- }


-- " FZF
vim.g.fzf_tags_command = 'ctags -R'
-- " Border color
-- TODO
--vim.g.fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
--
-- " let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'file {}'"
-- vim.g.$FZF_DEFAULT_COMMAND="rg --files --hidden"
-- vim.g.$FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

-- "Get Files
-- command! -bang -nargs=? -complete=dir Files
--     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

-- " Get text in files with Rg
-- command! -bang -nargs=* Rg
--   \ call fzf#vim#grep(
--   \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
--   \   fzf#vim#with_preview(), <bang>0)

-- " Ripgrep advanced
-- function! RipgrepFzf(query, fullscreen)
--   let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
--   let initial_command = printf(command_fmt, shellescape(a:query))
--   let reload_command = printf(command_fmt, '{q}')
--   let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
--   call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
-- endfunction

-- command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

-- " Git grep
-- command! -bang -nargs=* GGrep
--   \ call fzf#vim#grep(
--   \   'git grep --line-number '.shellescape(<q-args>), 0,
--   \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

map('n', '<leader>prw', ':CocSearch <C-R>=expand("<cword>")<CR><CR>',{noremap = true})
map('n', '<leader>pw', ':Rg <C-R>=expand("<cword>")<CR><CR>',{noremap = true})
map('n', '<leader>phw', ':h <C-R>=expand("<cword>")<CR><CR>',{noremap = true})
map('n', '<leader>h', ':wincmd h<CR>',{noremap = true})
map('n', '<leader>j', ':wincmd j<CR>',{noremap = true})
map('n', '<leader>k', ':wincmd k<CR>',{noremap = true})
map('n', '<leader>l', ':wincmd l<CR>',{noremap = true})
map('n', '<leader>u', ':UndotreeShow<CR>',{noremap = true})
-- "nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
-- "nnoremap <leader>pv :NERDTreeToggle<CR>
map('n', '<leader>t', ':NERDTreeToggle<CR>',{noremap = true})
map('n', '<Leader>ps', ':Rg<SPACE>',{noremap = true})
map('n', '<C-p>', ':GFiles<CR>',{noremap = true})
map('n', '<Leader>pf', ':Files<CR>',{noremap = true})
--map('n', '<Leader><CR>', ':so ~/.config/nvim/init.lua<CR>',{noremap = true})
map('n', '<Leader><CR>', ':so ~/.config/nvim/init.vim<CR>',{noremap = true})

map('n', '<leader>settag', ':!ctags -R --exclude=oe-logs --exclude=oe-workdir --exclude=env --exclude=venv3<CR>',{noremap = true})
map('n', '<leader>sync', ':set tags=$PWD/tags<CR>')
map('n', '<F5>', ':!ctags -R --exclude=oe-logs --exclude=oe-workdir --exclude=env --exclude=venv3<CR>',{noremap = true})
map('n', '<F6>', ':set tags=$PWD/tags<CR>',{noremap = true})
map('n', '<F3>', ':vimgrep /<C-r><C-w>/gj **/*<CR>',{noremap = true})

map('n', '<Leader>+', ':vertical resize +5<CR>',{noremap = true})
map('n', '<Leader>-', ':vertical resize -5<CR>',{noremap = true})
map('n', '<Leader>ee', 'oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>',{noremap = true})
-- nnoremap '<Leader><CR>' ':so ~/.config/nvim/init.vim<CR>''
-- "nnoremap <Leader><CR> :so ~/.vimrc<CR>
-- "nnoremap <Leader><CR> :so ~/config/nvim/init.vim<CR>
map('v', 'J', ':m \'>+1<CR>gv=gv',{noremap = true})
map('v', 'K', ':m \'>-2<CR>gv=gv',{noremap = true})
map('n', '<F9>', ':Tlist<CR>')
map('n', '<silent> <F9>', ':Rgrep<CR>')

map('n', '<leader>q',':q<CR>')
map('n', '<leader>w',':w<CR>')
-- " next greatest remap ever : asbjornHaland
-- nnoremap <leader>y "+y
-- vnoremap <leader>y "+y
-- nnoremap <leader>Y gg"+yG

-- nnoremap <leader>d "_d
-- vnoremap <leader>d "_d
-- " Start interactive EasyAlign in visual mode (e.g. vipga)
map('x', 'ga','<Plug>(EasyAlign)')
map('n', 'ga','<Plug>(EasyAlign)')
-- "
cmd 'au Filetype cpp setlocal expandtab tabstop=4 shiftwidth=4'
cmd 'au Filetype python setlocal expandtab tabstop=4 shiftwidth=4'

require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}
vim.g.vim_be_good_log_file = 1
vim.g.vim_apm_log = 1


map('v', 'X', '"_d', {noremap = true})
map('i', '<C-c>', '<Esc>', {noremap = true})
map('i', 'ii', '<Esc>', {noremap = true})

-- TODO:
-- function! s:check_back_space() abort
--  let col = col('.') - 1
--      return !col || getline('.')[col - 1]  =~# '\s'
-- endfunction

-- inoremap <silent><expr> <TAB>
-- 	\ pumvisible() ? "\<C-n>" :
-- 	\ <SID>check_back_space() ? "\<TAB>" :
-- 	\ coc#refresh()

--inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
--inoremap <silent><expr> <C-space> coc#refresh()
-- map('i', '<expr><S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<C-space>', 'coc#refresh()', {expr = true})

-- " GoTo code navigation.
-- map('n', '<leader>gd', '<Plug>(coc-definition)')
-- map('n', '<leader>gy', '<Plug>(coc-type-definition)')
-- map('n', '<leader>gi', '<Plug>(coc-implementation)')
-- map('n', '<leader>gr', '<Plug>(coc-references)')
-- map('n', '<leader>rr', '<Plug>(coc-rename)')
-- map('n', '<leader>g[', '<Plug>(coc-diagnostic-prev)')
-- map('n', '<leader>g]', '<Plug>(coc-diagnostic-next)')
-- map('n', '<silent> <leader>gp', '<Plug>(coc-diagnostic-prev-error)')
-- map('n', '<silent> <leader>gn', '<Plug>(coc-diagnostic-next-error)')
-- map('n', '<leader>cr', ':CocRestart', {noremap = true})


-- " Sweet Sweet FuGITive
map('n', '<leader>gh', ':diffget //3<CR>')
map('n', '<leader>gu', ':diffget //2<CR>')
map('n', '<leader>gs', ':G<CR>')

map('n', '<C-c>', '"+y', {noremap = true})
map('n', 'yy', '"+yy', {noremap = true})
map('n', 'y', '"+y', {noremap = true})
map('n', 'Y', '"+y$', {noremap = true})
map('n', 'x', '"+x', {noremap = true})
map('n', 'D', '"+D', {noremap = true})
map('n', 'dd', '"+dd', {noremap = true})
opt.clipboard='unnamedplus'

cmd 'au FileType json noremap <buffer> <F8> :%!python -m json.tool <CR>'
cmd 'au FileType python noremap <buffer> <F8> :call Autopep8()<CR>'

-- vim.cmd [[autocmd FileType cpp setlocal commentstring=//\ %s]]

-- vim.cmd ['au BufWritePre * :call TrimWhitespace()'
-- cmd 'au BufWritePost * :call TrimWhitespace()'
-- vim.cmd [[au BufWritePost "*" :call %s/\s\+$//e]]
--
--
-- vim.cmd {"BufWritePost", "*", ":call %s/\s\+$//e"}
-- cmd 'au BufWritePost * :call %s/\\s\\+$//ge'
-- cmd [[au BufWritePost * :call %s/\\s\\+$//ge]]

-- "autocmd BufWritePre * :%s///e
cmd 'au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown'
cmd 'au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif'
cmd 'au BufWritePost plugins.lua PackerCompile'
-- " Use completion-nvim in every buffer
-- TODO:
-- cmd 'au BufEnter * lua require"completion".on_attach()'
-- vim.g.completion_enable_auto_popup = 1
-- " Use <Tab> and <S-Tab> to navigate through popup menu
-- " Set completeopt to have a better completion experience
opt.completeopt="menuone,noinsert,noselect"

-- " Avoid showing message extra message when using completion
--opt.shortmess+=c
vim.g.completion_matching_strategy_list = [['exact', 'substring', 'fuzzy', 'all']]
vim.g.completion_trigger_character = [['.', '::']]

-- " Completion
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])

--[[ require("onedark").setup({
  functionStyle = "italic",
  sidebars = {"qf", "vista_kind", "terminal", "packer"},

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = "orange", error = "#ff0000"}
}) ]]

-- require('kommentary.config').use_extended_mappings()
vim.api.nvim_set_keymap("n", "gcc", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "gc", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("v", "gc", "<Plug>kommentary_visual_default<C-c>", {})


require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

-- Auto compeletion
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lua' },
    { name = 'buffer' },
  },
}


-- LSP config
local nvim_lsp = require('lspconfig')
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

 -- Enable completion triggered by <c-x><c-o>
 buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

 -- Mappings.
 local opts = { noremap=true, silent=true }
 -- See `:help vim.lsp.*` for documentation on any of the below functions
 buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
 buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
 buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
 buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
 buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
 buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
 buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
 buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
 buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
 buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
 buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
 buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
 buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
 buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
 buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
 buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
 buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'clangd', 'jsonls'}
for _, lsp in ipairs(servers) do
 nvim_lsp[lsp].setup {
   on_attach = on_attach,
   flags = {
     debounce_text_changes = 150,
   }
 }
end
require'lspconfig'.jsonls.setup {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}
--
-- require'lspconfig'.pyright.setup{}
-- require'lspconfig'.clangd.setup{}
--
-- LSP signature
cfg = {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
               -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 2, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                 -- set to 0 if you DO NOT want any API comments be shown
                 -- This setting only take effect in insert mode, it does not affect signature help in normal
                 -- mode, 10 by default

  floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
  fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
  hint_enable = true, -- virtual hint enable
  hint_prefix = "🐼 ",  -- Panda for parameter
  hint_scheme = "String",
  use_lspsaga = false,  -- set to true if you want to use lspsaga popup
  hi_parameter = "Search", -- how your parameter will be highlight
  max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
                   -- to view the hiding contents
  max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
  transpancy = 10, -- set this value if you want the floating windows to be transpant (100 fully transpant), nil to disable(default)
  handler_opts = {
    border = "shadow"   -- double, single, shadow, none
  },

  trigger_on_newline = false, -- set to true if you need multiple line parameter, sometime show signature on new line can be confusing, set it to false for #58
  extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  -- deprecate !!
  -- decorator = {"`", "`"}  -- this is no longer needed as nvim give me a handler and it allow me to highlight active parameter in floating_window
  zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
  debug = false, -- set to true to enable debug logging
  log_path = "debug_log_file_path", -- debug log path

  padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

  shadow_blend = 36, -- if you using shadow as border use this set the opacity
  shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  toggle_key = nil -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
}

require'lsp_signature'.on_attach(cfg, bufnr) -- no need to specify bufnr if you don't use toggle_key

require('neoscroll').setup()

require('kommentary.config').configure_language(
  "default", {
    prefer_single_line_comments = true,
  },
  "cpp", {
    single_line_comment_string = "//",
  },
  "c", {
    single_line_comment_string = "//",
  }
)

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false -- Whether the query persists across vim sessions
  }
}

local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = '> ',
    --prompt_prefix = '🔍 ',
    color_devicons = true,

    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    set_env = { ['COLORTERM'] = 'truecolor' },
    --layout_strategy = "center",
    layout_strategy = "horizontal",
    sorting_strategy = "ascending",
    --theme = "dropdown",
    layout_config = {
        preview_width = 0.6,
        width = 0.9,
        prompt_position = 'top',
    },

    mappings = {
      i = {
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-x>"] = false,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<C-c>"] = actions.close,
        ["<Esc>"] = actions.close,
      },
      n = {
        ["<C-q>"] = actions.send_to_qflist+ actions.open_qflist,
        ["<C-w>"] = actions.send_selected_to_qflist+ actions.open_qflist,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-x>"] = false,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<C-c>"] = actions.close,
        ["<Esc>"] = actions.close
      }
    },
    generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
  },
  extensions = {
      fzy_native = {
        --fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = false, -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        -- case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                     -- the default case_mode is "smart_case"
      }
  }
}

require('telescope').load_extension('fzy_native')
-- require("telescope").load_extension("git_worktree")
-- require("telescope").load_extension("fzy_native")
-- Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader>pf', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<C-p>', [[<cmd>lua require('telescope.builtin').git_files({previewer = false})<cr>]], { noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<C-p>', [[<cmd>lua require('telescope.builtin').git_files()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-p>', [[<cmd>lua require('telescope.builtin').git_files()<cr>]], {})
vim.api.nvim_set_keymap('n', '<leader>pb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>pw', [[<cmd>lua require('telescope.builtin').grep_string{ search = vim.fn.expand("<cword>")}<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ps', [[<cmd>lua require('telescope.builtin').grep_string{ search = vim.fn.input("Grep for > ")}<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>o', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<cr>]], { noremap = true, silent = true})
