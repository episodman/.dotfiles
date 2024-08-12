return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true,
        -- keys = {
        --     { '<C-t>', '<cmd>ToggleTerm<cr>', desc = 'Toggle floating term' },
        -- },
        opts = {
            open_mapping = [[<C-t>]],
            direction = "float",
        },
    },
}
