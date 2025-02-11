-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    {
        'yetone/avante.nvim',
        event = 'VeryLazy',
        opts = {
            -- add any opts here
            -- for example
            provider = 'groq',
            vendors = {
                groq = {
                    __inherited_from = 'openai',
                    api_key_name = 'GROQ_API_KEY',
                    endpoint = 'https://api.groq.com/openai/v1/',
                    model = 'deepseek-r1-distill-llama-70b',
                },
            },
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = 'make',
        dependencies = {
            'stevearc/dressing.nvim',
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
            --- The below dependencies are optional,
            'echasnovski/mini.pick', -- for file_selector provider mini.pick
            'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
            'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { 'markdown', 'Avante' },
                },
                ft = { 'markdown', 'Avante' },
            },
        },
    },
}
