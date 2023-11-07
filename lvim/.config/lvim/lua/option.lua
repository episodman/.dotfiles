vim.opt.relativenumber = true
vim.opt.shiftwidth = 4      -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4         -- insert 2 spaces for a tab
vim.opt.showtabline = 4     -- always show tabs
-- vim.opt.background = "light" -- always show tabs
vim.opt.background = "dark" -- always show tabs
-- vim.lsp.set_log_level(“off”)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.opt.foldcolumn = "1"
-- vim.opt.foldlevel = 20
-- vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = -1
vim.opt.foldenable = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
--
-- vim.opt.foldcolumn = '1' -- '0' is not bad
-- vim.opt.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
-- vim.opt.foldlevelstart = 99
-- vim.opt.foldenable = true

if vim.g.neovide then
    -- vim.o.guifont = "CommitMono-jy3:h11:#h-none"    -- text below applies for VimScript
    vim.o.guifont = "CommitMono:h11" -- text below applies for VimScript
    -- vim.o.guifont = "CommitMono-jy3:h11" -- text below applies for VimScript
    -- vim.o.guifont = "Hack Nerd Font Mono:h11:#h-none" -- text below applies for VimScript
    -- vim.o.guifont = "Fira Code:h11:#h-none" -- text below applies for VimScript
    -- vim.o.guifont = "D2Coding:h12:#h-none"          -- text below applies for VimScript
    -- vim.o.guifont = "Operator Mono:h12:#h-none"     -- text below applies for VimScript
    -- vim.o.guifont = "D2Coding ligature:h12:#h-none" -- text below applies for VimScript
    -- vim.o.guifont = "consolas:h11:#h-none"                -- text below applies for VimScript
    -- vim.o.guifont = "consolas ligaturized v3:h12:#h-none" -- text below applies for VimScript
    -- vim.o.guifont = "hack nerd font mono jbm ligatured ccg:h11:#h-none" -- text below applies for VimScript
    -- vim.o.guifont = "NanumGothicCoding:h12:#h-none" -- text below applies for VimScript
    -- vim.o.guifont = "JetBrains_Mono:h11:#h-none" -- text below applies for VimScript
    -- vim.o.guifont = "Red_Hat_Mono_Medium:h11:#h-none" -- text below applies for VimScript
    -- vim.o.guifont = "Cascadia_Code_PL_Semi_Light:h11:#h-none" -- text below applies for VimScript
    -- vim.o.guifont = "Cascadia_Code_PL_Light:h11:#h-none"     -- text below applies for VimScript
    -- vim.o.guifont = "Cascadia_Code_PL, D2Coding:h11:#h-none" -- text below applies for VimScript
    -- vim.o.guifont = "JetBrains_Mono:h10" -- text below applies for VimScript
    -- vim.g.neovide_cursor_trail_size = 0.3
    -- vim.g.neovide_cursor_trail_size = 0.8
    -- vim.g.neovide_cursor_animation_length = 0.13
    -- vim.g.neovide_cursor_animation_length = 0.02
    -- vim.g.neovide_cursor_vfx_mode = "torpedo"
    -- vim.g.neovide_cursor_vfx_mode = "railgun"
end

-- local rainbow_delimiters = require 'rainbow-delimiters'
-- vim.g.rainbow_delimiters = {
--     strategy = {
--         [''] = rainbow_delimiters.strategy['global'],
--         vim = rainbow_delimiters.strategy['local'],
--     },
--     query = {
--         [''] = 'rainbow-delimiters',
--         lua = 'rainbow-blocks',
--     },
--     highlight = {
--         'RainbowDelimiterRed',
--         'RainbowDelimiterYellow',
--         'RainbowDelimiterBlue',
--         'RainbowDelimiterOrange',
--         'RainbowDelimiterGreen',
--         'RainbowDelimiterViolet',
--         'RainbowDelimiterCyan',
--     },
-- }
