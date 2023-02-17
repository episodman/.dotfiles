--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

-- vim options
-- vim.opt.shiftwidth = 2
-- vim.opt.tabstop = 2
-- vim.opt.relativenumber = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
    enabled = true,
    pattern = "*.lua",
    timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
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
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-x>"] = false,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<C-c>"] = actions.close,
        ["<Esc>"] = actions.close
    },
}

lvim.builtin.which_key.active = false
-- -- Change theme settings
-- lvim.colorscheme = "lunar"
lvim.colorscheme = "onenord"
-- lvim.colorscheme = "solarized"


lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.active = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "cpp",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "java",
    "yaml",
}
lvim.builtin.treesitter.auto_install = true

lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>
vim.lsp.handlers["textDocument/publishDiagnostics"] =
vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = false
    }
)

lvim.builtin.cmp.cmdline.enable = true

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { command = "black", filetypes = { "python" } },
    -- { command = "autopep8", filetypes = { "python" } },
    -- { command = "isort", filetypes = { "python" } },
    {
        -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        command = "prettier",
        ---@usage arguments to pass to the formatter
        -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
        extra_args = { "--print-with", "100" },
        ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
        filetypes = { "typescript", "typescriptreact" },
    },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    { command = "flake8", filetypes = { "python" } },
    {
        -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        command = "shellcheck",
        ---@usage arguments to pass to the formatter
        -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
        extra_args = { "--severity", "warning" },
    },
    {
        command = "codespell",
        ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
        filetypes = { "javascript", "python" },
    },
}
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
    {
        "christianchiarulli/harpoon"
    },
    {
        "lunarvim/Onedarker.nvim"
    },
    {
        "LunarVim/darkplus.nvim"
    },
    {
        "tpope/vim-surround",

        -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
        -- setup = function()
        --  vim.o.timeoutlen = 500
        -- end
    },
    {
        -- 'rose-pine/neovim', as = 'rose-pine'
        'rose-pine/neovim', name = 'rose-pine'
    },
    {
        -- "catppuccin/nvim", as = "catppuccin",
        "catppuccin/nvim", name = "catppuccin",
    },
    {
        "tpope/vim-fugitive"
    },
    {
        "navarasu/onedark.nvim"
    },
    { "rmehri01/onenord.nvim" },
    { "nvim-neo-tree/neo-tree.nvim" },
    { "MunifTanjim/nui.nvim" },
    { "marko-cerovac/material.nvim" },
    { "ishan9299/nvim-solarized-lua" },
    {
        "folke/todo-comments.nvim",
        -- requires = "nvim-lua/plenary.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },
    { 'Mofiqul/vscode.nvim' },
    { 'psliwka/vim-smoothie' },
    { "tpope/vim-repeat" },
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require "lsp_signature".on_attach() end,
    },
    -- {
    --     "karb94/neoscroll.nvim",
    --     -- event = "WinScrolled",
    --     event = "WinScrolled",
    --     config = function()
    --         require('neoscroll').setup()
    --     end,
    --     -- config = function()
    --     --     require('neoscroll').setup ({
    --     --         -- All these keys will be mapped to their corresponding default scrolling animation
    --     --         mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
    --     --             '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
    --     --         hide_cursor = true, -- Hide cursor while scrolling
    --     --         stop_eof = true, -- Stop at <EOF> when scrolling downwards
    --     --         use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    --     --         respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    --     --         cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    --     --         easing_function = nil, -- Default easing function
    --     --         pre_hook = nil, -- Function to run before the scrolling animation starts
    --     --         post_hook = nil, -- Function to run after the scrolling animation ends
    --     --     })
    --     -- end
    -- },
    -- {
    --     "npxbr/glow.nvim",
    --     ft = { "markdown" }
    --     -- run = "yay -S glow"
    -- },
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--
-- customize
require "harpoon"
-- require "nvim-tree"
require "keymaps"
require "option"
require "neotree"
require "colorscheme"
require "autocmd"



-- dependencies "keymaps"
-- dependencies "option"
-- dependencies "eotree"
-- dependencies "colorscheme"
-- dependencies "autocmd"
