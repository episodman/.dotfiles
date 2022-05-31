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
opt.hlsearch = true opt.hidden = true
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
vim.cmd [[set equalalways]]
vim.cmd [[set shortmess+=c]]
opt.updatetime=50
opt.colorcolumn='120'
opt.cmdheight=2

-- dracula
-- cmd 'au ColorScheme * highlight LineNr guifg=#ff79c6' -- " Override LineNr
-- cmd 'au ColorScheme * highlight CursorLineNr guifg=#50fa7b' --" Override CursorLineNr
-- cmd 'au ColorScheme * highlight CursorLineNr guifg=#006400' --" Override CursorLineNr
-- cmd 'au ColorScheme * highlight Comment gui=italic'

-- gruvbox & nightfox
cmd 'au ColorScheme * highlight LineNr guifg=#d3869b' -- " Override LineNr
cmd 'au ColorScheme * highlight CursorLineNr guifg=#fabd2f' --" Override CursorLineNr
cmd 'au ColorScheme * highlight Comment gui=italic'


-- " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- " delays and poor user experience.
-- cmd 'au ColorScheme * highlight ColorColumn ctermbg=0 guibg=#e2a478'
-- cmd 'au ColorScheme * highlight ColorColumn ctermbg=0 guibg=#b4be82'
cmd 'au ColorScheme * highlight ColorColumn ctermbg=0 guibg=#e27878'
-- " Don't pass messages to |ins-completion-menu|.
-- vim.cmd("autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()")

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
-- " Theme
paq {
	"catppuccin/nvim",
	as = "catppuccin"
}
paq {"tjdevries/colorbuddy.vim"}
paq {"tjdevries/gruvbuddy.nvim"}

paq {"rebelot/kanagawa.nvim"}
paq { 'rktjmp/lush.nvim' }
paq {'ellisonleao/gruvbox.nvim', requires = {'rktjmp/lush.nvim'}}
-- paq {'Mofiqul/dracula.nvim'}
paq {'dracula/vim'}
paq {'sainnhe/gruvbox-material'}
paq {'folke/tokyonight.nvim'}
paq {'olimorris/onedarkpro.nvim'}
paq {'navarasu/onedark.nvim'}
paq {'EdenEast/nightfox.nvim'}
paq {'shaunsingh/nord.nvim'}
paq {'marko-cerovac/material.nvim'}
paq {"projekt0n/github-nvim-theme"}
paq {"sainnhe/everforest"}
-- paq {'norcalli/nvim-colorizer.lua'}

