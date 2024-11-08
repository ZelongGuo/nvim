-- Automatically locate the cursor to the place of last exiting file
if vim.fn.has("autocmd") == 1 then
    vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = "*",
        callback = function()
            if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
                vim.cmd("normal! g'\"")
            end
        end
    })
end

----------------------------------------------------------------------------------------------------

-- Hightlight on yank
local highlight_yank_group = vim.api.nvim_create_augroup("highlight_yank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = highlight_yank_group,
  callback = function()
    vim.highlight.on_yank()
  end,
})

----------------------------------------------------------------------------------------------------
-- When open split a window (enter a new buffer or new window), opening and setting the LineNr
-- column aotumatically (default no opening of the LineNr column)
vim.api.nvim_create_augroup("RelativeNumberToggle", { clear = true })
vim.api.nvim_create_autocmd({"BufWinEnter", "WinEnter"}, {
    group = "RelativeNumberToggle",
    pattern = "*",
    callback = function()
        if vim.fn.win_gettype() ~= "popup" then
            vim.opt.relativenumber = true
        end
    end,
})

-- Close LineNr when leave
vim.api.nvim_create_autocmd("WinLeave", {
    group = "RelativeNumberToggle",
    pattern = "*",
    callback = function()
        vim.opt.relativenumber = false
    end,
})

