-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
    -- add gruvbox
    { "ellisonleao/gruvbox.nvim" },

    -- Configure LazyVim to load gruvbox
    {
        "LazyVim/LazyVim",
        opts = {
            -- colorscheme = "gruvbox",
            -- colorscheme = "tokyonight",
            -- colorscheme = "material",
            -- colorscheme = "terafox",
            -- colorscheme = "nightfox",
            colorscheme = "onedark",
            -- colorscheme = "material",
            -- colorscheme = "rose-pine",
            -- colorscheme = "habamax",
            -- colorscheme = "catppuccin",
        },
    },

    -- change trouble config
    {
        "folke/trouble.nvim",
        -- opts will be merged with the parent spec
        opts = { use_diagnostic_signs = true },
    },

    -- disable trouble
    { "folke/trouble.nvim",      enabled = false },

    -- override nvim-cmp and add cmp-emoji
    -- {
    --     "hrsh7th/nvim-cmp",
    --     dependencies = {
    --         "hrsh7th/cmp-emoji",
    --     },
    --     ---@param opts cmp.ConfigSchema
    --     opts = function(_, opts)
    --         local cmp = require("cmp")
    --
    --         opts.mapping = vim.tbl_extend("force", opts.mapping, {
    --             ["<Tab>"] = cmp.mapping(function(fallback)
    --                 -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
    --                 if cmp.visible() then
    --                     local entry = cmp.get_selected_entry()
    --                     if not entry then
    --                         cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
    --                     else
    --                         cmp.confirm()
    --                     end
    --                 else
    --                     fallback()
    --                 end
    --             end, { "i", "s", "c" }),
    --         })
    --     end,
    -- },

    -- change some telescope options and a keymap to browse plugin files

    -- -- add pyright to lspconfig
    -- {
    --     "neovim/nvim-lspconfig",
    --     ---@class PluginLspOpts
    --     opts = {
    --         ---@type lspconfig.options
    --         servers = {
    --             -- pyright will be automatically installed with mason and loaded with lspconfig
    --             pyright = {},
    --         },
    --     },
    -- },
    --
    -- add tsserver and setup with typescript.nvim instead of lspconfig
    -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
    -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
    -- { import = "lazyvim.plugins.extras.lang.typescript" },

    -- add more treesitter parsers
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "yaml",
                "cpp",
            },
        },
    },

    -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
    -- would overwrite `ensure_installed` with the new value.
    -- If you'd rather extend the default config, use the code below instead:
    -- {
    --     "nvim-treesitter/nvim-treesitter",
    --     opts = function(_, opts)
    --         -- add tsx and treesitter
    --         vim.list_extend(opts.ensure_installed, {
    --             "tsx",
    --             "typescript",
    --         })
    --     end,
    -- },

    -- the opts function can also be used to change the default opts:
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function(_, opts)
            table.insert(opts.sections.lualine_x, "😄")
        end,
    },

    -- or you can return new options to override all the defaults
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function()
            return {
                --[[add your custom lualine config here]]
            }
        end,
    },

    -- use mini.starter instead of alpha
    { import = "lazyvim.plugins.extras.ui.mini-starter" },

    -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
    { import = "lazyvim.plugins.extras.lang.json" },

    -- add any tools you want to have installed below
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "stylua",
                "shellcheck",
                "shfmt",
                "flake8",
            },
        },
    },
    {
        "ThePrimeagen/harpoon",
    },
    {
        "tpope/vim-surround",

        -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
        -- setup = function()
        --  vim.o.timeoutlen = 500
        -- end
    },
    {
        "tpope/vim-fugitive"
    },
    {
        "folke/ts-comments.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "folke/flash.nvim",
        enabled = false,
        -- opts = {
        --     modes = {
        --         search = {
        --             enabled = false,
        --         },
        --     },
        -- },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            setup = {
                clangd = function(_, opts)
                    opts.capabilities.offsetEncoding = { "utf-16" }
                end,
            },
        },
    },
    { "tpope/vim-repeat" },
    { 'kevinhwang91/nvim-ufo',          dependencies = 'kevinhwang91/promise-async' },
    { "HiPhish/rainbow-delimiters.nvim" },
    { "HiPhish/nvim-ts-rainbow2" },
    {
        "p00f/nvim-ts-rainbow"
    },
    {
        "keaising/im-select.nvim",
        opts = {
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
    }
}
