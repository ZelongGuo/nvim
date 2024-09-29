return {
  "petertriho/nvim-scrollbar",
  dependencies = {
    "kevinhwang91/nvim-hlslens",
    "lewis6991/gitsigns.nvim",
  },
  config = function()
    --1 local group = vim.api.nvim_create_augroup("scrollbar_set_git_colors", {})
    --1 vim.api.nvim_create_autocmd("BufEnter", {
    --1 	pattern = "*",
    --1 	callback = function()
    --1 		vim.cmd([[
--1 hi! ScrollbarGitAdd guifg=#8CC85F
--1 hi! ScrollbarGitAddHandle guifg=#A0CF5D
--1 hi! ScrollbarGitChange guifg=#E6B450
--1 hi! ScrollbarGitChangeHandle guifg=#F0C454
--1 hi! ScrollbarGitDelete guifg=#F87070
--1 hi! ScrollbarGitDeleteHandle guifg=#FF7B7B ]])
          --1 end,
			    --1 group = group,
    --1 })
    --1 require("scrollbar.handlers.search").setup({})
    --1 require("scrollbar.handlers.gitsigns").setup()

    require("scrollbar").setup({
      show = true,
      show_in_active_only = false,
      set_highlights = true,
      folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
      max_lines = false, -- disables if no. of lines in buffer exceeds this
      hide_if_all_visible = true, -- Hides everything if all lines are visible
      throrrle_ms = 100,
      handle = {
        text = " ",
        color = "#928374", -- color of the scrollbar (handle)
        blend = 30, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
        highlight = "CursorColumn",
        hide_if_all_visible = true,
      },

      marks = {
        Search = { color = "darkgreen" },
        Error = { color = "red" },
        Warn = { color = "orange" },
        Misc = { color = "purple" },
        -- GitAdd = {
          -- text = "┆",
          -- priority = 7,
          -- gui = skyblue,
          -- color = blue,
          -- cterm = skyblue,
          -- color_nr =skyblue, -- cterm
          -- highlight = "GitSignsAdd",
        -- },
        -- GitChange = {
          -- text = "┆",
          -- priority = 7,
          -- gui = nil,
          -- color = green,
          -- cterm = nil,
          -- color_nr = nil, -- cterm
          -- highlight = "GitSignsChange",
        -- },
      },

      handlers = {
        cursor = false,
        diagnostic = true,
        gitsigns = true,
        handle = true,
        search = true,
      },
    })
  end,
}
