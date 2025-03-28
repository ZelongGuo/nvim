return {
    -- git sings for side bar
    {
        "lewis6991/gitsigns.nvim",
        -- event = "UIEnter",
        event = "VeryLazy",
        config = function()
            require('gitsigns').setup({

                signs = {
                    add          = { text = '▎' },
                    change       = { text = '░' },
                    delete       = { text = '_' },
                    topdelete    = { text = '▔' },
                    changedelete = { text = '▒' },
                    untracked    = { text = '┆' },
                    },
                })
            vim.keymap.set("n", "<leader>g-", ":Gitsigns prev_hunk<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>g=", ":Gitsigns next_hunk<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { noremap = true, silent = true })
        end
    },

    -- -- lazy git for repository
    -- {
    --     "kdheepak/lazygit.nvim",
    --     lazy = false,
    --     keys = { { "<leader>lg", ":LazyGit<CR>", desc = "LazyGit" } }
    --     cmd = {
    --         "LazyGit",
    --         "LazyGitConfig",
    --         "LazyGitCurrentFile",
    --         "LazyGitFilter",
    --         "LazyGitFilterCurrentFile",
    --     },
    --     -- optional for floating window border decoration
    --     dependencies = {
    --         "nvim-telescope/telescope.nvim",
    --         "nvim-lua/plenary.nvim",
    --     },

    --     config = function()
    --         require("telescope").load_extension("lazygit")
    --     end,
    -- },

	--1 {
	--1 	"kdheepak/lazygit.nvim",
	--1 	keys = { "<c-g>" },
	--1 	config = function()
	--1 		vim.g.lazygit_floating_window_scaling_factor = 1.0
	--1 		vim.g.lazygit_floating_window_winblend = 0
	--1 		vim.g.lazygit_use_neovim_remote = true
	--1 		vim.keymap.set("n", "<c-g>", ":LazyGit<CR>", { noremap = true, silent = true })
	--1 	end
	--1 },
	--1 -- {
	--1 -- 	"APZelos/blamer.nvim",
	--1 -- 	config = function()
	--1 -- 		vim.g.blamer_enabled = true
	--1 -- 		vim.g.blamer_relative_time = true
	--1 -- 	end
	--1 -- }
    --
}
