return {
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            -- add a keymap to browse plugin files
            -- stylua: ignore
            -- {
            --     "<leader>fp",
            --     function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
            --     desc = "Find Plugin File",
            -- },
        },
        -- change some options
        opts = {
            defaults = {
                prompt_prefix = "   ",
                selection_caret = "  ",
                entry_prefix = "   ",
                dynamic_preview_title = true,
                hl_result_eol = true,
                sorting_strategy = "ascending",
                results_title = "", -- Remove `Results` title
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.8,
                    height = 0.80,
                    preview_cutoff = 120,
                },

                mappings = {
                    i = {
                        ["<C-q>"] = require("telescope.actions").send_to_qflist +
                            require("telescope.actions").open_qflist,
                        ["<C-w>"] = require("telescope.actions").send_selected_to_qflist +
                            require("telescope.actions").open_qflist,
                        ["<C-x>"] = false,
                        -- ["<C-j>"] = require("telescope.actions").move_selection_next,
                        ["<C-j>"] = require("telescope.actions").move_selection_next,
                        ["<C-k>"] = require("telescope.actions").move_selection_previous,
                        ["<C-u>"] = require("telescope.actions").preview_scrolling_up,
                        ["<C-d>"] = require("telescope.actions").preview_scrolling_down,
                        ["<C-c>"] = require("telescope.actions").close,
                        ["<Esc>"] = require("telescope.actions").close,
                    },

                    n = {
                        ["<C-q>"] = require("telescope.actions").send_to_qflist +
                            require("telescope.actions").open_qflist,
                        ["<C-w>"] = require("telescope.actions").send_selected_to_qflist +
                            require("telescope.actions").open_qflist,
                        -- ["<C-j>"] = require("telescope.actions").move_selection_next,

                        ["<C-j>"] = require("telescope.actions").move_selection_next,
                        ["<C-k>"] = require("telescope.actions").move_selection_previous,
                        ["<C-x>"] = false,
                        ["<C-u>"] = require("telescope.actions").preview_scrolling_up,
                        ["<C-d>"] = require("telescope.actions").preview_scrolling_down,
                        ["<C-c>"] = require("telescope.actions").close,
                        ["<Esc>"] = require("telescope.actions").close,
                    },
                },
            },
        },
    },
}
