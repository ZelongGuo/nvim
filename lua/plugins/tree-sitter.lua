return {
  -- Tree-Sitter could produce an abstract syntax tree (AST).
  -- Run `:InspectTree` to check what the AST look like.
  -- To compare view without highlight, try to open a file with `nvim <filename> --noplugin`
  -- Tree-sitter itself does not provide highlight, it only provide parser; while the genuine highlight providing is nvim-treesitter which is absolutely based on tree-sitter.
  --
    "nvim-treesitter/nvim-treesitter",

    -- lazy = false,
    -- priority = 1000,
    event = "UIEnter",
    build = ":TSUpdate",
 
    config = function()
        vim.opt.smartindent = false,
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            sync_install = false,
            indent = { enable = true, disable = { "python" } }, -- very important to disable Python
            ensure_installed = {
                "markdown",
                "html",
                "latex",
                "fortran",
                "c",
                "bash",
                "bibtex",
                "lua",
                "matlab",
                "vim",
                "python",
            },

            ignore_install = {},
            highlight = {
                enable = true,
                -- disable = {}, -- list of language that will be disabled
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                additional_vim_regex_highlighting = false,
            },

            -- indent = {
            -- 	enable = true,
            -- 	disable = function(lang, bufnr)
            -- 	    local disallowed_filetypes = { "yaml", "dart" }
            -- 	    return vim.tbl_contains(disallowed_filetypes, lang)
            -- 	end,
            -- },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection    = "<CR>",
                    node_incremental  = "<CR>",
                    node_decremental  = "<BS>",
                    scope_incremental = "<TAB>",
                },
             },

        })
    end,
}
