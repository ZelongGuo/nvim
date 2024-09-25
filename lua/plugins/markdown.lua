return {

	-- Makrdown table mode
  'Kicamon/markdown-table-mode.nvim',
	ft = {"markdown"},

  config = function()
		-- all defaults settings
    require('markdown-table-mode').setup()
  end
}

