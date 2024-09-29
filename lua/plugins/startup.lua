return {
  'goolord/alpha-nvim',

  dependencies = 'nvim-tree/nvim-web-devicons',
  
  config = function ()
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
    startify.section.bottom_buttons.val = {}  -- do not need bottom buttons
    startify.section.mru.val = {}             -- disable MRU
    -- startify.section.mru_cwd.val = {}      -- disable MRU cwd

    -- Add footer showing the number of loaded plugins
    local lazy = require("lazy")
    startify.section.footer.val = { { type = "text",  val =  "🚀 Lazy Message 󰒲 : " .. lazy.stats().count .. " plugins already loaded ...", } }

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


-- return {
-- 	'goolord/alpha-nvim',
-- 	
-- 	-- dependencies = { 'echasnovski/mini.icons' },
-- 	dependencies = 'nvim-tree/nvim-web-devicons',
-- 
-- 	config = function ()
-- 
-- 		local startify = require("alpha.themes.startify")
-- 		-- available: devicons, mini, default is mini
-- 		-- if provider not loaded and enabled is true, it will try to use another provider
-- 		startify.file_icons.provider = "devicons"
-- 		require("alpha").setup(startify.config)
-- 		
-- 		-- local alpha = require'alpha'
-- 		-- local dashboard = require'alpha.themes.dashboard'
-- 		-- dashboard.section.header.val = {
-- 		--     [[                               __                ]],
-- 		--     [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
-- 		--     [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
-- 		--     [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
-- 		--     [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
-- 		--     [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
-- 		-- }
-- 		
-- 		-- Change the header part
-- 		startify.section.header.val = {
-- 			[[*-----------*                                                ]],
-- 			[[| Look what?|                                                ]],
-- 			[[*-----------*                                                ]],
-- 			[[    o             boing         boing         boing          ]],
-- 			[[     o  e-e           . - .         . - .         . - .      ]],
-- 			[[       (\_/)\       '       `.   ,'       `.   ,'       .    ]],
-- 			[[        `-'\ `--.___,         . .           . .          .   ]],
-- 			[[           '\( ,_.-'                                      .  ]],
-- 			[[              \\               "             "            "  ]],
-- 			[[              ^'^                                            ]],
-- 		}
-- 
-- 		-- Using the startify setting and keep all others as defaults
--     require("alpha").setup(startify.config)
-- 
-- 
--   end,
-- }


--return {
--	'goolord/alpha-nvim',
--	
--	-- dependencies = { 'echasnovski/mini.icons' },
--	dependencies = 'nvim-tree/nvim-web-devicons',
--
--	config = function ()
--		local alpha = require("alpha")
--		local dashboard = require("alpha.themes.dashboard")
--
--		-- Set Header
--		dashboard.section.header.val = {
--			[[*-----------*                                                ]],
--			[[| Look what?|                                                ]],
--			[[*-----------*                                                ]],
--			[[    o             boing         boing         boing          ]],
--			[[     o  e-e           . - .         . - .         . - .      ]],
--			[[       (\_/)\       '       `.   ,'       `.   ,'       .    ]],
--			[[        `-'\ `--.___,         . .           . .          .   ]],
--			[[           '\( ,_.-'                                      .  ]],
--			[[              \\               "             "            "  ]],
--			[[              ^'^                                            ]],
--		}
--
--		-- Set menu
--		dashboard.section.buttons.val = {
--			dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
--    --	dashboard.button( "LDR fr", "   Recent file", ":Telescope oldfiles<CR>"),
--    	dashboard.button( "LDR fr", "  Recent file", ":Telescope oldfiles<CR>"),
--    	-- dashboard.button( "f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
--    	dashboard.button( "LDR ff", "󰈞  Find file", ":Telescope find_files<CR>"),
--    	dashboard.button( "q", "󰅚  Quit NVIM", ":qa<CR>"),
--		}
--
--		alpha.setup(dashboard.opts)
--	end,
--
--
--}



