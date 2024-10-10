return {

   -- Makrdown table mode
  {
    'Kicamon/markdown-table-mode.nvim',
    ft = {"markdown"},

    config = function()
      -- all defaults settings
      require('markdown-table-mode').setup()
    end
  },

  -- Markdown Preview
  -- {
	-- 	"instant-markdown/vim-instant-markdown",
	-- 	ft = { "markdown" },
	-- 	build = "yarn install",
	-- 	config = function()
  --     vim.g.instant_markdown_slow = 0
	--     vim.g.instant_markdown_autostart = 0
	-- 	end,
	-- },


}

