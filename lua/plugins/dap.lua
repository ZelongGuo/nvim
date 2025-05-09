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
    ft = { "c", "cpp", "python", "sh" },
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
    -----------------------------------------------------------
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

    -----------------------------------------------------------
    --- DAP UI Setup
    local dap = require("dap")
    local dapui = require("dapui")
    dapui.setup({
        layouts = {
            -- left side
            {
                elements = {
                    { id = "scopes",      size = 0.70 },
                    { id = "breakpoints", size = 0.10 },
                    { id = "stacks",      size = 0.10 },
                    { id = "watches",     size = 0.10 }
                },
                position = "left",
                size = 40
            },

            -- bottom side
            {
                elements = {
                    { id = "repl",    size = 0.5 },
                    { id = "console", size = 0.5 }
                },
                position = "bottom",
                size = 10
            } },

        controls = {
            element = "repl",
            enabled = true,
            icons = {
                disconnect = "",
                pause = "",
                play = "",
                run_last = "",
                step_back = "",
                step_into = "",
                step_out = "",
                step_over = "",
                terminate = ""
            }
        },
    })

    -- Open and close the UI automagically
    dap.listeners.before.attach.dapui_config = function() dapui.open() end
    dap.listeners.before.launch.dapui_config = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
    dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

    -----------------------------------------------------------
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

    -----------------------------------------------------------
    local m = { noremap = true }
    vim.keymap.set("n", "<leader>dw", require('dap.ui.widgets').hover, m)
    vim.keymap.set("n", "<leader>du", dapui.toggle, m)
    -- Should start running with <leader>dr
    vim.keymap.set("n", "<leader>dr", dap.continue, m) -- "dr" in which "r" --> Run
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, m)
    vim.keymap.set("n", "<leader>ds", dap.step_over, m)
    vim.keymap.set("n", "<leader>dq", dap.terminate, m)
    vim.keymap.set("n", "<leader>di", dap.step_into, m)
    vim.keymap.set("n", "<leader>do", dap.step_out, m)
    -- vim.keymap.set('n', '<Leader>dR', dap.repl.open, m)

    -- Floating window for checking the variable
    local function inspect_variable()
        local variable_name = vim.fn.input("Variable name: ")
        if variable_name == "" then return end

        -- Check the debug session
        if not dap.session() then
            print("No active debug session")
            return
        end

        -- Oupting the variable value by REPL
        dap.repl.execute("print(format_matrix('" .. variable_name .. "'))")

        -- Opening REPL floating window
        vim.defer_fn(function()
            dapui.float_element("repl", {
                width = 80,
                height = 20,
                title = "Variable: " .. variable_name,
            })
        end, 100)
    end
    vim.keymap.set("n", "<leader>iv", inspect_variable, { noremap = true, silent = true })

    ----------------------------------------------------------------------------------------------------
    --- C, C++ Debugging
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
                -- Search .git dir as the project dir using finddir()
                local project_root = vim.fn.finddir('.git/..', '.;')
                    or vim.loop.cwd()  -- or using the current working directory
                    or vim.fn.getcwd() -- or using the current file's directory

                -- Input example: Your executable file: build/your_executable_file
                return vim.fn.input('Your executable file: ', project_root .. '/build/', 'file')
            end,

            cwd = '${workspaceFolder}',
            stopOnEntry = false,
        },
    }
    dap.configurations.c = dap.configurations.cpp

    -----------------------------------------------------------
    --- Python
    --- ADAPTERS, should get debugpy installed in current python environment firstly
    local dap = require('dap')
    dap.adapters.python = function(cb, config)
        -- get_python_path() is a function that returns the path to the python executable you want to use for debugging
        local function get_python_path()
            local conda_prefix = os.getenv('CONDA_PREFIX')
            if conda_prefix then
                local conda_python = conda_prefix .. '/bin/python'
                if vim.fn.executable(conda_python) == 1 then
                    return conda_python
                end
            end
            return '/usr/bin/python'
        end

        if config.request == 'attach' then
            ---@diagnostic disable-next-line: undefined-field
            local port = (config.connect or config).port
            ---@diagnostic disable-next-line: undefined-field
            local host = (config.connect or config).host or '127.0.0.1'
            cb({
                type = 'server',
                port = assert(port, '`connect.port` is required for a python `attach` configuration'),
                host = host,
                options = {
                    source_filetype = 'python',
                },
            })
        else -- config.request == 'launch'
            cb({
                type = 'executable',
                command = get_python_path(),
                args = { '-m', 'debugpy.adapter' },
                options = {
                    source_filetype = 'python',
                },
            })
        end
    end

    --- CONFIGURATIONS
    local dap = require('dap')
    dap.configurations.python = {
        {
            -- The first three options are required by nvim-dap
            type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
            request = 'launch',
            name = "Launch file",

            -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

            program = "${file}", -- This configuration will launch the current file if used.
            pythonPath = function()
                -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
                -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
                -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
                local conda_prefix = os.getenv('CONDA_PREFIX')
                if conda_prefix then
                    local conda_python = conda_prefix .. '/bin/python'
                    if vim.fn.executable(conda_python) == 1 then
                        return conda_python
                    end
                else
                    return '/usr/bin/python'
                end
            end,
        },

        -- if it's a remote file (like a vagrant ssh session)
        {
            type = 'python',
            request = 'attach',
            name = "Attach remote",
            connect = {
                port = 5678,
                host = '127.0.0.1',
            },
            pathMappings = {
                {
                    localRoot = "${workspaceFolder}",
                    remoteRoot = ".",
                },
            },
        },
    }
end

return M
