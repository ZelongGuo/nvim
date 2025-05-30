-- :Telescope to show all the pickers
local M = {
    -- Suggested dependencies also ripgrep and fd, which could be install by homebrew:
    -- brew install ripgrep
    -- brew install fd
    -- ore details could be found either in telescope or ripgrep
    'nvim-telescope/telescope.nvim', -- tag = '0.1.8',
    event = "VeryLazy",
    dependencies = {
        { 'nvim-lua/plenary.nvim', lazy = true },
        {
            "LukasPietzschmann/telescope-tabs",
            -- lazy = true,
            keys = { '<leader>ft', ':Telescope telescope-tabs list_tabs<CR>', desc = "for the first time lazy load telescope-tabs when open telescope" },
            config = function()
                local tstabs = require('telescope-tabs')
                tstabs.setup({})
                vim.keymap.set('n', '<leader>ft', tstabs.list_tabs, { desc = "open the picker and show all the tabs" })
            end
        },
    },

}

function M.config()
    -- Telescope Setups
    local telescope = require('telescope')
    local actions = require("telescope.actions")

    telescope.setup({
        defaults = {
            -- General Default Settings
            color_devicons = true,
            prompt_prefix = "🔍 ",
            selection_caret = " ", -- "🐾",
            -- path_display = { "truncate" },
            path_display = { "smart" },
            -- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            -- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,

            -- Windows Settings
            layout_config = {
                horizontal = {
                    preview_width = 0.5,  -- define preview window half of the total window size
                    -- result_width = 0.5, -- define preview window half of the total window size
                    preview_cutoff = 30,  -- show 30 characters in the preview window
                },
                width = { padding = 8 },  -- setting the telescope window width
                height = { padding = 3 }, -- setting the telescope window hight
            },

            -- Mappings Within Telescope for Normal and Insert Mode
            mappings = {
                -- Insert Mode
                i = {
                    ["<UP>"]   = actions.cycle_history_prev,
                    ["<DOWN>"] = actions.cycle_history_next,
                    ["<C-i>"]  = actions.move_selection_previous,
                    ["<C-k>"]  = actions.move_selection_next,
                    -- -- Force-disable <C-j> and <C-l> for using <C-u> and <C-d>
                    -- ["<C-j>"]  = false,
                    -- ["<C-l>"]  = false,
                    ["<C-j>"]  = actions.preview_scrolling_up,
                    ["<C-l>"]  = actions.preview_scrolling_down,
                    -- ["<C-u>"]  = actions.preview_scrolling_up,
                    -- ["<C-d>"]  = actions.preview_scrolling_down,
                    ["C-c"]    = actions.close,
                    ["C-t"]    = actions.select_tab,
                    ["<CR>"]   = actions.select_default, -- default will overwrite current only tab
                    -- open the file with a new vertical buffer in current tab, here we only set the vertical split, if you want a horizontal split, using default key maps
                    ["<C-s>"]  = actions.select_vertical,
                },

                n = {
                    ["i"]     = actions.move_selection_previous,
                    ["k"]     = actions.move_selection_next,
                    -- ["j"]     = false,
                    -- ["l"]     = false,
                    ["j"]     = actions.preview_scrolling_up,
                    ["l"]     = actions.preview_scrolling_down,
                    -- ["u"]     = actions.preview_scrolling_up,
                    -- ["d"]     = actions.preview_scrolling_down,
                    ["gg"]    = actions.move_to_top,
                    ["G"]     = actions.move_to_bottom,
                    -- ["<PageUp>"]   = actions.results_scrolling_up,
                    -- ["<PageDown>"] = actions.results_scrolling_down,

                    ["<esc>"] = actions.close,
                    ["?"]     = actions.which_key,
                    ["C-t"]   = actions.select_tab,
                    ["<CR>"]  = actions.select_default,
                    ["<C-s>"] = actions.select_vertical,
                },
            },
        },

        pickers = {
            colorscheme = {
                enable_preview = true,  -- preview window
                ignore_builtins = true, -- ignore the default colorschemes or not
            },
        },

    })

    -- Telescope Key Mappings from Terminal
    local builtin = require('telescope.builtin')
    -- Define my-fd function to set the work directory as Git root directory
    -- You can also use some plugins like "airblade/vim-rooter" to set the root directory
    local my_fd = function()
        local opts = {}
        local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        -- local git_root = string.gsub(vim.fn.systemlist("git rev-parse --show-toplevel")[1] or "", "\n", "")

        if git_root and git_root ~= "" then
            opts.cwd = git_root        -- Set the work directory to Git root directory
        else
            opts.cwd = vim.fn.getcwd() -- If it's not Git repository, then use current work directory cwd
        end

        builtin.find_files(opts) -- invoke Telescope to search files
    end

    -- Define a function to set the working directory to the Git root for live grep
    local my_live_grep = function()
        local opts = {}
        local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]

        if git_root and git_root ~= "" then
            opts.cwd = git_root        -- Set the working directory to Git root
        else
            opts.cwd = vim.fn.getcwd() -- If it's not a Git repository, use the current working directory
        end

        builtin.live_grep(opts) -- Invoke Telescope live_grep with the updated options
    end

    vim.keymap.set('n', '<leader>ff', my_fd,
        { noremap = true, nowait = true, desc = 'Telescope find files in Git root or cwd' })
    vim.keymap.set('n', '<leader>fg', my_live_grep,
        { noremap = true, nowait = true, desc = 'Telescope live grep finding strings in open buffers' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true, nowait = true, desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true, nowait = true, desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>fr', builtin.oldfiles,
        { noremap = true, nowait = true, desc = 'Lists previously open files' })
    vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { noremap = true, nowait = true, desc = 'Change colorscheme' })

    -- External Plugins
    -- telescope.load_extension('neoclip')  -- neoclip should be loaded
    vim.keymap.set('n', '<leader>fy', ":Telescope neoclip<CR>", { desc = 'open neoclip plugin for yank and macro' })
end

return M
