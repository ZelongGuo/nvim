-- Nvim colorschemes,which is already integrated with telescope

local Doomone = {
    ----------------- DEFAULT THEME --------------------------------------------------
    --- Change the lazy, priority as well as the config items to change current theme
    "ZelongGuo/doom-one.nvim",
    branch = "dev",
    lazy = false,                      -- disable lazy loading
    priority = 1000,                   -- high priority
    config = function()
        vim.opt.background = "light",  -- note the background also matters
        vim.cmd("colorscheme doom-one")
    end,
    ----------------------------------------------------------------------------------

    init = function()
        -- Initialize global variables for Doom-one before loading the plugin

        -- Add color to cursor
        vim.g.doom_one_cursor_coloring = false
        -- Set :terminal colors
        vim.g.doom_one_terminal_colors = true
        -- Enable italic comments
        vim.g.doom_one_italic_comments = false
        -- Enable TS support
        vim.g.doom_one_enable_treesitter = true
        -- Color whole diagnostic text or only underline
        vim.g.doom_one_diagnostics_text_color = false
        -- Enable transparent background
        vim.g.doom_one_transparent_background = false

        -- Pumblend transparency
        vim.g.doom_one_pumblend_enable = false
        vim.g.doom_one_pumblend_transparency = 20
 
        -- Plugins integration
        vim.g.doom_one_plugin_neorg = false
        vim.g.doom_one_plugin_barbar = false
        -- vim.g.doom_one_plugin_telescope = true
        vim.g.doom_one_plugin_neogit = true
        vim.g.doom_one_plugin_nvim_tree = true
        vim.g.doom_one_plugin_dashboard = true
        vim.g.doom_one_plugin_startify = true
        vim.g.doom_one_plugin_whichkey = true
        vim.g.doom_one_plugin_indent_blankline = true
        vim.g.doom_one_plugin_vim_illuminate = true
        vim.g.doom_one_plugin_lspsaga = false
    end,
}

----------------------------------------------------------------------------------------------
local Material = {
    "marko-cerovac/material.nvim",
    keys = { '<leader>fc', ':Telescope colorscheme<CR>', desc = "load Materail when open telescope colorscheme" },
    -- priority = 1000,
    -- config = function()
    --     vim.opt.background = "light",  -- note the background also matters
    --     vim.cmd("colorscheme material"),
    --     vim.g.material_style = "deep ocean"
    -- end,

    opts = {
        contrast = {
            terminal = false, -- Enable contrast for the built-in terminal
            sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
            floating_windows = false, -- Enable contrast for floating windows
            cursor_line = false, -- Enable darker background for the cursor line
            lsp_virtual_text = false, -- Enable contrasted background for lsp virtual text
            non_current_windows = false, -- Enable contrasted background for non-current windows
            filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
        },

        styles = { -- Give comments style such as bold, italic, underline etc.
            comments = { --[[ italic = true ]] },
            strings = { --[[ bold = true ]] },
            keywords = { --[[ underline = true ]] },
            functions = { --[[ bold = true, undercurl = true ]] },
            variables = {},
            operators = {},
            types = {},
        },

        plugins = { -- Uncomment the plugins that you use to highlight them
            -- Available plugins:
            -- "coc",
            -- "colorful-winsep",
            -- "dap",
            -- "dashboard",
            -- "eyeliner",
            -- "fidget",
            -- "flash",
            "gitsigns",
            -- "harpoon",
            -- "hop",
            -- "illuminate",
            -- "indent-blankline",
            -- "lspsaga",
            -- "mini",
            -- "neogit",
            -- "neotest",
            -- "neo-tree",
            -- "neorg",
            -- "noice",
            "nvim-cmp",
            -- "nvim-navic",
            "nvim-tree",
            "nvim-web-devicons",
            -- "rainbow-delimiters",
            -- "sneak",
            "telescope",
            -- "trouble",
            -- "which-key",
            -- "nvim-notify",
        },

        disable = {
            colored_cursor = false, -- Disable the colored cursor
            borders = false, -- Disable borders between vertically split windows
            background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
            term_colors = false, -- Prevent the theme from setting terminal colors
            eob_lines = false -- Hide the end-of-buffer lines
        },

        high_visibility = {
            lighter = false, -- Enable higher contrast text for lighter style
            darker = false -- Enable higher contrast text for darker style
        },

        lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

        async_loading = true, -- Load parts of the theme asynchronously for faster startup (turned on by default)

        custom_colors = nil, -- If you want to override the default colors, set this to a function

        custom_highlights = {}, -- Overwrite highlights with your own
        },
}

----------------------------------------------------------------------------------------------
return {Doomone, Material}

--2 return{
--2     { Doom, config = function()
--2         vim.opt.background = "light",
--2         vim.cmd("colorscheme doom-one")
--2     end
--2     },
--2 }

--1 -- ------------------------------------------------------------------------------------------------
--1 local M = {
--1     "ZelongGuo/doom-one.nvim",
--1      branch = "dev",
--1      lazy = false,     -- disable lazy loading
--1      priority = 1000,   -- high priority
--1 }
--1 
--1 function M.setup()
--1     -- Add color to cursor
--1     vim.g.doom_one_cursor_coloring = false
--1     -- Set :terminal colors
--1     vim.g.doom_one_terminal_colors = true
--1     -- Enable italic comments
--1     vim.g.doom_one_italic_comments = false
--1     -- Enable TS support
--1     vim.g.doom_one_enable_treesitter = true
--1     -- Color whole diagnostic text or only underline
--1     vim.g.doom_one_diagnostics_text_color = false
--1     -- Enable transparent background
--1     vim.g.doom_one_transparent_background = false
--1 
--1     -- Pumblend transparency
--1     vim.g.doom_one_pumblend_enable = false
--1     vim.g.doom_one_pumblend_transparency = 20
--1  
--1     -- Plugins integration
--1     vim.g.doom_one_plugin_neorg = false
--1     vim.g.doom_one_plugin_barbar = false
--1     vim.g.doom_one_plugin_telescope = true
--1     vim.g.doom_one_plugin_neogit = true
--1     vim.g.doom_one_plugin_nvim_tree = true
--1     vim.g.doom_one_plugin_dashboard = true
--1     vim.g.doom_one_plugin_startify = true
--1     vim.g.doom_one_plugin_whichkey = true
--1     vim.g.doom_one_plugin_indent_blankline = true
--1     vim.g.doom_one_plugin_vim_illuminate = true
--1     vim.g.doom_one_plugin_lspsaga = false
--1 end
--1 
--1 function M.config()
--1     vim.opt.background = "light",
--1     vim.cmd("colorscheme doom-one")
--1 
--1     -- Better represent the cursor color in insert mode, maybe could be added to the doom-one
--1     -- vim.cmd("highlight iCursor guifg=#ffffff guibg=#00ff00") 
--1 end
--1 
--1 return M
--1 
