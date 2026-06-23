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
-- Auto-reload files changed outside Neovim.
-- Only checks buffers visible in the current Neovim tabpage.
-- This is lighter than checking all loaded buffers.

local group = vim.api.nvim_create_augroup("VisibleBufferAutoReload", {
  clear = true,
})

local function should_skip_mode()
  local mode = vim.api.nvim_get_mode().mode

  -- Skip insert, replace, command-line, visual, select, and terminal modes.
  return mode:match("^[iRcvV\22t]") ~= nil
end

local function check_visible_buffers()
  if should_skip_mode() then
    return
  end

  local seen = {}

  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)

    if not seen[buf] and vim.api.nvim_buf_is_loaded(buf) then
      seen[buf] = true

      local name = vim.api.nvim_buf_get_name(buf)
      local buftype = vim.bo[buf].buftype
      local modified = vim.bo[buf].modified

      if name ~= "" and buftype == "" and not modified then
        vim.cmd("silent! checktime " .. buf)
      end
    end
  end

  vim.cmd("redraw!")
end

vim.api.nvim_create_autocmd({
  "FocusGained",
  "BufEnter",
  "WinEnter",
  "CursorHold",
}, {
  group = group,
  pattern = "*",
  callback = check_visible_buffers,
})

local timer = vim.uv.new_timer()

timer:start(
  500,
  500,
  vim.schedule_wrap(function()
    check_visible_buffers()
  end)
)

----------------------------------------------------------------------------------------------------
-- Reset LineNr background after ColorScheme, but now have some problems to automatic get the
-- vim.op.background when change the ColorScheme within telescope ...
-- vim.api.nvim_create_autocmd("ColorScheme", {
--     callback = function()
--         if vim.opt.background == "dark" then
--             vim.cmd [[ highlight LineNr guibg=#1e1e1e guifg=#ffffff ]]
--         else
--             vim.cmd [[ highlight LineNr guibg=#f0f0f0 guifg=gray60 ]]
--         end
--     end,
-- })
-- 

