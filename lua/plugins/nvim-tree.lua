return {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    -- cmd = "NvimTreeToggle",
    keys = { { "tt", "<CMD>NvimTreeToggle<CR>", desc = "NvimTree" } },
    event = "VeryLazy", -- also activate here to load so that telescope help page could open nvim-tree help page ...
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },

    config = function()
        local nvimtree = require("nvim-tree")
        local api = require("nvim-tree.api")
        ------------------------------------- Disable Netrw ----------------------------------------
        -- Disable netrw
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.opt.termguicolors = true

        ----------------------------- Global Mapping For File Buffer -------------------------------
        -- Globally (not on_attach) setting to open nvim-tree in current (file) buffer
        vim.keymap.set('n', 'tt', api.tree.toggle, { noremap = true, silent = true, nowait = true })

        --------------------- Customized Mapping For Nvim_Tree Buffer Only -------------------------
        -- The function of on_attach makes the key mappings only work in nvim-tree buffer
        -- Custom on_attach function to set mappings specific to nvim-tree buffer,
        -- otherwise there will be key conflict such as "l" and "j" in nvim-buffer and file buffer


        local function my_on_attach(bufnr)
            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end
            -- Default mappings for nvim-tree, check nvim-tree-mappings-default
            api.config.mappings.default_on_attach(bufnr)

            -- Custom mappings specific to nvim-tree buffer, similar to Ranger
            vim.keymap.set('n', 'zh', api.tree.toggle_hidden_filter, opts('Toggle Filter: Dotfiles'))
            vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
            vim.keymap.set('n', '<BS>', api.tree.change_root_to_parent, opts('Up'))
            vim.keymap.set('n', 'j', api.node.navigate.parent_close, opts('Up'))
            vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
            vim.keymap.set('n', 'I', '5k', opts('Jump up 5 nodes'))
            vim.keymap.set('n', 'K', '5j', opts('Jump up 5 nodes'))
            -- create file and folder
            vim.keymap.set('n', 'T', api.fs.create, opts('Touch: Create a file or folder'))
            vim.keymap.set('n', 'M', api.fs.create, opts('mkdir: Create a file or folder'))
            -- rename files / folders
            vim.keymap.set('n', 'a', api.fs.rename, opts('Rename a file or folder'))
            vim.keymap.set('n', 'A', api.fs.rename_full, opts('Rename a file or folder with full path'))
            -- copy/cut files and absolute path
            vim.keymap.set('n', 'yp', api.fs.copy.absolute_path, opts('Copy absolute path'))
            vim.keymap.set('n', 'yy', api.fs.copy.node, opts('Copy a file or folder'))
            vim.keymap.set('n', 'dd', api.fs.cut, opts('Cut a file or folder'))
            vim.keymap.set('n', 'dD', api.fs.remove, opts('Delete a file or folder'))
            -- other mapping like creating files etc please see the help page ...

            -- Some customized ranger-like jumping operations
            local home = "~"
            local works = "~/works/"
            local config = "~/.config/"
            local codes = "~/codes/"
            local docu = "~/Documents/"
            local notes = "~/notes/"
            vim.keymap.set("n", "gh", function() api.tree.change_root(home) end, opts("Go to Home Folder"))
            vim.keymap.set("n", "gw", function() api.tree.change_root(works) end, opts("Go to Works Folder"))
            vim.keymap.set("n", "gc", function() api.tree.change_root(config) end, opts("Go to .config Folder"))
            vim.keymap.set("n", "gC", function() api.tree.change_root(codes) end, opts("Go to codes Folder"))
            vim.keymap.set("n", "gd", function() api.tree.change_root(docu) end, opts("Go to Documents Folder"))
            vim.keymap.set("n", "gn", function() api.tree.change_root(notes) end, opts("Go to notes Folder"))
        end

        -------------------------- Nvim-Tree Setup Start From Here ---------------------------------
        -- Setup nvim-tree with custom on_attach
        nvimtree.setup({
            sync_root_with_cwd = false, -- default is false
            respect_buf_cwd = true,     -- update cwd when open nvim in a new buffer, default is false

            view = {
                width = 35,
                relativenumber = true,
                side = "left",
            },
            renderer = {
                indent_markers = { enable = true },
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = "",
                            arrow_open = "",
                        },
                    },
                },
            },
            actions = {
                open_file = { window_picker = { enable = false } },
            },
            filters = { custom = { ".DS_Store" } },
            git = { ignore = false },

            -- re-focus to current file in the re-opened tree
            update_focused_file = {
                enable = true,
                -- update_root = {
                --   enable = true,
                --   ignore_list = {},
                -- },
                exclude = false,
            },

            -- Pass custom on_attach function to setup
            on_attach = my_on_attach,

        })
    end,
}
