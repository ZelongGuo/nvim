-- indentation settings for local buffer
vim.bo.autoindent  = true
vim.bo.expandtab   = true
vim.bo.tabstop     = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth  = 4

-- TODO: Setting Fold, how to set fold for gmtset?

-- vim.keymap.set( { "n", "v" }, '<Leader>rr', '<Cmd>update<CR><Cmd>TermExec cmd="sh %"<CR>', {buffer = true})

-- vim.keymap.set('', '<Leader>r', function()
--     vim.cmd('update') -- Save file if has been modified
--     local filetype = vim.bo.filetype
--     local cmd = ""

--     if filetype == "sh" then
--         cmd = "sh " .. vim.fn.expand('%')
--     elseif filetype == "python" then
--         cmd = "python " .. vim.fn.expand('%')
--     elseif filetype == "lua" then
--         cmd = "lua " .. vim.fn.expand('%')
--     else
--         print("No run command defined for filetype: " .. filetype)
--         return
--     end

--     vim.cmd('split | terminal ' .. cmd)
-- end, { buffer = true })

-- Mapping for Simply Runing sh Script in Nvim
vim.keymap.set('', '<Leader>rr', function()
    vim.cmd('update')
    local cmd = "sh " .. vim.fn.expand('%')
    -- for terminal
    vim.cmd('split | resize 18 | terminal ' .. cmd)
end, { buffer = true })
