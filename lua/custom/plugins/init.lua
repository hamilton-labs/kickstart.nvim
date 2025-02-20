-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    {
        'https://codeberg.org/esensar/nvim-dev-container',
        dependencies = 'nvim-treesitter/nvim-treesitter',
    },
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
            {
                'nvim-tree/nvim-web-devicons',
                opts = {
                    -- globally enable different highlight colors per icon (default to true)
                    --  -- if set to false all icons will have the default icon's color
                    color_icons = true,
                    --    -- globally enable default icons (default to false)
                    --     -- will get overriden by `get_icons` option
                    default = true,
                    --       -- globally enable "strict" selection of icons - icon will be looked up in
                    --        -- different tables, first by filename, and if not found by extension; this
                    --         -- prevents cases when file doesn't have any extension but still gets some icon
                    --          -- because its name happened to match some extension (default to false)
                    strict = true,
                    --            -- set the light or dark variant manually, instead of relying on `background`
                    --             -- (default to nil)
                    variant = 'dark',
                },
            }, -- or echasnovski/mini.icons
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
    require('lspconfig').dockerls.setup {
        settings = {
            docker = {
                languageserver = {
                    formatter = {
                        ignoreMultilineInstructions = false,
                    },
                },
            },
        },
    },
    {
        'epwalsh/obsidian.nvim',
        version = '*', -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = 'markdown',
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
        --   -- refer to `:h file-pattern` for more examples
        --   "BufReadPre path/to/my-vault/*.md",
        --   "BufNewFile path/to/my-vault/*.md",
        -- },
        dependencies = {
            -- Required.
            'nvim-lua/plenary.nvim',

            -- see below for full list of optional dependencies 👇
        },
        opts = {
            workspaces = {
                {
                    name = '📚 Learning',
                    path = '$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Hamilton Labs/📚 Learning',
                    strict = true,
                },
                {
                    name = '👨🏾‍💻 Creating',
                    path = '$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Hamilton Labs/👨🏾A‍💻 Creating',
                    strict = true,
                },
                {
                    name = '📝 Planning',
                    path = '$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Hamilton Labs/📝 Planning',
                    strict = true,
                },
            },

            -- see below for full list of options 👇
            -- -- Alternatively - and for backwards compatibility - you can set 'dir' to a single path instead of
            -- 'workspaces'. For example:
            -- dir = "~/vaults/work",
            dir = '$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Hamilton Labs',
            -- Optional, customize how note IDs are generated given an optional title.
            ---@param title string|?
            ---@param id string|?
            ---@param dir string|?
            ---@return path string|obsidian.path
            note_id_func = function(title)
                -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
                -- In this case a note with the title 'My new note' will be given an ID that looks
                -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
                local suffix = ''
                if title ~= nil then
                    -- If title is given, transform it into valid file name.
                    suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
                else
                    -- If title is nil, just add 4 random uppercase letters to the suffix.
                    for _ = 1, 4 do
                        suffix = suffix .. string.char(math.random(65, 90))
                    end
                end
                return tostring(os.time()) .. '-' .. suffix
            end,

            -- Optional, customize how note file names are generated given the ID, target directory, and title.
            ---@param spec { id: string, dir: obsidian.Path, title: string|? }
            ---@return string|obsidian.Path The full path to the new note.
            note_path_func = function(spec)
                -- This is equivalent to the default behavior.
                local path = spec.dir / tostring(spec.id)
                return path:with_suffix '.md'
            end,

            -- Optional, customize how wiki links are formatted. You can set this to one of:
            --  * "use_alias_only", e.g. '[[Foo Bar]]'
            --  * "prepend_note_id", e.g. '[[foo-bar|Foo Bar]]'
            --  * "prepend_note_path", e.g. '[[foo-bar.md|Foo Bar]]'
            --  * "use_path_only", e.g. '[[foo-bar.md]]'
            -- Or you can set it to a function that takes a table of options and returns a string, like this:
            wiki_link_func = function(opts)
                return require('obsidian.util').wiki_link_id_prefix(opts)
            end,
        },
    },
}
