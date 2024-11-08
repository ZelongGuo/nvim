-- Nvim colorschemes,which is already integrated with telescope

local Doomone = {
    ----------------- DEFAULT THEME --------------------------------------------------
    --- Change the lazy, priority as well as the config items to change current theme
    "ZelongGuo/doom-one.nvim",
    branch = "dev",
    -- lazy = false,                      -- disable lazy loading
    -- priority = 1000,                   -- high priority
    keys = { '<leader>fc', ':Telescope colorscheme<CR>', desc = "for the first time load when open telescope colorscheme" },
    config = function()
        -- vim.opt.background = "light",  -- note the background also matters
        -- vim.cmd("colorscheme doom-one")
        vim.keymap.set('n', '<leader>fc', ':Telescope colorscheme<CR>', { desc = "open telescope colorscheme for more times" })
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
        vim.g.doom_one_plugin_telescope = true
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
local Bluloco = {
    'uloco/bluloco.nvim',
    keys = { '<leader>fc', ':Telescope colorscheme<CR>', desc = "for the first time load bluloco when open telescope colorscheme" },
    lazy = false,
    priority = 1000,
    dependencies = { 'rktjmp/lush.nvim' },

    config = function()
         vim.opt.termguicolors = true
         vim.cmd('colorscheme bluloco')
         vim.keymap.set('n', '<leader>fc', ':Telescope colorscheme<CR>', { desc = "open telescope colorscheme for more times" })

    end,

    opts = {
        style = "auto", -- "auto" | "dark" | "light"
        transparent = false,
        italics = false,
        -- terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
        guicursor = true,
    }
}

----------------------------------------------------------------------------------------------
local Onenord = {
    'rmehri01/onenord.nvim',
    keys = { '<leader>fc', ':Telescope colorscheme<CR>', desc = "for the first time load onenord when open telescope colorscheme" },
    -- lazy = false,
    -- priority = 1000,
    config = function()
        -- vim.cmd("colorscheme onenord"),
        vim.keymap.set('n', '<leader>fc', ':Telescope colorscheme<CR>', { desc = "open telescope colorscheme for more times" })
    end,

    opts = {  -- Now all are default options
        theme = "dark", -- "nil", "dark" or "light". Alternatively, remove the option and set vim.o.background instead
        borders = true, -- Split window borders
        fade_nc = false, -- Fade non-current windows, making them more distinguishable
        -- Style that is applied to various groups: see `highlight-args` for options
        styles = {
            comments = "NONE",
            strings = "NONE",
            keywords = "NONE",
            functions = "NONE",
            variables = "NONE",
            diagnostics = "underline",
        },
        disable = {
            background = false, -- Disable setting the background color
            float_background = false, -- Disable setting the background color for floating windows
            cursorline = false, -- Disable the cursorline
            eob_lines = true, -- Hide the end-of-buffer lines
        },
        -- Inverse highlight for different groups
        inverse = {
            match_paren = false,
        },
        custom_highlights = {}, -- Overwrite default highlight groups
        custom_colors = {}, -- Overwrite default colors
    },

}

----------------------------------------------------------------------------------------------
local Nightfox = { 
    "EdenEast/nightfox.nvim",
    keys = { '<leader>fc', ':Telescope colorscheme<CR>', desc = "for the first time load when open telescope colorscheme" },
    -- lazy = false,
    -- priority = 1000,
    config = function()
        -- vim.opt.background = "light",  -- note the background also matters
        -- vim.cmd("colorscheme nightfox"), -- options: Nightfox, Dayfox, Dawnfox, Duskfox, Nordfox, Terafox, Carbonfox
        -- vim.g.material_style = "deep ocean"
        vim.keymap.set('n', '<leader>fc', ':Telescope colorscheme<CR>', { desc = "open telescope colorscheme for more times" })
    end,

    opts = {
        options = {
            -- Compiled file's destination location
            compile_path = vim.fn.stdpath("cache") .. "/nightfox",
            compile_file_suffix = "_compiled", -- Compiled file suffix
            transparent = false,     -- Disable setting background
            terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
            dim_inactive = false,    -- Non focused panes set to alternative background
            module_default = true,   -- Default enable value for modules
            colorblind = {
                enable = false,        -- Enable colorblind support
                simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
                severity = {
                    protan = 0,          -- Severity [0,1] for protan (red)
                    deutan = 0,          -- Severity [0,1] for deutan (green)
                    tritan = 0,          -- Severity [0,1] for tritan (blue)
                },
            },
            styles = {               -- Style to be applied to different syntax groups
                comments = "NONE",     -- Value is any valid attr-list value `:help attr-list`
                conditionals = "NONE",
                constants = "NONE",
                functions = "NONE",
                keywords = "NONE",
                numbers = "NONE",
                operators = "NONE",
                strings = "NONE",
                types = "NONE",
                variables = "NONE",
            },
            inverse = {             -- Inverse highlight for different types
                match_paren = false,
                visual = false,
                search = false,
            },
            modules = {             -- List of various plugins and additional options
            },
        },
        palettes = {},
        specs = {},
        groups = {},
    }
}

----------------------------------------------------------------------------------------------

local Everforest = {
    "neanias/everforest-nvim",
    keys = { '<leader>fc', ':Telescope colorscheme<CR>', desc = "for the first time load Materail when open telescope colorscheme" },
    version = false,
    -- lazy = false,
    -- priority = 1000,
    config = function()
        -- vim.opt.background = "light",  -- NOTE THE BACKGROUND ALSO MATTERS
        -- vim.cmd("colorscheme everforest"),
        vim.keymap.set('n', '<leader>fc', ':Telescope colorscheme<CR>', { desc = "open telescope colorscheme for more times" })
    end,

    opts = {
        background = "medium", ---Default is "medium", Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
        ---components be transparent (e.g. status line background)
        transparent_background_level = 0, -- How much of the background should be transparent. 2 will have more UI
        italics = false, --Whether italics should be used for keywords and more.
        disable_italic_comments = false, --Disable italic fonts for comments.
        ---By default, the colour of the sign column background is the same as the as normal text
        ---background, but you can use a grey background by setting this to "grey".
        sign_column_background = "none",
        ui_contrast = "low", --The contrast of line numbers, indent lines, etc. Options are "high" or "low" (default).
        ---Dim inactive windows. Only works in Neovim. Can look a bit weird with Telescope.
        ---When this option is used in conjunction with show_eob set to `false`, the
        ---end of the buffer will only be hidden inside the active window. Inside
        ---inactive windows, the end of buffer filler characters will be visible in
        ---dimmed symbols. This is due to the way Vim and Neovim handle `EndOfBuffer`.
        dim_inactive_windows = false,
        ---Some plugins support highlighting error/warning/info/hint texts, by
        ---default these texts are only underlined, but you can use this option to
        ---also highlight the background of them.
        diagnostic_text_highlight = false,
        ---Which colour the diagnostic text should be. Options are `"grey"` or `"coloured"` (default)
        diagnostic_virtual_text = "coloured",
        ---Some plugins support highlighting error/warning/info/hint lines, but this
        ---feature is disabled by default in this colour scheme.
        diagnostic_line_highlight = false,
        ---By default, this color scheme won't colour the foreground of |spell|, instead
        ---colored under curls will be used. If you also want to colour the foreground,
        ---set this option to `true`.
        spell_foreground = false,
        ---Whether to show the EndOfBuffer highlight.
        show_eob = true,
        ---Style used to make floating windows stand out from other windows. `"bright"`
        ---makes the background of these windows lighter than |hl-Normal|, whereas
        ---`"dim"` makes it darker.
        ---Floating windows include for instance diagnostic pop-ups, scrollable
        ---documentation windows from completion engines, overlay windows from
        ---
        ---installers, etc.
        ---
        ---NB: This is only significant for dark backgrounds as the light palettes
        ---have the same colour for both values in the switch.
        float_style = "bright",
        ---Inlay hints are special markers that are displayed inline with the code to
        ---provide you with additional information. You can use this option to customize
        ---the background color of inlay hints.
        ---
        ---Options are `"none"` or `"dimmed"`.
        inlay_hints_background = "none",
        ---You can override specific highlights to use other groups or a hex colour.
        ---This function will be called with the highlights and colour palette tables.
        ---@param highlight_groups Highlights
        ---@param palette Palette
        on_highlights = function(highlight_groups, palette) end,
        ---You can override colours in the palette to use different hex colours.
        ---This function will be called once the base and background colours have
        ---been mixed on the palette.
        ---@param palette Palette
        colours_override = function(palette) end,

    }

}

----------------------------------------------------------------------------------------------
local Material = {
    "marko-cerovac/material.nvim",
    keys = { '<leader>fc', ':Telescope colorscheme<CR>', desc = "for the first time load Materail when open telescope colorscheme" },
    -- lazy = false,
    -- priority = 1000,
    config = function()
        -- vim.opt.background = "light",  -- note the background also matters
        -- vim.cmd("colorscheme material"),
        -- vim.g.material_style = "deep ocean"
        vim.keymap.set('n', '<leader>fc', ':Telescope colorscheme<CR>', { desc = "open telescope colorscheme for more times" })
    end,

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
            "dashboard",
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
            "neogit",
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
return {
    Doomone,
    Material,
    Bluloco,
    Onenord,
    Nightfox,
    Everforest,
}

