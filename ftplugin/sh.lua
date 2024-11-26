-- indentation settings for local buffer
vim.bo.expandtab   = true
vim.bo.autoindent  = true
vim.bo.tabstop     = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth  = 2

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
    vim.cmd('split | terminal ' .. cmd)
end, { buffer = true })

