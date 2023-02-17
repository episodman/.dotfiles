local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    -- snapshot = "july-24",
    snapshot_path = fn.stdpath "config" .. "/snapshots",
    max_jobs = 50,
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
        prompt_border = "rounded", -- Border style of prompt popups.
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- Plugin Mangager
    use "wbthomason/packer.nvim" -- Have packer manage itself

    -- Lua Development
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use "nvim-lua/popup.nvim"
    use "christianchiarulli/lua-dev.nvim"
    -- use "folke/lua-dev.nvim"

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
    use "ray-x/lsp_signature.nvim"
    use "SmiteshP/nvim-navic"
    use "simrat39/symbols-outline.nvim"
    use "b0o/SchemaStore.nvim"
    -- use "github/copilot.vim"
    use {
        "zbirenbaum/copilot.lua",
        event = { "VimEnter" },
        config = function()
            vim.defer_fn(function()
                require "user.copilot"
            end, 100)
        end,
    }
    use "RRethy/vim-illuminate"
    use "j-hui/fidget.nvim"
    use "lvimuser/lsp-inlayhints.nvim"
    -- use "simrat39/inlay-hints.nvim"
    use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"

    -- Completion
    use "christianchiarulli/nvim-cmp"
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-emoji"
    use "hrsh7th/cmp-nvim-lua"
    use "zbirenbaum/copilot-cmp"
    --   use { "tzachar/cmp-tabnine", commit = "1a8fd2795e4317fd564da269cc64a2fa17ee854e",
    -- run = "./install.sh" }

    -- Snippet
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- Syntax/Treesitter
    use "nvim-treesitter/nvim-treesitter"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "p00f/nvim-ts-rainbow"
    use "nvim-treesitter/playground"
    use "windwp/nvim-ts-autotag"
    use "nvim-treesitter/nvim-treesitter-textobjects"
    -- use "wellle/targets.vim"
    -- use "RRethy/nvim-treesitter-textsubjects"
    use "kylechui/nvim-surround"
    use {
        "abecodes/tabout.nvim",
        wants = { "nvim-treesitter" }, -- or require if not used so far
    }

    -- Marks
    use "christianchiarulli/harpoon"
    use "MattesGroeger/vim-bookmarks"

    -- Fuzzy Finder/Telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"
    use "tom-anders/telescope-vim-bookmarks.nvim"

    -- Note Taking
    use "mickael-menu/zk-nvim"

    -- Color
    use "NvChad/nvim-colorizer.lua"
    -- use "ziontee113/color-picker.nvim"
    use "nvim-colortils/colortils.nvim"

    -- Colorschemes
    use "lunarvim/onedarker.nvim"
    use "lunarvim/darkplus.nvim"
    use "shaunsingh/solarized.nvim"
    use {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                style = "day",
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark", -- style for floating windows
                },
            })
        end
    }
    --[[ use {"Mofiqul/vscode.nvim",
  config = function()
      local c = require('vscode.colors')
      require('vscode').setup({
          -- Enable transparent background
          transparent = true,

          -- Enable italic comment
          italic_comments = true,

          -- Disable nvim-tree background color
          disable_nvimtree_bg = true,

          -- Override colors (see ./lua/vscode/colors.lua)
          color_overrides = {
              vscLineNumber = '#FFFFFF',
          },

          -- Override highlight groups (see ./lua/vscode/theme.lua)
          group_overrides = {
              -- this supports the same val table as vim.api.nvim_set_hl
              -- use colors from this colorscheme by requiring vscode.colors!
              Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
          }
      })
      -- vim.api.nvim_command "colorscheme vscode"
    end
  } ]]
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
            require("catppuccin").setup()
            -- vim.api.nvim_command "colorscheme catppuccin"
        end
    }
    use { 'marko-cerovac/material.nvim',
        config = function()
            require('material').setup({
                contrast = {
                    terminal = false, -- Enable contrast for the built-in terminal
                    sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
                    floating_windows = false, -- Enable contrast for floating windows
                    cursor_line = false, -- Enable darker background for the cursor line
                    non_current_windows = false, -- Enable darker background for non-current windows
                    filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
                },

                styles = { -- Give comments style such as bold, italic, underline etc.
                    comments = { --[[ italic = true ]] },
                    strings = { --[[ bold = true ]] },
                    keywords = { --[[ italic = true ]] },
                    functions = { --[[ bold = true, undercurl = true ]] },
                    variables = {},
                    operators = {},
                    types = {},
                },

                plugins = { -- Uncomment the plugins that you use to highlight them
                    -- Available plugins:
                    -- "dap",
                    -- "dashboard",
                    -- "gitsigns",
                    -- "hop",
                    -- "indent-blankline",
                    -- "lspsaga",
                    -- "mini",
                    -- "neogit",
                    -- "nvim-cmp",
                    -- "nvim-navic",
                    -- "nvim-tree",
                    -- "sneak",
                    -- "telescope",
                    -- "trouble",
                    -- "which-key",
                },

                disable = {
                    colored_cursor = false, -- Disable the colored cursor
                    borders = false, -- Disable borders between verticaly split windows
                    background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
                    term_colors = false, -- Prevent the theme from setting terminal colors
                    eob_lines = false -- Hide the end-of-buffer lines
                },

                high_visibility = {
                    lighter = false, -- Enable higher contrast text for lighter style
                    darker = false -- Enable higher contrast text for darker style
                },

                lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

                async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

                custom_colors = nil, -- If you want to everride the default colors, set this to a function

                custom_highlights = {}, -- Overwrite highlights with your own
            })

        end
    }
    -- use "lunarvim/colorschemes"

    -- Utility
    use "rcarriga/nvim-notify"
    use "stevearc/dressing.nvim"
    use "ghillb/cybu.nvim"
    use "moll/vim-bbye"
    use "lewis6991/impatient.nvim"
    use "lalitmee/browse.nvim"

    -- Registers
    use "tversteeg/registers.nvim"

    -- Icon
    use "kyazdani42/nvim-web-devicons"

    -- Debugging
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    -- use "theHamsta/nvim-dap-virtual-text"
    -- use "Pocco81/DAPInstall.nvim"

    -- Tabline
    -- use "akinsho/bufferline.nvim"
    -- use "tiagovla/scope.nvim"

    -- Statusline
    use "christianchiarulli/lualine.nvim"

    -- Startup
    use "goolord/alpha-nvim"

    -- Indent
    use "lukas-reineke/indent-blankline.nvim"

    -- File Explorer
    use "kyazdani42/nvim-tree.lua"
    use "christianchiarulli/lir.nvim"

    -- Comment
    use "numToStr/Comment.nvim"
    use "folke/todo-comments.nvim"

    -- Terminal
    use "akinsho/toggleterm.nvim"

    -- Project
    use "ahmedkhalf/project.nvim"
    use "windwp/nvim-spectre"

    -- Session
    use "rmagatti/auto-session"
    use "rmagatti/session-lens"

    -- Quickfix
    use "kevinhwang91/nvim-bqf"

    -- Code Runner
    use "is0n/jaq-nvim"
    use {
        "0x100101/lab.nvim",
        run = "cd js && npm ci",
    }

    -- Git
    use "lewis6991/gitsigns.nvim"
    use "f-person/git-blame.nvim"
    use "ruifm/gitlinker.nvim"
    use "mattn/vim-gist"
    use "mattn/webapi-vim"

    -- Github
    use "pwntester/octo.nvim"

    -- Editing Support
    use "windwp/nvim-autopairs"
    use "monaqa/dial.nvim"
    use "nacro90/numb.nvim"
    use "andymass/vim-matchup"
    use "folke/zen-mode.nvim"
    -- use "Pocco81/true-zen.nvim"
    use "karb94/neoscroll.nvim"
    use "junegunn/vim-slash"

    -- Motion
    use "phaazon/hop.nvim"
    -- use "jinh0/eyeliner.nvim"

    -- Keybinding
    use "folke/which-key.nvim"

    -- Java
    use "mfussenegger/nvim-jdtls"

    -- Rust
    use { "christianchiarulli/rust-tools.nvim", branch = "modularize_and_inlay_rewrite" }
    use "Saecki/crates.nvim"

    -- Typescript TODO: set this up, also add keybinds to ftplugin
    use "jose-elias-alvarez/typescript.nvim"

    -- Markdown
    use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = "markdown",
    }

    -- Graveyard
    -- use "romgrk/nvim-treesitter-context"
    -- use "mizlan/iswap.nvim"
    -- use {'christianchiarulli/nvim-ts-rainbow'}
    -- use "nvim-telescope/telescope-ui-select.nvim"
    -- use "nvim-telescope/telescope-file-browser.nvim"
    -- use 'David-Kunz/cmp-npm' -- doesn't seem to work
    -- use { "christianchiarulli/JABS.nvim" }
    -- use "lunarvim/vim-solidity"
    -- use "tpope/vim-repeat"
    -- use "Shatur/neovim-session-manager"
    -- use "metakirby5/codi.vim"
    -- use { "nyngwang/NeoZoom.lua", branch = "neo-zoom-original" }
    -- use "rcarriga/cmp-dap"
    -- use "filipdutescu/renamer.nvim"
    -- use "https://github.com/rhysd/conflict-marker.vim"
    -- use "rebelot/kanagawa.nvim"
    -- use "unblevable/quick-scope"
    -- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
    -- use "gbprod/cutlass.nvim"
    -- use "christianchiarulli/lsp-inlay-hints"
    -- use "rmagatti/goto-preview"
    -- use "stevearc/aerial.nvim"
    -- use "nvim-lua/lsp_extensions.nvim"
    -- use { "christianchiarulli/nvim-gps", branch = "text_hl" }
    -- use "stevearc/stickybuf.nvim"
    -- use "folke/trouble.nvim"
    -- use "drybalka/tree-climber.nvim"
    -- use "phaazon/hop.nvim"
    -- use { "michaelb/sniprun", run = "bash ./install.sh" }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
