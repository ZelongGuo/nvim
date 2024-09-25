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

return {
	'goolord/alpha-nvim',
	
	-- dependencies = { 'echasnovski/mini.icons' },
	dependencies = 'nvim-tree/nvim-web-devicons',

	config = function ()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set Header
		dashboard.section.header.val = {
			[[*-----------*                                                ]],
			[[| Look what?|                                                ]],
			[[*-----------*                                                ]],
			[[    o             boing         boing         boing          ]],
			[[     o  e-e           . - .         . - .         . - .      ]],
			[[       (\_/)\       '       `.   ,'       `.   ,'       .    ]],
			[[        `-'\ `--.___,         . .           . .          .   ]],
			[[           '\( ,_.-'                                      .  ]],
			[[              \\               "             "            "  ]],
			[[              ^'^                                            ]],
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
    --	dashboard.button( "LDR fr", "   Recent file", ":Telescope oldfiles<CR>"),
    	dashboard.button( "LDR fr", "  Recent file", ":Telescope oldfiles<CR>"),
    	-- dashboard.button( "f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
    	dashboard.button( "LDR ff", "󰈞  Find file", ":Telescope find_files<CR>"),
    	dashboard.button( "q", "󰅚  Quit NVIM", ":qa<CR>"),
		}

		alpha.setup(dashboard.opts)
	end,


}