-- utils
--
-- paq {'terryma/vim-multiple-cursors'}
paq {
  'lewis6991/gitsigns.nvim',
  requires = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require('gitsigns').setup()
  end
}
paq {'psliwka/vim-smoothie'}
paq {'flazz/vim-colorschemes'}
paq {'Vimjas/vim-python-pep8-indent'}
paq {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
-- paq {'jiangmiao/auto-pairs'}
paq {'windwp/nvim-autopairs'}
paq {'tell-k/vim-autopep8'}
paq {'dart-lang/dart-vim-plugin'}
paq {'preservim/nerdcommenter'}
paq {'tpope/vim-surround'}
-- paq {'iamcco/markdown-preview.nvim', run = fn['mkdp#util#install()']}
-- paq {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
paq {'kyazdani42/nvim-tree.lua'}
-- , config = function() require'nvim-tree'.setup {} end}
paq {'rainux/vim-desert-warm-256'}
paq {'rakr/vim-one'}
-- paq {'iamcco/markdown-preview.vim'}
paq {'iamcco/mathjax-support-for-mkdp'}
paq {'justinmk/vim-sneak'}
paq {'b3nj5m1n/kommentary'}
--[[ paq {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup({
            opleader = {
                ---Line-comment keymap
                line = 'gc',
                ---Block-comment keymap
                block = 'gb',
            },
            mappings = {
                    ---Operator-pending mapping
                    ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
                    ---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
                    basic = true,
                    ---Extra mapping
                    ---Includes `gco`, `gcO`, `gcA`
                    extra = true,
                    ---Extended mapping
                    ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
                    extended = false,
                }
          })
    end
} ]]
-- paq {"triglav/vim-visual-increment"}
-- paq {'plasticboy/vim-markdown'}
paq {'tiagofumo/vim-nerdtree-syntax-highlight'}
paq {'ryanoasis/vim-devicons'}
paq {"lukas-reineke/indent-blankline.nvim"}
-- paq {'Yggdroot/indentLine'}
paq {'junegunn/vim-easy-align'}
paq {'neoclide/coc.nvim', branch = 'release'}
paq {'tpope/vim-fugitive'}
paq {'vim-utils/vim-man'}
paq {'sheerun/vim-polyglot'}
--
paq {'hrsh7th/vim-vsnip'}
paq {'hrsh7th/vim-vsnip-integ'}
paq {'neovim/nvim-lspconfig', requires='williamboman/nvim-lsp-installer'}
-- auto completion
paq {'hrsh7th/nvim-cmp', requires = {
  "quangnguyen30192/cmp-nvim-ultisnips",
  config = function()
    -- optional call to setup (see customization section)
    require("cmp_nvim_ultisnips").setup({})
  end
  -- If you want to enable filetype detection based on treesitter:
  -- requires = { "nvim-treesitter/nvim-treesitter" },
  },
  config = function()
      local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
      require("cmp").setup({
        snippet = {
          expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
          end,
        },
        sources = {
          { name = "ultisnips" },
          -- more sources
        },
        -- recommended configuration for <Tab> people:
        mapping = {
          ["<Tab>"] = cmp.mapping(
            function(fallback)
              cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
            end,
            { "i", "s", [[ "c" (to enable the mapping in command mode) ]] }
          ),
          ["<S-Tab>"] = cmp.mapping(
            function(fallback)
              cmp_ultisnips_mappings.jump_backwards(fallback)
            end,
            { "i", "s", [[ "c" (to enable the mapping in command mode) ]] }
          ),
        },
      })
  end
}
paq {'hrsh7th/cmp-nvim-lsp'}
paq {'hrsh7th/vim-vsnip'}
paq {'hrsh7th/cmp-buffer'}
paq {'hrsh7th/cmp-vsnip'}
paq {'hrsh7th/cmp-cmdline'}
paq {'hrsh7th/cmp-path'}
paq {'saadparwaiz1/cmp_luasnip'}
paq {'L3MON4D3/LuaSnip'}
paq {'sirver/ultisnips'}
paq {'honza/vim-snippets'}
paq {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
paq {'karb94/neoscroll.nvim'}
paq {'ray-x/lsp_signature.nvim'}
paq {'nvim-treesitter/nvim-treesitter', run = fn['TSUpdate']}
paq {'nvim-lua/popup.nvim'}
paq {'nvim-lua/plenary.nvim'}
paq {'nvim-telescope/telescope.nvim'}
paq {'nvim-telescope/telescope-fzy-native.nvim'}
paq {'nvim-treesitter/playground'}
g['deoplete#enable_at_startup'] = 1  -- e




vim.g.rainbow_active = 0
-- vim.g.coc_node_path = '/usr/bin/node'

-- The Greatest plugin of all time.  I am not bias
vim.g.vim_be_good_floating = 1
-- auto-pair
-- vim.g.AutoPairsShortcutToggle='<M-t>'
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})

-- " And then somewhere in your vimrc, to set the colorscheme
-- require('colorbuddy').colorscheme('gruvbuddy')
-- gitsigns
require('gitsigns').setup()
-- nvim tree
-- vim.g.nvim_tree_quit_on_open =10 -- 0 by default, closes the tree when you open a file
require('nvim-tree').setup {
  view = {
    width = 45,
    height = 30,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
  },
  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
}

-- bufferLines
map('n', '<S-h>', ':BufferLineCyclePrev<CR>',{noremap = true})
map('n', '<S-l>', ':BufferLineCycleNext<CR>',{noremap = true})
-- nnoremap <S-l> :BufferLineCycleNext<CR>
-- nnoremap <S-h> :BufferLineCyclePrev<CR>
-- vim.opt.termguicolors = true
-- map('n', '<S-h>', ':tabprev<CR>',{noremap = true})
-- map('n', '<S-l>', ':tabnext<CR>',{noremap = true})

