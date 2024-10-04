return {
	"lervag/vimtex",
  lazy = false,
	init = function()
		vim.g.vimtex_view_method = "Preview"
		vim.g.vimtex_mappings_enabled = 0
		vim.g.vimtex_quickfix_ignore_filters = {
			'Font shape',
			"badness 10000",
			"Package hyperref Warning",
		}
	end
}
