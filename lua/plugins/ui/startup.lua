return {
    'goolord/alpha-nvim',

    cmd = "Alpha",
    init = function()
      if vim.fn.argc() == 0 then
        require("alpha").setup(require("alpha.themes.startify").config)
      end
    end,

    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
        local alpha = require("alpha")
        local startify = require("alpha.themes.startify")

        -- Set Header, here we use startify theme rather than dashboard to keep the contents to left
        startify.section.header.val = {
            [[*----------------*                                           ]],
            [[| Hey! Look what?|                                           ]],
            [[*----------------*                                           ]],
            [[   o                                                         ]],
            [[    o             boing         boing         boing          ]],
            [[     o  e-e           . - .         . - .         . - .      ]],
            [[       (\_/)\       '       `.   ,'       `.   ,'       .    ]],
            [[        `-'\ `--.___,         . .           . .          .   ]],
            [[           '\( ,_.-'                                      .  ]],
            [[              \\               "             "            "  ]],
            [[              ^'^                                            ]],
        }

        -- customized my own buttons
        startify.section.top_buttons.val = {
            startify.button("  e   ", "  New file", ":ene <BAR> startinsert <CR>"),
            startify.button("LDR fr", "  Recent file", ":Telescope oldfiles<CR>"),
            startify.button("LDR ff", "󰈞  Find file", ":Telescope find_files<CR>"),
            startify.button("  q   ", "󰅚  Quit NVIM", ":qa<CR>"),
        }

        -- remove part of `startify` defaults
        startify.section.bottom_buttons.val = {} -- do not need bottom buttons
        startify.section.mru.val = {}        -- disable MRU
        -- startify.section.mru_cwd.val = {}      -- disable MRU cwd

        -- Add footer showing the number of loaded plugins
        -- local loaded_count = require("lazy").stats().loaded
        local total_count = require("lazy").stats().count
        -- local startuptime = require("lazy").stats().startuptime
        startify.section.footer.val = { 
            { type = "text", val = "🚀 Lazy Message 󰒲 : total " .. total_count .. " plugins for lazy.vim ...", } 
        }

        -- apply current configurations
        alpha.setup(startify.config)
    end,
}

-- [[                 ]],
-- [[╔╗╔┌─┐┌─┐╦  ╦┬┌┬┐]],
-- [[║║║├┤ │ │╚╗╔╝││││]],
-- [[╝╚╝└─┘└─┘ ╚╝ ┴┴ ┴]],
-- [[                 ]],

-- [[                  ]],
-- [[   _   _   _   _  ]],
-- [[  / \ / \ / \ / \ ]],
-- [[ ( N | V | I | M )]],
-- [[  \_/ \_/ \_/ \_/ ]],
-- [[                  ]],