require('bufferline').setup {
  enforce_regular_tabs =  true,
  groups = {
    options = {
      toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
    },
    items = {
      {
        name = "Tests", -- Mandatory
        highlight = {gui = "underline", guisp = "blue"}, -- Optional
        priority = 2, -- determines where it will appear relative to other groups (Optional)
        icon = "", -- Optional
        matcher = function(buf) -- Mandatory
          return buf.filename:match('%_test') or buf.filename:match('%_spec')
        end,
      },
      {
        name = "Docs",
        highlight = {gui = "undercurl", guisp = "green"},
        auto_close = false,  -- whether or not close this group if it doesn't contain the current buffer
        matcher = function(buf)
          return buf.filename:match('%.md') or buf.filename:match('%.txt')
        end,
        separator = { -- Optional
          style = require('bufferline.groups').separator.tab
        },
      }
    }
  }
}

--- ctrlp
cmd 'set wildignore+=*/tmp/*,*.so,*\\tmp\\*,*.swp,*.zip,*.exe,*.pcm,.ccls-cache'
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
-- vim.g.tokyonight_style = "night"
vim.g.tokyonight_style = "storm" -- storm, night, day
-- vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
-- vim.g.tokyonight_italic_functions=true
vim.g.tokyonight_italic_keywords=true
-- vim.cmd("colorscheme tokyonight")


vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_enable_italic=0
-- vim.cmd("colorscheme gruvbox-material")
-- require('github-theme').setup({
--     -- theme_style = 'light'
--     function_style = "italic",
--     -- comment_style = "italic",
--     sidebars = {"qf", "vista_kind", "terminal", "packer"},
--     -- theme_style = 'dark',
--     colors = {hint = "orange", error = "#ff0000"},
--     -- theme_style = 'dark_colorblind'
--     -- theme_style = 'dark_colorblind'
-- })
--
--
--
vim.g.material_style = "oceanic"
-- vim.g.material_style = "palenight"

-- vim.g.material_style = "deep ocean"
-- vim.g.material_style = "darker"
require('material').setup({
	contrast = {
		sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
		floating_windows = false, -- Enable contrast for floating windows
		line_numbers = false, -- Enable contrast background for line numbers
		sign_column = false, -- Enable contrast background for the sign column
		cursor_line = false, -- Enable darker background for the cursor line
		non_current_windows = false, -- Enable darker background for non-current windows
		popup_menu = false, -- Enable lighter background for the popup menu

		-- sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
		-- floating_windows = false, -- Enable contrast for floating windows
		-- line_numbers = false, -- Enable contrast background for line numbers
		-- sign_column = false, -- Enable contrast background for the sign column
		-- cursor_line = false, -- Enable darker background for the cursor line
		-- non_current_windows = false, -- Enable darker background for non-current windows
		-- popup_menu = false, -- Enable lighter background for the popup menu
	},

	italics = {
		-- comments = true, -- Enable italic comments
		-- keywords = true, -- Enable italic keywords
		-- functions = true, -- Enable italic functions
		-- comments = false, -- Enable italic comments
		keywords = false, -- Enable italic keywords
		functions = false, -- Enable italic functions
		strings = false, -- Enable italic strings
		variables = false -- Enable italic variables
	},

	contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
		"terminal", -- Darker terminal background
		"packer", -- Darker packer background
		"qf" -- Darker qf list background
	},

	high_visibility = {
		lighter = false, -- Enable higher contrast text for lighter style
		darker = false -- Enable higher contrast text for darker style
	},

	disable = {
		borders = false, -- Disable borders between verticaly split windows
		background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
		term_colors = false, -- Prevent the theme from setting terminal colors
		eob_lines = false -- Hide the end-of-buffer lines
	},

	-- lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )
	lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )

	async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
    -- custom_highlights = {
    --         CursorLine = { fg = '#0000FF', gui = 'underline' },
    --         LineNr = { bg = '#FF0000' }
    --     }
	-- custom_highlights = {} -- Overwrite highlights with your own

})
-- vim.cmd("colorscheme material")


