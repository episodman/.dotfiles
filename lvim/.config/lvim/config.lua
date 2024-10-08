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
-- lvim.colorscheme = "nightfly"
-- lvim.colorscheme = "onenord"
-- lvim.colorscheme = "solarized"
-- lvim.colorscheme = "gruv-vsassist"
-- lvim.colorscheme = "dracula"
-- lvim.colorscheme = "gruvbuddy"
lvim.colorscheme = "fleet"
lvim.colorscheme = "vscode"
lvim.colorscheme = "nordfox"
lvim.colorscheme = "mellifluous"
lvim.colorscheme = "solarized-osaka-moon"
lvim.colorscheme = "rose-pine-moon"
lvim.colorscheme = "solarized-osaka-moon"
lvim.colorscheme = "catppuccin"
lvim.colorscheme = "nightfox"
lvim.colorscheme = "nightfox"
lvim.colorscheme = "solarized-osaka"
lvim.colorscheme = "terafox"
lvim.colorscheme = "tokyonight"
lvim.colorscheme = "tokyonight-moon"
lvim.colorscheme = "flexoki"
lvim.colorscheme = "oldworld"
lvim.colorscheme = "kanagawa"
lvim.colorscheme = "darkplus"
lvim.colorscheme = "kanagawa-dragon"
lvim.colorscheme = "PaperColor"
lvim.colorscheme = "solarized-low"
lvim.colorscheme = "solarized-osaka-day"
lvim.colorscheme = "gruvbox"
lvim.colorscheme = "onedark"
lvim.colorscheme = "material-darker"
lvim.colorscheme = "material"


lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.active = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.telescope.defaults.vimgrep_arguments = { 'rg', '--color=never', '--no-heading', '--with-filename',
    '--line-number', '--column',
    '--smart-case', '--ignore-file', '.gitignore' }

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "cpp",
    -- "javascript",
    "json",
    "lua",
    "python",
    -- "typescript",
    -- "tsx",
    -- "css",
    -- "rust",
    -- "java",
    "yaml",
}
lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.rainbow.disable = { "jsx" }
lvim.builtin.treesitter.rainbow.strategy = require('ts-rainbow').strategy.global
lvim.builtin.treesitter.rainbow.extended_mode = true
lvim.builtin.treesitter.rainbow.max_file_lines = nil
lvim.builtin.treesitter.rainbow.query = 'rainbow-parens'
-- lvim.builtin.treesitter.rainbow.strategy = require('ts-rainbow').strategy.global


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
--

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {

    event = { "BufReadPre", "BufNewFile" },
    -- { command = "black", filetypes = { "python" } },
    { command = "autopep8",     filetypes = { "python" } },
    { command = "clang_format", filetypes = { "cpp", "c" } },
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
    -- {
    --     command = "codespell",
    --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    --     filetypes = { "javascript", "python" },
    -- },
}
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--     { command = "stylua" },
--     {
--         command = "prettier",
--         extra_args = { "--print-width", "100" },
--         filetypes = { "typescript", "typescriptreact" },
--     },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--     { command = "flake8", filetypes = { "python" } },
--     {
--         command = "shellcheck",
--         args = { "--severity", "warning" },
--     },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
    {
        "christianchiarulli/harpoon"
    },
    {
        "LunarVim/darkplus.nvim"
    },
    {
        "felipeagc/fleet-theme-nvim",
        config = function() vim.cmd("colorscheme fleet") end
    },
    {
        "tpope/vim-surround",

        -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
        -- setup = function()
        --  vim.o.timeoutlen = 500
        -- end
    },
    { "kepano/flexoki" },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    { "rebelot/kanagawa.nvim" },
    { "Mofiqul/dracula.nvim" },
    {
        "tpope/vim-fugitive"
    },
    {
        "navarasu/onedark.nvim"
    },
    { "craftzdog/solarized-osaka.nvim" },
    { "bartekprtc/gruv-vsassist.nvim" },
    { "tjdevries/gruvbuddy.nvim" },
    -- { "MunifTanjim/nui.nvim" },
    { "marko-cerovac/material.nvim" },
    { "ishan9299/nvim-solarized-lua" },
    {
        "dgox16/oldworld.nvim",
        lazy = false,
        priority = 1000,
        config = true,
    },
    { "bluz71/vim-nightfly-colors", name = "nightfly",                          lazy = false, priority = 1000 },
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
    -- { 'psliwka/vim-smoothie' },
    { "tpope/vim-repeat" },
    { 'kevinhwang91/nvim-ufo',      dependencies = 'kevinhwang91/promise-async' },
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require "lsp_signature".on_attach() end,
    },
    { "catppuccin/nvim",           name = "catppuccin", priority = 1000 },
    { "ramojus/mellifluous.nvim" },
    { "NLKNguyen/papercolor-theme" },
    { "EdenEast/nightfox.nvim" },
    { "ellisonleao/gruvbox.nvim",  priority = 1000,     config = true,  opts = ... },
    { 'rose-pine/neovim',          name = 'rose-pine' },
    { 'chentoast/marks.nvim' },
    -- { 'nvim-tree/nvim-tree.lua' },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    {
        -- 'stevearc/conform.nvim',
        -- event = { "BufReadPre", "BufNewFile" },
        -- config = function()
        --     require("conform").setup({
        --         formatters_by_ft = {
        --             lua = { "stylua" },
        --             svelte = { { "prettierd", "prettier" } },
        --             javascript = { { "prettierd", "prettier" } },
        --             typescript = { { "prettierd", "prettier" } },
        --             javascriptreact = { { "prettierd", "prettier" } },
        --             typescriptreact = { { "prettierd", "prettier" } },
        --             json = { { "prettierd", "prettier" } },
        --             graphql = { { "prettierd", "prettier" } },
        --             java = { "google-java-format" },
        --             kotlin = { "ktlint" },
        --             ruby = { "standardrb" },
        --             markdown = { { "prettierd", "prettier" } },
        --             erb = { "htmlbeautifier" },
        --             html = { "htmlbeautifier" },
        --             bash = { "beautysh" },
        --             proto = { "buf" },
        --             rust = { "rustfmt" },
        --             yaml = { "yamlfix" },
        --             toml = { "taplo" },
        --             css = { { "prettierd", "prettier" } },
        --             scss = { { "prettierd", "prettier" } },
        --             cpp = { { "prettierd", "prettier" } },
        --         },
        --     })

        --     vim.keymap.set({ "n", "v" }, "<leader>f", function()
        --         conform.format({
        --             lsp_fallback = true,
        --             async = false,
        --             timeout_ms = 500,
        --         })
        --     end, { desc = "Format file or range (in visual mode)" })
        -- end,
    },
    { "HiPhish/rainbow-delimiters.nvim" },
    { "HiPhish/nvim-ts-rainbow2" },
    {
        "p00f/nvim-ts-rainbow"
    },
    {
        "keaising/im-select.nvim",
        config = function()
            require('im_select').setup({
                -- IM will be set to `default_im_select` in `normal` mode
                -- For Windows/WSL, default: "1033", aka: English US Keyboard
                -- For macOS, default: "com.apple.keylayout.ABC", aka: US
                -- For Linux, default:
                --               "keyboard-us" for Fcitx5
                --               "1" for Fcitx
                --               "xkb:us::eng" for ibus
                -- You can use `im-select` or `fcitx5-remote -n` to get the IM's name
                default_im_select       = "1",

                -- Can be binary's name or binary's full path,
                -- e.g. 'im-select' or '/usr/local/bin/im-select'
                -- For Windows/WSL, default: "im-select.exe"
                -- For macOS, default: "im-select"
                -- For Linux, default: "fcitx5-remote" or "fcitx-remote" or "ibus"
                default_command         = "fcitx5-remote",

                -- Restore the default input method state when the following events are triggered
                set_default_events      = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },

                -- Restore the previous used input method state when the following events
                -- are triggered, if you don't want to restore previous used im in Insert mode,
                -- e.g. deprecated `disable_auto_restore = 1`, just let it empty
                -- as `set_previous_events = {}`
                set_previous_events     = { "InsertEnter" },

                -- Show notification about how to install executable binary when binary missed
                keep_quiet_on_no_binary = false,

                -- Async run `default_command` to switch IM or not
                async_switch_im         = true
            })
        end,
    }
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     config = function()
    --         require("indent_blankline").setup {
    --             -- for example, context is off by default, use this to turn it on
    --             show_current_context = true,
    --             show_current_context_start = true,
    --         }
    --     end
    -- },
    -- {
    --     "karb94/neoscroll.nvim",
    --     -- event = "WinScrolled",
    --     event = "WinScrolled",
    --     config = function()
    --         require('neoscroll').setup()
    --     end,
    --     -- config = function()
    --     --     require('neoscroll').setup({
    --     --         -- All these keys will be mapped to their corresponding default scrolling animation
    --     --         mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
    --     --             '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
    --     --         hide_cursor = true,          -- Hide cursor while scrolling
    --     --         stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    --     --         use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    --     --         respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    --     --         cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    --     --         easing_function = nil,       -- Default easing function
    --     --         pre_hook = nil,              -- Function to run before the scrolling animation starts
    --     --         post_hook = nil,             -- Function to run after the scrolling animation ends
    --     --     })
    --     -- end
    -- },
    -- {
    --   "npxbr/glow.nvim",
    --   ft = { "markdown" }
    --   -- run = "yay -S glow"
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
-- not used
-- require "nvim-tree"
-- require "harpoon"
-- used
require "keymaps"
require "option"
require "neotree"
require "colorscheme"
require "autocmd"
require "null-ls-notify"
require "rainbowdeli"

-- vim.opt.background = "light" -- always show tabs
vim.opt.background = "dark" -- always show tabs



-- for i = 1, 9, 1 do
--     vim.keymap.set("n", string.format("<A-%s>", i), function()
--         vim.api.nvim_set_current_buf(vim.t.bufs[i])
--     end)
-- end
-- dependencies "keymaps"
-- dependencies "option"
-- dependencies "eotree"
-- dependencies "colorscheme"
-- dependencies "autocmd"
