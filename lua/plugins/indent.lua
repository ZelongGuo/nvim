return {
  "nvimdev/indentmini.nvim",

  config = function()
    require("indentmini").setup()

    -- Dynamical chunk color with the vim theme
    -- echo g:colors_name
    if vim.g.colors_name == "doom-one" then  -- light theme
      vim.cmd.highlight('IndentLine guifg=gray80')
      vim.cmd.highlight('IndentLineCurrent guifg=seagreen')
    else -- dark theme
      vim.cmd.highlight('IndentLine guifg=gray80')
      vim.cmd.highlight('IndentLineCurrent guifg=#806d9c')
    end

  end,
}

-- TODO: When using hlchunk, the following error threw (particularly with opening telescope.lua ...):
-- Error executing vim.schedule lua callback: ...e/nvim/lazy/hlchunk.nvim/lua/hlchunk/mods/chunk/init.lua:168: attempt to compare nil with number
-- stack traceback:
--         ...e/nvim/lazy/hlchunk.nvim/lua/hlchunk/mods/chunk/init.lua:168: in function 'fn'
--         ...re/nvim/lazy/hlchunk.nvim/lua/hlchunk/utils/loopTask.lua:63: in function 'fn'
--         ...share/nvim/lazy/hlchunk.nvim/lua/hlchunk/utils/timer.lua:16: in function <...share/nvim/lazy/hlchunk.nvim/lua/hlchunk/utils/timer.lua:15>

-- return {
--   {
--     "shellRaining/hlchunk.nvim",
-- 
--     init = function()
--       -- Automatically trigger this plugin settings when the cursor moved under the normal and insert modes
--       -- vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, { pattern = "*", command = "EnableHL", })
-- 
--       -- Dynamical chunk color with the vim theme
--       local cb = function()
--         -- echo g:colors_name
--         if vim.g.colors_name == "doom-one" then  -- light theme
--           return "seagreen" 
--         else -- dark theme
--           return "#806d9c"   -- yellow
--         end
--       end
-- 
--       require('hlchunk').setup({
--         chunk = {
--           enable = true,
--           use_treesitter = true,
--           style = {
--             --{	fg = "#806d9c"},
--             {	fg = cb },
--             {	fg = "red"}, -- if there is error then, the chunk color is red
--           },
--         },
-- 
--         indent = {
--           enable = true,
--           -- chars = { "│", "¦", "┆", "┊", },
--           chars = { "│" },
--           use_treesitter = false,
--           style = {
--             "gray80"
--           }
--         },
-- 
--         blank = {
--           enable = false,
--           priority = 9,
--           chars = {
--             ":",
--           },
--           style = {"black"},
--         },
-- 
--         line_num = {
--         enable = false,
--         use_treesitter = false,
--         },
--       })
--     end
--   },
-- }
