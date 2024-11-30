local compile = function()
    vim.cmd("write")
    local filetype = vim.bo.filetype
    if filetype == "cpp" or filetype == "c" then
        os.execute("gcc " .. vim.fn.expand("%") .. " -g -o " .. vim.fn.expand("%<"))
    end
end

-- TODO: local and remote host debug
-- TODO: lazy loading the plugins

local M = {
    "mfussenegger/nvim-dap",
    dependencies = {
        --     {
        --         "ravenxrz/DAPInstall.nvim",  -- TODO: this plugins may be not needed ... you can
        --         install the debuggers manually ...
        --         config = function()
        --             local dap_install = require("dap-install")
        --             dap_install.setup({
        --                 installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
        --             })
        --         end
        --     },
        "theHamsta/nvim-dap-virtual-text",
        {
            "rcarriga/nvim-dap-ui",
            dependencies = {
                "nvim-neotest/nvim-nio",
            },
        },
        "nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim",
    },

}

-- M.config = function()
--     local dap = require('dap')

--     -- ADAPTERS
--     dap.adapters.c = {
--         id = 'c',
--         type = 'executable',
--         command = os.getenv('HOME') .. '/.virtualenvs/tools/bin/python',
--         args = { '-m', 'debugpy.adapter' },
--     }
-- end

M.config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()
    require("nvim-dap-virtual-text").setup()

    -- dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    -- dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    -- dap.listeners.before.event_exited["dapui_config"] = dapui.close

    local m = { noremap = true }
    vim.keymap.set("n", "<leader>dw", require('dap.ui.widgets').hover, m)
    vim.keymap.set("n", "<leader>du", dapui.toggle, m)
    --- TODO: reconfigure below ...
    -- vim.keymap.set("n", "<leader>dr", function()
    --     compile()
    -- dap.continue()
    -- end, m)

    vim.keymap.set("n", "<leader>dr", dap.continue, m)

    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, m)
    vim.keymap.set("n", "<leader>ds", dap.step_over, m)
    vim.keymap.set("n", "<leader>dq", dap.terminate, m)
    vim.keymap.set("n", "<leader>di", dap.step_into, m)
    vim.keymap.set("n", "<leader>do", dap.step_out, m)

    -- vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
    -- vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
    -- vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#ffffff', bg = '#FE3C25' })

    vim.fn.sign_define('DapBreakpoint',
        { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointCondition',
        { text = 'ﳁ', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointRejected',
        { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    vim.fn.sign_define('DapLogPoint', {
        text = '',
        texthl = 'DapLogPoint',
        linehl = 'DapLogPoint',
        numhl = 'DapLogPoint'
    })
    vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })

    ----------------------------------------------------------------------------------------------------
    --- ADAPTERS
    dap.adapters.codelldb = {
        type = 'server',
        port = "${port}",
        executable = {
            -- or: vim.fn.stdpath("data") .. "/mason/bin/codelldb"
            command = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/codelldb",
            args = { "--port", "${port}" },
        }
    }

    --- CONFIGURATIONS
    dap.configurations.cpp = {
        {
            name = "Launch DAP Dafault File",
            type = "codelldb",
            request = "launch",
            program = function()
                local exe = vim.g.c_debug_program or vim.fn.expand("%:r")
                return vim.fn.getcwd() .. '/' .. exe
            end,
            -- program = function()
            --     return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            -- end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
        },
    }
    dap.configurations.c = dap.configurations.cpp

    --- TODO: Python Settings
end

return M
