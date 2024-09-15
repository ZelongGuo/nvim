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
