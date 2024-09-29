return {
	{
		"SirVer/ultisnips",
		dependencies = {
			"honza/vim-snippets",
		},
		config = function()
			vim.g.UltiSnipsSnippetDirectories = { "~/.config/nvim/ultisnips" }
			vim.g.UltiSnipsExpandTrigger = "<C-q>"
			vim.g.UltiSnipsJumpForwardTrigger = "<C-q>"
			vim.g.UltiSnipsJumpBackwardTrigger = "<C-w>"
		end,
	},
}