-- Default options
require('nightfox').setup({
  palettes = {
    nordfox = {
      -- A palette also defines the following:
      --   bg0, bg1, bg2, bg3, bg4, fg0, fg1, fg2, fg3, sel0, sel1, comment
      --
      -- These are the different foreground and background shades used by the theme.
      -- The base bg and fg is 1, 0 is normally the dark alternative. The others are
      -- incrementally lighter versions.
      bg1 = "#2e3440",

      -- sel is different types of selection colors.
      sel0 = "#3e4a5b", -- Popup bg, visual selection bg
      sel1 = "#4f6074", -- Popup sel bg, search bg

      -- comment is the definition of the comment color.
      comment = "#60728a",
    }
  },
  -- pallets = {
  --   nordfox = {
  --   --   bg0, bg1, bg2, bg3, bg4, fg0, fg1, fg2, fg3, sel0, sel1, comment
  --   --
  --   -- These are the different foreground and background shades used by the theme.
  --   -- The base bg and fg is 1, 0 is normally the dark alternative. The others are
  --   -- incrementally lighter versions.
  --   bg1 = "#2e3440",

  --   -- sel is different types of selection colors.
  --   sel0 = "#3e4a5b", -- Popup bg, visual selection bg
  --   sel1 = "#4f6074", -- Popup sel bg, search bg

  --   -- comment is the definition of the comment color.
  --   comment = "#60728a",
  --   }
  -- },
  options = {
    -- fox = "nordfox",
    -- Compiled file's destination location
    -- compile_path = util.join_paths(vim.fn.stdpath("cache"), "nightfox"),
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,    -- Disable setting background
    terminal_colors = false, -- Set terminal colors (vim.g.terminal_color_*)
    dim_inactive = false,   -- Non focused panes set to alternative background
    styles = {              -- Style to be applied to different syntax groups
      comments = "NONE",
      functions = "NONE",
      keywords = "italic",
      numbers = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
    -- A pallet also defines the following:
  }
})

-- -- setup must be called before loading
-- vim.cmd("colorscheme nightfox")
-- vim.cmd("colorscheme nordfox")
-- Default options:
-- require('kanagawa').setup({
--     undercurl = true,           -- enable undercurls
--     commentStyle = "italic",
--     functionStyle = "italic",
--     keywordStyle = "italic",
--     statementStyle = "bold",
--     typeStyle = "NONE",
--     variablebuiltinStyle = "italic",
--     specialReturn = true,       -- special highlight for the return keyword
--     specialException = true,    -- special highlight for exception handling keywords
--     transparent = false,        -- do not set background color
--     dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
--     colors = {},
--     overrides = {},
-- })

-- -- setup must be called before loading
-- vim.cmd("colorscheme kanagawa")
--
--
vim.g.catppuccin_flavour = "frappe"
local catppuccin = require('catppuccin')
catppuccin.setup({
  transparent_background = false,
  term_colors = false,
  styles = {
      comments = "italic",
      conditionals = "italic",
      loops = "NONE",
      functions = "NONE",
      keywords = "NONE",
      strings = "NONE",
      variables = "NONE",
      numbers = "NONE",
      booleans = "NONE",
      properties = "NONE",
      types = "NONE",
      operators = "NONE",
  },
  integrations = {
      treesitter = true,
      native_lsp = {
          enabled = true,
          virtual_text = {
              errors = "italic",
              hints = "italic",
              warnings = "italic",
              information = "italic",
          },
          underlines = {
              errors = "underline",
              hints = "underline",
              warnings = "underline",
              information = "underline",
          },
      },
      lsp_trouble = false,
      cmp = true,
      lsp_saga = false,
      gitgutter = false,
      gitsigns = true,
      telescope = true,
      nvimtree = {
          enabled = true,
          show_root = false,
          transparent_panel = false,
      },
      neotree = {
          enabled = false,
          show_root = false,
          transparent_panel = false,
      },
      which_key = false,
      indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
      },
      dashboard = true,
      neogit = false,
      vim_sneak = false,
      fern = false,
      barbar = false,
      bufferline = true,
      markdown = true,
      lightspeed = false,
      ts_rainbow = false,
      hop = false,
      notify = true,
      telekasten = true,
      symbols_outline = true,
  }
})

-- vim.cmd[[colorscheme catppuccin]]


local onedarkpro = require('onedarkpro')
onedarkpro.setup({
  -- dark_theme = "onedark_vivid",
  dark_theme = "onedark",
--   theme = function(), -- Override with "onedark" or "onelight". Alternatively, remove the option and the theme uses `vim.o.background` to determine
  colors = {}, -- Override default colors. Can specify colors for "onelight" or "onedark" themes
  hlgroups = {}, -- Override default highlight groups
  plugins = { -- Override which plugins highlight groups are loaded
      native_lsp = true,
      polygot = true,
      treesitter = true,
      -- NOTE: Other plugins have been omitted for brevity
  },
  styles = {
      strings = "NONE", -- Style that is applied to strings
      comments = "italic", -- Style that is applied to comments
      keywords = "italic", -- Style that is applied to keywords
      functions = "NONE", -- Style that is applied to functions
      variables = "NONE", -- Style that is applied to variables
  },
  options = {
      bold = false, -- Use the themes opinionated bold styles?
      italic = false, -- Use the themes opinionated italic styles?
      underline = false, -- Use the themes opinionated underline styles?
      undercurl = false, -- Use the themes opinionated undercurl styles?
      cursorline = false, -- Use cursorline highlighting?
      transparency = false, -- Use a transparent background?
      terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
      window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
  }
})
onedarkpro.load()
-- require('onedarkpro').load()
-- vim.o.background = "light"




