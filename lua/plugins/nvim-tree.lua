return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
  -- event = "VeryLazy",
  -- cmd = "NvimTreeToggle",
  keys = { "tt", ":NvimTreeToggle<CR>", desc = "NvimTree" },

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
    vim.keymap.set('n', 'tt', api.tree.toggle, { noremap = true, silent = true, nowait = true})

    --------------------- Customized Mapping For Nvim_Tree Buffer Only -------------------------
    -- The function of on_attach makes the key mappings only work in nvim-tree buffer
    -- Custom on_attach function to set mappings specific to nvim-tree buffer,
    -- otherwise there will be key conflict such as "l" and "j" in nvim-buffer and file buffer

    -- Define functions of jump up and down 5 nodes
    local function jump_up_5_nodes()
      for _ = 1, 5 do
        api.node.navigate.sibling.prev()  -- jump up 5 nodes
      end
    end
    local function jump_down_5_nodes()
      for _ = 1, 5 do
        api.node.navigate.sibling.next()  -- jump up 5 nodes
      end
    end

    local function my_on_attach(bufnr)
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      -- Default mappings for nvim-tree, check nvim-tree-mappings-default
      api.config.mappings.default_on_attach(bufnr)

      -- Custom mappings specific to nvim-tree buffer
      vim.keymap.set('n', 'zh', api.tree.toggle_hidden_filter, opts('Toggle Filter: Dotfiles'))
      vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
      vim.keymap.set('n', '<BS>', api.tree.change_root_to_parent, opts('Up'))
      vim.keymap.set('n', 'j',  api.node.navigate.parent_close, opts('Up'))
      vim.keymap.set('n', 'l',  api.node.open.edit, opts('Open'))
      vim.keymap.set('n', 'I', jump_up_5_nodes, opts('Jump up 5 nodes'))
      vim.keymap.set('n', 'K', jump_down_5_nodes, opts('Jump up 5 nodes'))
      -- copy absolute path
      vim.keymap.set('n', 'yp', api.fs.copy.absolute_path, opts('copy absolute path'))
      vim.keymap.set('n', 'yy', api.fs.copy.node, opts('Copy a file or folder'))
      -- other mapping like creating files etc please see the help page ...
    end

    -------------------------- Nvim-Tree Setup Start From Here ---------------------------------
    -- Setup nvim-tree with custom on_attach
    nvimtree.setup({
      view = {
        width = 38,
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



