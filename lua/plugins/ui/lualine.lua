-- Vim status lines

return {
    "nvim-lualine/lualine.nvim",
    -- event = "UiEnter",
    event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    opts = {
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            -- section_separators = { left = '', right = '' },
            -- component_separators = { left = '', right = '' },
            globalstatus = true,            -- only a single status line for current tab
            disabled_filetypes = { statusline = {}, winbar = {}, },
            ignore_focus = { "NvimTree", }, -- Do not show lualine when open filetype NvimTree
            always_divide_middle = true,
            always_show_tabline = true,
            refresh = { statusline = 100, tabline = 100, winbar = 100, }
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = {
                { 'branch',  icon = '󰊢'}, --  󰊢             
                {
                    'diff',
                    symbols = { added = ' ', modified = '󰝤 ', removed = ' ' }, --    
                },
                'diagnostics',
            },
            -- lualine_b = {'branch', 'diff',
            --     { 'diagnostics',
            --         sources = { 'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic',  },
            --         symbols = { error = ' ', warn = ' ', info = ' ' },
            --         diagnostics_color = {
            --           error = { fg = "red" },
            --           warn = { fg = "yellow" },
            --           info = { fg = "cyan" },
            --           always_visible = true,   -- Show diagnostics even if there are none.
            --         },
            --     },
            -- },
            lualine_c = {
                {
                    'filename',
                    symbols = {
                        modified = '✎', --'[Modified]', '[+]' ▣ ◈ ✎, -- Text to show when the file is modified.
                        readonly = '', --  '[ReadOnly]', '[-]',   -- Text to show when the file is non-modifiable or readonly.
                        unnamed = '󰡯', -- '[No Name]',  Text to show for unnamed buffers.
                        newfile = '', -- [New]     󰎔 -- Text to show for newly created file before first write
                    }
                },
            },
            lualine_x = {
                'encoding',
                -- {
                --     'fileformat',
                --     symbols = {
                --         unix = ' │  ', -- e712
                --         dos = '',  -- e70f
                --         mac = '',  -- e711
                --     },
                -- },
                'filesize',
                'filetype',
            },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}

    }
}