-- vim.g.everforest_enable_italic = 1
-- vim.g.everforest_disable_italic_comment = 1
vim.g.everforest_background= 'hard'
vim.g.everforest_better_performance = 1
-- vim.cmd("colorscheme everforest")
-- g:lightline = {'colorscheme': 'tokyonight'}
--
--
--

require('lualine').setup {
  options = {
    -- ... your lualine config
    -- theme = "catppuccin"
    -- theme = "nightfox"
    -- theme = "nordfox"
    -- theme = 'material'
    -- theme = 'everforest'
    -- theme = 'auto'
    -- theme = "kanagawa"
    theme = "onedarkpro"
    -- theme = "onedark"
    -- theme = "tokyonight"
    -- theme = 'gruvbox-material'
    -- theme = "dracula"
    -- theme = 'dracula-nvim'
    -- theme = "gruvbox"
    -- theme = 'material-stealth'
    -- theme = 'material-nvim'
    -- theme = 'github-theme'
    -- theme = 'gruvbuddy'
  },
  extensions = {'quickfix'}
}

-- cmd "autocmd Filetype json let g:indentLine_enabled = 0"

cmd 'au Filetype json let g:indentLine_enabled = 0' -- " Override LineNr
vim.g.indentLine_color_gui = '#808080'
vim.g.indentLine_showFirstIndentLevel = 1
-- vim.g.indentLine_char = 'c'
vim.g.indentLine_defaultGroup = 'SpecialKey'
vim.g.indentLine_concealcursor = 'inc'
vim.g.indentLine_conceallevel = 2
vim.g.vim_json_conceal=0
vim.g.vim_json_syntax_conceal = 0

-- indent-blankline
vim.cmd [[highlight IndentBlanklineIndent5 guifg=grey gui=nocombine]] -- blue
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]] -- blue
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]] -- red
vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
    -- space_char_blankline = " ",
    -- use_treesitter = true,
    -- context_highlight_list = {
    --   "IndentBlanklineIndent5"
    -- },
    -- char_highlight_list = {
    --   "IndentBlanklineIndent1"
    -- },
}
--
-- vim.opt.termguicolors = true
-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

-- require("indent_blankline").setup {
--     space_char_blankline = " ",
--     char_highlight_list = {
--         "IndentBlanklineIndent1",
--         "IndentBlanklineIndent2",
--         "IndentBlanklineIndent3",
--         "IndentBlanklineIndent4",
--         "IndentBlanklineIndent5",
--         "IndentBlanklineIndent6",
--     },
-- }

vim.g.smoothie_enabled = 0
-- " colorscheme gruvbox
-- opt.background='light'

-- show the '~' characters after the end of buffers
vim.g.dracula_show_end_of_buffer = true
-- use transparent background
-- vim.g.dracula_transparent_bg = true
-- set custom lualine background color
-- vim.g.dracula_lualine_bg_color = "#44475a"
-- set italic comment
vim.g.dracula_italic_comment = true
-- vim.cmd("colorscheme dracula")

-- vim.g.gruvbox_italic = 1
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_colors = "bg0: ['#000000', 0]"
-- vim.cmd[[colorscheme gruvbox]]
-- vim.g.gruvbox_allow_italics = 1

