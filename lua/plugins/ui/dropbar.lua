local M = {
    'Bekaboo/dropbar.nvim',
    event = "VeryLazy",

    -- dependencies = {
    --     -- optional, but required for fuzzy finder support
    --     'nvim-telescope/telescope-fzf-native.nvim',
    --     build = 'make'
    -- }
}

M.config = function()
    local api = require("dropbar.api")
    vim.keymap.set('n', '<Leader>;', api.pick)
    vim.keymap.set('n', '[c', api.goto_context_start)
    vim.keymap.set('n', ']c', api.select_next_context)

    local utils = require("dropbar.utils")
    require("dropbar").setup({
        menu = {
            -- When on, automatically set the cursor to the closest previous/next
            preview = true,
            -- clickable component in the direction of cursor movement on CursorMoved
            quick_navigation = true,
            ---@type table<string, string|function|table<string, string|function>>
            keymaps = {
                -- Cursor movement
                ['j'] = 'h',
                ['i'] = 'k',
                ['k'] = 'j',
                ['h'] = 'i',
                ['q'] = '<C-w>q',
                ['<Esc>'] = '<C-w>q',
                ['jk'] = '<C-w>q',

                ['<CR>'] = function()
                    local menu = utils.menu.get_current()
                    if not menu then
                        return
                    end
                    local cursor = vim.api.nvim_win_get_cursor(menu.win)
                    local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
                    if component then
                        menu:click_on(component, nil, 1, 'l')
                    end
                end,

                ['l'] = function()
                    local menu = utils.menu.get_current()
                    if not menu then
                        return
                    end
                    local cursor = vim.api.nvim_win_get_cursor(menu.win)
                    local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
                    if component then
                        menu:click_on(component, nil, 1, 'l')
                    end
                end,

                -- Mouse support
                ['<MouseMove>'] = function()
                    local menu = utils.menu.get_current()
                    if not menu then
                        return
                    end
                    local mouse = vim.fn.getmousepos()
                    utils.menu.update_hover_hl(mouse)
                    if M.opts.menu.preview then
                        utils.menu.update_preview(mouse)
                    end
                end,

                ['<LeftMouse>'] = function()
                    local menu = utils.menu.get_current()
                    if not menu then
                        return
                    end
                    local mouse = vim.fn.getmousepos()
                    local clicked_menu = utils.menu.get({ win = mouse.winid })
                    -- If clicked on a menu, invoke the corresponding click action,
                    -- else close all menus and set the cursor to the clicked window
                    if clicked_menu then
                        clicked_menu:click_at({ mouse.line, mouse.column - 1 }, nil, 1, 'l')
                        return
                    end
                    utils.menu.exec('close')
                    utils.bar.exec('update_current_context_hl')
                    if vim.api.nvim_win_is_valid(mouse.winid) then
                        vim.api.nvim_set_current_win(mouse.winid)
                    end
                end,
            },
        },
        win_configs = {
            border = 'rounded',
            style = 'minimal',
        },
    })
end

-- ---@class dropbar_configs_t
-- M.opts = {
--     icons = {
--         enable = true,
--         kinds = {
--             symbols = {
--                 Array = '󰅪 ',
--                 Boolean = ' ',
--                 BreakStatement = '󰙧 ',
--                 Call = '󰃷 ',
--                 CaseStatement = '󱃙 ',
--                 Class = ' ',
--                 Color = '󰏘 ',
--                 Constant = '󰏿 ',
--                 Constructor = ' ',
--                 ContinueStatement = '→ ',
--                 Copilot = ' ',
--                 Declaration = '󰙠 ',
--                 Delete = '󰩺 ',
--                 DoStatement = '󰑖 ',
--                 Enum = ' ',
--                 EnumMember = ' ',
--                 Event = ' ',
--                 Field = ' ',
--                 File = '󰈔 ',
--                 Folder = '󰉋 ',
--                 ForStatement = '󰑖 ',
--                 Function = '󰊕 ',
--                 H1Marker = '󰉫 ', -- Used by markdown treesitter parser
--                 H2Marker = '󰉬 ',
--                 H3Marker = '󰉭 ',
--                 H4Marker = '󰉮 ',
--                 H5Marker = '󰉯 ',
--                 H6Marker = '󰉰 ',
--                 Identifier = '󰀫 ',
--                 IfStatement = '󰇉 ',
--                 Interface = ' ',
--                 Keyword = '󰌋 ',
--                 List = '󰅪 ',
--                 Log = '󰦪 ',
--                 Lsp = ' ',
--                 Macro = '󰁌 ',
--                 MarkdownH1 = '󰉫 ', -- Used by builtin markdown source
--                 MarkdownH2 = '󰉬 ',
--                 MarkdownH3 = '󰉭 ',
--                 MarkdownH4 = '󰉮 ',
--                 MarkdownH5 = '󰉯 ',
--                 MarkdownH6 = '󰉰 ',
--                 Method = '󰆧 ',
--                 Module = '󰏗 ',
--                 Namespace = '󰅩 ',
--                 Null = '󰢤 ',
--                 Number = '󰎠 ',
--                 Object = '󰅩 ',
--                 Operator = '󰆕 ',
--                 Package = '󰆦 ',
--                 Pair = '󰅪 ',
--                 Property = ' ',
--                 Reference = '󰦾 ',
--                 Regex = ' ',
--                 Repeat = '󰑖 ',
--                 Scope = '󰅩 ',
--                 Snippet = '󰩫 ',
--                 Specifier = '󰦪 ',
--                 Statement = '󰅩 ',
--                 String = '󰉾 ',
--                 Struct = ' ',
--                 SwitchStatement = '󰺟 ',
--                 Terminal = ' ',
--                 Text = ' ',
--                 Type = ' ',
--                 TypeParameter = '󰆩 ',
--                 Unit = ' ',
--                 Value = '󰎠 ',
--                 Variable = '󰀫 ',
--                 WhileStatement = '󰑖 ',
--             },
--         },
--         ui = {
--             bar = {
--                 separator = ' ',
--                 extends = '…',
--             },
--             menu = {
--                 separator = ' ',
--                 indicator = ' ',
--             },
--         },
--     },
-- }

return M
