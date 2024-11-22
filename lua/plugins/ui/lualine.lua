-- Function to get luasnip status
local luasnip_status = function()
    local luasnip = require("luasnip")
    if luasnip.in_snippet() and luasnip.jumpable(1) then
        return " luasnip" -- (jumpable)
        -- elseif luasnip.in_snippet() then
        --     return " LuaSnip"
    else
        return ""
    end
end

-- 󱇵   󰤲  󰨰       󱥪  󰧅  󱥫  󰧆  󱅥  󰧛

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
                { 'branch', icon = '󰊢' }, --  󰊢            
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
            --1 lualine_c = {
            --1     {
            --1         'filename' .. luasnip_status,
            --1         -- symbols = {
            --1         --     modified = '[✎]', --'[Modified]', '[+]' ▣ ◈ ✎, -- Text to show when the file is modified.
            --1         --     readonly = '[]', --  '[ReadOnly]', '[-]',   -- Text to show when the file is non-modifiable or readonly.
            --1         --     unnamed = '[󰡯]', -- '[No Name]',  Text to show for unnamed buffers.
            --1         --     newfile = '[]', -- [New]     󰎔 -- Text to show for newly created file before first write
            --1         -- },
            --1     },
            --1 },

            lualine_c = {
                {
                    function()
                        local filename = vim.fn.expand('%:t')
                        if filename == "" then
                            filename = "[No Name]"
                        end

                        local luasnip_state = luasnip_status()
                        if luasnip_state ~= "" then
                            return filename .. " | " .. luasnip_state
                        else
                            return filename
                        end
                    end,
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
