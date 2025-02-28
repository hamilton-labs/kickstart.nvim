return {
    -- https://github.com/akinsho/toggleterm.nvim
    'akinsho/toggleterm.nvim',
    config = function()
        require('toggleterm').setup {
            start_in_insert = true,
            terminal_mappings = true,
            insert_mappings = true,
            auto_scroll = true,
            direction = 'float',
            close_on_exit = true,
            persist_size = true,
            open_mapping = [[<c-\>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
            hide_numbers = false, -- hide the number column in toggleterm buffer
            float_opts = {
                -- The border key is *almost* the same as 'nvim_open_win'
                -- see :h nvim_open_win for details on borders however
                -- the 'curved' border is a custom border type
                -- not natively supported but implemented in this plugin.
                border = 'curved', -- ... other options supported by win open
                -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
                highlights = {
                    border = 'Normal',
                    background = 'Normal',
                },
                -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
                --  width = <value>,
                --  height = <value>,
                --  row = <value>,
                --  col = <value>,
                --  winblend = 3,
                --  zindex = <value>,
                --  title_pos = 'left' | 'center' | 'right', position of the title of the floating window
            },
            winbar = {
                enabled = false,
                name_formatter = function(term) --  term: Terminal
                    return term.name
                end,
            },
        }
        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
            vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
        end

        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd 'autocmd! TermOpen term://*toggleterm lua set_terminal_keymaps()'
    end,
}
