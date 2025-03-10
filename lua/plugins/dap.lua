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
    ft = {"c", "cpp", "python", "sh"},
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
        "nvim-telescope/telescope-dap.nvim",
    },
}

M.config = function()
    ----------------------------------------------------------------------------------------------------
    --- nvim-dap-virtual-text
    require("nvim-dap-virtual-text").setup {
        enabled = true,
        enabled_commands = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = false,
        show_stop_reason = true,
        commented = false,
        only_first_definition = false,
        all_references = true,
        clear_on_continue = true,
        -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
        -- virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',
        virt_text_pos = 'eol',
    }

    ----------------------------------------------------------------------------------------------------
    local dap = require("dap")
    local dapui = require("dapui")
    dapui.setup()
    dap.listeners.before.attach.dapui_config = function() dapui.open() end
    dap.listeners.before.launch.dapui_config = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
    dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

    -- dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    -- dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    -- dap.listeners.before.event_exited["dapui_config"] = dapui.close

    ----------------------------------------------------------------------------------------------------
    --- Customized Background Color
    local dap_breakpoint_color = {
        light = {
            breakpoint = { ctermbg = 0, fg = '#993939', bg = '#f2d7d5', },
            logpoing = { ctermbg = 0, fg = '#31353f', bg = '#a9cce3', },
            stopped = { ctermbg = 0, fg = '#31353f', bg = '#98c379' },
        },
        dark = {
            breakpoint = { ctermbg = 0, fg = '#993939', bg = '#31353f', },
            logpoing = { ctermbg = 0, fg = '#61afef', bg = '#31353f', },
            stopped = { ctermbg = 0, fg = '#ffffff', bg = '#FE3C25' },
        }
    }
    if vim.opt.background:get() == "dark" then
        vim.api.nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.dark.breakpoint)
        vim.api.nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.dark.logpoing)
        vim.api.nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.dark.stopped)
    else
        vim.api.nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.light.breakpoint)
        vim.api.nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.light.logpoing)
        vim.api.nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.light.stopped)
    end

    --- Customized Signs
    vim.fn.sign_define('DapBreakpoint',
        { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointCondition',
        { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointRejected',
        { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    vim.fn.sign_define('DapLogPoint',
        { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })
    vim.fn.sign_define('DapStopped',
        { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })

    ----------------------------------------------------------------------------------------------------
    local m = { noremap = true }
    vim.keymap.set("n", "<leader>dw", require('dap.ui.widgets').hover, m)
    vim.keymap.set("n", "<leader>du", dapui.toggle, m)
    -- vim.keymap.set("n", "<leader>dr", function()
    --     compile()
    --     dap.continue()
    -- end, m)
    -- vim.keymap.set("n", "<leader>dr", function()
    --     local filetype = vim.bo.filetype
    --     if filetype == "c" or filetype == "cpp" then
    --         compile()
    --     end
    --     dap.continue()
    -- end, m)

    -- Should start running with <leader>dr
    vim.keymap.set("n", "<leader>dr", dap.continue, m)  -- "dr" in which "r" --> Run
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, m)
    vim.keymap.set("n", "<leader>ds", dap.step_over, m)
    vim.keymap.set("n", "<leader>dq", dap.terminate, m)
    vim.keymap.set("n", "<leader>di", dap.step_into, m)
    vim.keymap.set("n", "<leader>do", dap.step_out, m)
    -- vim.keymap.set('n', '<Leader>dR', dap.repl.open, m)

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
            -- program = function()
            --     local exe = vim.g.c_debug_program or vim.fn.expand("%:r")
            --     return vim.fn.getcwd() .. '/' .. exe
            -- end,
            program = function()
                return vim.fn.input('Your executable file: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
        },
    }
    dap.configurations.c = dap.configurations.cpp

    --- TODO: Python Settings
end

return M