-- local nightfox = require('nightfox').load()
-- local nightfox = require('nightfox')
-- nightfox.setup(
-- 	{
-- 	  -- fox = "palefox", -- change the

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
-- vim.g.fzf_tags_command = 'ctags -R'
-- " Border color
map('n', '<leader>prw', ':CocSearch <C-R>=expand("<cword>")<CR><CR>',{noremap = true})
map('n', '<leader>pw', ':Rg <C-R>=expand("<cword>")<CR><CR>',{noremap = true})
map('n', '<leader>phw', ':h <C-R>=expand("<cword>")<CR><CR>',{noremap = true})
map('n', '<leader>h', ':wincmd h<CR>',{noremap = true})
map('n', '<leader>2h', ':wincmd 2h<CR>',{noremap = true})
map('n', '<leader>j', ':wincmd j<CR>',{noremap = true})
map('n', '<leader>k', ':wincmd k<CR>',{noremap = true})
map('n', '<leader>l', ':wincmd l<CR>',{noremap = true})
map('n', '<leader>2l', ':wincmd 2l<CR>',{noremap = true})
map('n', '<leader>u', ':UndotreeShow<CR>',{noremap = true})
-- "nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
-- "nnoremap <leader>pv :NERDTreeToggle<CR>
-- map('n', '<leader>t', ':NERDTreeToggle<CR>',{noremap = true})
map('n', '<leader>t', ':NvimTreeToggle<CR>',{noremap = true})
map('n', '<Leader>ps', ':Rg<SPACE>',{noremap = true})
map('n', '<C-p>', ':GFiles<CR>',{noremap = true})
map('n', '<Leader>pf', ':Files<CR>',{noremap = true})
--map('n', '<Leader><CR>', ':so ~/.config/nvim/init.lua<CR>',{noremap = true})
map('n', '<Leader><CR>', ':so ~/.config/nvim/init.vim<CR>',{noremap = true})

map('n', '<leader>settag', ':!ctags -R --exclude=oe-logs --exclude=oe-workdir --exclude=env --exclude=venv3 --exclude=.ccls-cache<CR>',{noremap = true})
map('n', '<leader>sync', ':set tags=$PWD/tags<CR>')
map('n', '<F5>', ':!ctags -R --exclude=oe-logs --exclude=oe-workdir --exclude=env --exclude=venv3 --exclude=.ccls-cache<CR>',{noremap = true})
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
map('n', '<leader>x',':bdelete<CR>')
-- map('n', '<leader>q',':bdelete<CR>')
-- " next greatest remap ever : asbjornHaland
-- nnoremap <leader>y "+y
-- vnoremap <leader>y "+y
-- nnoremap <leader>Y gg"+yG

-- nnoremap <leader>d "_d
-- vnoremap <leader>d "_d
-- " Start interactive EasyAlign in visual mode (e.g. vipga)
-- map('x', 'ga','<Plug>(EasyAlign)')
-- map('n', 'ga','<Plug>(EasyAlign)')
-- "
cmd 'au Filetype cpp setlocal expandtab tabstop=4 shiftwidth=4'
cmd 'au Filetype python setlocal expandtab tabstop=4 shiftwidth=4'

require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}
vim.g.vim_be_good_log_file = 1
vim.g.vim_apm_log = 1


map('v', 'X', '"_d', {noremap = true})
map('i', '<C-c>', '<Esc>', {noremap = true})
map('i', 'ii', '<Esc>', {noremap = true})
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

-- vim.o.background = "light" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])

-- require('onedark').setup()
--[[ require("onedark").setup({
  functionStyle = "italic",
  sidebars = {"qf", "vista_kind", "terminal", "packer"},

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = "orange", error = "#ff0000"}
}) ]]

require('kommentary.config').use_extended_mappings()
vim.api.nvim_set_keymap("n", "gcc", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "gc", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("v", "gc", "<Plug>kommentary_visual_default<C-c>", {})

-- require('Comment').setup()

-- treesitter
require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}
-- colorizer
-- require'colorizer'.setup()

-- lsp saga
-- local saga = require 'lspsaga'
-- saga.init_lsp_saga()

-- Auto compeletion
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
vim.o.background = "dark" -- to load onelight

-- luasnip setup
local luasnip = require 'luasnip'


-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['ccls'].setup {
  capabilities = capabilities
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
 buf_set_keymap('n', '<space>d', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
 buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'ccls', 'jsonls'}
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)
for _, lsp in ipairs(servers) do
 nvim_lsp[lsp].setup {
   on_attach = on_attach,
   flags = {
     debounce_text_changes = 150,
   }
 }
end

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
  use_lspsaga = true,  -- set to true if you want to use lspsaga popup
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
    -- file_sorter = require('telescope.sorters').get_fzy_sorter,
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
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = false, -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
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
