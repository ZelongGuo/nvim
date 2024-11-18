return {
    'numToStr/Comment.nvim',

    event = { "BufReadPost", "BufNewFile" },
    -- lazy = true,

    config = function()
        require('Comment').setup {
            ignore = '^$', -- ignore blank lines
            ---disable default keybindings
            mappings = {
                ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                basic = false,
                ---Extra mapping; `gco`, `gcO`, `gcA`
                extra = false,
            },
        }

        local map = vim.keymap.set
        local opts = { noremap = true, silent = true }
        -- Normal
        map('n', '<leader>cc', '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', opts)
        -- Visual
        map('x', '<leader>cc', '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', opts)
    end
}
