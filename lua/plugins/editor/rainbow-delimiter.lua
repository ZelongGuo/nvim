local M = {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
}

M.init = function()
    -- This module contains a number of default definitions
    local rainbow_delimiters = require 'rainbow-delimiters'

    vim.g.rainbow_delimiters = {
        strategy = {
            [''] = rainbow_delimiters.strategy['global'],
            vim = rainbow_delimiters.strategy['local'],
            -- Use local for HTML
            html = rainbow_delimiters.strategy['local'],
            latex = function(bufnr)
                return nil
            end,
            -- Pick the strategy for markdown dynamically based on the buffer size
            markdown = function(bufnr)
                -- Disabled for very large files, global strategy for large files,
                -- local strategy otherwise
                local line_count = vim.api.nvim_buf_line_count(bufnr)
                if line_count > 10000 then
                    return nil
                elseif line_count > 1000 then
                    return rainbow_delimiters.strategy['global']
                end
                return rainbow_delimiters.strategy['local']
            end
        },
        query = {
            [''] = 'rainbow-delimiters',
            lua = 'rainbow-blocks',
        },
        priority = {
            [''] = 110,
            lua = 210,
        },
        highlight = {
            'RainbowDelimiterRed',
            'RainbowDelimiterYellow',
            'RainbowDelimiterBlue',
            'RainbowDelimiterOrange',
            'RainbowDelimiterGreen',
            'RainbowDelimiterViolet',
            'RainbowDelimiterCyan',
        },
    }
end

return M
