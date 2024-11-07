-- Vim status lines

return {
    "nvim-lualine/lualine.nvim",
    -- You can optionally lazy-load heirline on UiEnter
    -- to make sure all required plugins and colorschemes are loaded before setup
    -- event = "UiEnter",
    lazy = false,
    priority = 1100,  -- load before colorschemes
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    opts = {
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            disabled_filetypes = { statusline = {}, winbar = {}, },
            ignore_focus = { "NvimTree", },  -- Do not show lualine when open filetype NvimTree
            always_divide_middle = true,
            always_show_tabline = true,
            globalstatus = false,
            refresh = { statusline = 100, tabline = 100, winbar = 100, }
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = {'branch', 'diff', 'diagnostics', },
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
            lualine_c = {'filename'},
            lualine_x = {
                'encoding', 
                {
                    'fileformat',
                    symbols = {
                        unix = ' │ ', -- e712
                        dos = '',  -- e70f
                        mac = '',  -- e711
                    },
                },
                'filetype',
            },
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}

    }
}



----------------------------------------------------------------------------------------------------

--1 return {
--1   -- "theniceboy/eleline.vim",
--1   -- branch = "no-scrollbar",
--1   "nvim-lualine/lualine.nvim",
--1   -- You can optionally lazy-load heirline on UiEnter
--1   -- to make sure all required plugins and colorschemes are loaded before setup
--1   -- event = "UiEnter",
--1   lazy = false,
--1   priority = 1100,  -- load before colorschemes
--1   config = function()
--1     require('lualine').setup {
--1       options = {
--1         icons_enabled = true,
--1         theme = 'auto',
--1         component_separators = { left = '', right = '' },
--1         section_separators = { left = '', right = '' },
--1         disabled_filetypes = {
--1           statusline = {},
--1           winbar = {},
--1         },
--1         ignore_focus = {},
--1         always_divide_middle = true,
--1         globalstatus = true,
--1         refresh = {
--1           statusline = 1000,
--1           tabline = 1000,
--1           winbar = 1000,
--1         }
--1       },
--1       sections = {
--1         lualine_a = { 'filename' },
--1         lualine_b = { 'branch', 'diff', 'diagnostics' },
--1         lualine_c = {},
--1         lualine_x = {},
--1         lualine_y = { 'filesize', 'fileformat', 'filetype' },
--1         lualine_z = { 'location' }
--1       },
--1 
--1       inactive_sections = {
--1         lualine_a = {},
--1         lualine_b = {},
--1         lualine_c = { 'filename' },
--1         lualine_x = { 'location' },
--1         lualine_y = {},
--1         lualine_z = {}
--1       },
--1       tabline = {},
--1       winbar = {},
--1       inactive_winbar = {},
--1       extensions = {}
--1     }
--1   end
--1 }
--1 
----------------------------------------------------------------------------------------------------

