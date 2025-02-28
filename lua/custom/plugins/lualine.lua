return {

    -- Bufferline
    {
        'akinsho/bufferline.nvim',
    },

    -- Colorscheme
    {
        'folke/tokyonight.nvim',
        options = { colorshcheme = 'tokyonight' },
    },

    -- Which-key
    {
        'folke/which-key.nvim',
        lazy = true,
    },

    -- add gruvbox
    -- {
    --     'ellisonleao/gruvbox.nvim',
    -- },

    -- Configure LazyVim to load gruvbox
    -- {
    --     'LazyVim/LazyVim',
    --     opts = {
    --         colorscheme = "gruvbox',
    --     },
    -- },

    -- Change trouble config
    {
        'folke/trouble.nvim',
        -- opts will be merged with the current spec
        opts = { use_diagnostic_signs = true },
    },

    --
    {
        -- Lualine (THE NEW EXTENSION ADDED IN CONFIGURATION)
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'powerline_dark',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    always_show_tabline = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    },
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename' },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {
                    lualine_a = { 'hostname' },
                    lualine_b = { 'tabs' },
                    lualine_c = { 'filename' },
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = { 'buffers' },
                },
                winbar = {
                    lualine_a = { 'filesize' },
                    lualine_b = { 'filetype' },
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {
                        {
                            'datetime',
                            -- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
                            style = 'default',
                        },
                    },
                },
                inactive_winbar = {},
                extensions = {},
            }
        end,
    },
}
