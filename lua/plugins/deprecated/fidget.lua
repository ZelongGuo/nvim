return {
    "j-hui/fidget.nvim",
    tag = "v1.4.5",

    opts = {},

    --2 config = function()
    --2     require("fidget").setup(
    --2         {
    --2              --1-- Options related to LSP progress subsystem
    --2              --1progress = {
    --2              --1    poll_rate = 0,                -- How and when to poll for progress messages
    --2              --1    suppress_on_insert = false,   -- Suppress new messages while in insert mode
    --2              --1    ignore_done_already = false,  -- Ignore new tasks that are already complete
    --2              --1    ignore_empty_message = false, -- Ignore new tasks that don't contain a message
    --2              --1    clear_on_detach =             -- Clear notification group when LSP server detaches
    --2              --1        function(client_id)
    --2              --1            local client = vim.lsp.get_client_by_id(client_id)
    --2              --1            return client and client.name or nil
    --2              --1        end,
    --2              --1    notification_group = -- How to get a progress message's notification group key
    --2              --1        function(msg) return msg.lsp_client.name end,
    --2              --1    ignore = {},         -- List of LSP servers to ignore

    --2              --1    -- Options related to how LSP progress messages are displayed as notifications
    --2              --1    display = {
    --2              --1        render_limit = 16, -- How many LSP messages to show at once
    --2              --1        done_ttl = 3, -- How long a message should persist after completion
    --2              --1        done_icon = "✔", -- Icon shown when all LSP progress tasks are complete
    --2              --1        done_style = "Constant", -- Highlight group for completed LSP tasks
    --2              --1        progress_ttl = math.huge, -- How long a message should persist when in progress
    --2              --1        progress_icon = -- Icon shown when LSP progress tasks are in progress
    --2              --1        { pattern = "dots", period = 1 },
    --2              --1        progress_style = -- Highlight group for in-progress LSP tasks
    --2              --1        "WarningMsg",
    --2              --1        group_style = "Title", -- Highlight group for group name (LSP server name)
    --2              --1        icon_style = "Question", -- Highlight group for group icons
    --2              --1        priority = 30, -- Ordering priority for LSP notification group
    --2              --1        skip_history = true, -- Whether progress notifications should be omitted from history
    --2              --1        format_message = -- How to format a progress message
    --2              --1            require("fidget.progress.display").default_format_message,
    --2              --1        format_annote = -- How to format a progress annotation
    --2              --1            function(msg) return msg.title end,
    --2              --1        format_group_name = -- How to format a progress notification group's name
    --2              --1            function(group) return tostring(group) end,
    --2              --1        overrides = { -- Override options from the default notification config
    --2              --1            rust_analyzer = { name = "rust-analyzer" },
    --2              --1        },
    --2              --1    },

    --2              --1    -- Options related to Neovim's built-in LSP client
    --2              --1    lsp = {
    --2              --1        progress_ringbuf_size = 0, -- Configure the nvim's LSP progress ring buffer size
    --2              --1        log_handler = false,       -- Log `$/progress` handler invocations (for debugging)
    --2              --1    },
    --2              --1},

    --2              --1-- Options related to notification subsystem
    --2              --1notification = {
    --2              --1    poll_rate = 10,               -- How frequently to update and render notifications
    --2              --1    filter = vim.log.levels.INFO, -- Minimum notifications level
    --2              --1    history_size = 128,           -- Number of removed messages to retain in history
    --2              --1    override_vim_notify = false,  -- Automatically override vim.notify() with Fidget
    --2              --1    configs =                     -- How to configure notification groups when instantiated
    --2              --1    { default = require("fidget.notification").default_config },
    --2              --1    redirect =                    -- Conditionally redirect notifications to another backend
    --2              --1        function(msg, level, opts)
    --2              --1            if opts and opts.on_open then
    --2              --1                return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
    --2              --1            end
    --2              --1        end,

    --2              --1    -- Options related to how notifications are rendered as text
    --2              --1    view = {
    --2              --1        stack_upwards = true,    -- Display notification items from bottom to top
    --2              --1        icon_separator = " ",    -- Separator between group name and icon
    --2              --1        group_separator = "---", -- Separator between notification groups
    --2              --1        group_separator_hl =     -- Highlight group used for group separator
    --2              --1        "Comment",
    --2              --1        render_message =         -- How to render notification messages
    --2              --1            function(msg, cnt)
    --2              --1                return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
    --2              --1            end,
    --2              --1    },

    --2              --1    -- Options related to the notification window and buffer
    --2              --1    window = {
    --2              --1        normal_hl = "Comment", -- Base highlight group in the notification window
    --2              --1        winblend = 100,        -- Background color opacity in the notification window
    --2              --1        border = "none",       -- Border around the notification window
    --2              --1        zindex = 45,           -- Stacking priority of the notification window
    --2              --1        max_width = 0,         -- Maximum width of the notification window
    --2              --1        max_height = 0,        -- Maximum height of the notification window
    --2              --1        x_padding = 1,         -- Padding from right edge of window boundary
    --2              --1        y_padding = 0,         -- Padding from bottom edge of window boundary
    --2              --1        align = "bottom",      -- How to align the notification window
    --2              --1        relative = "editor",   -- What the notification window position is relative to
    --2              --1    },
    --2              --1},

    --2              --1-- Options related to integrating with other plugins
    --2              --1integration = {
    --2              --1    ["nvim-tree"] = {
    --2              --1        enable = true, -- Integrate with nvim-tree/nvim-tree.lua (if installed)
    --2              --1    },
    --2              --1    ["xcodebuild-nvim"] = {
    --2              --1        enable = true, -- Integrate with wojciech-kulik/xcodebuild.nvim (if installed)
    --2              --1    },
    --2              --1},

    --2              --1-- Options related to logging
    --2              --1logger = {
    --2              --1    level = vim.log.levels.WARN, -- Minimum logging level
    --2              --1    max_size = 10000,            -- Maximum log file size, in KB
    --2              --1    float_precision = 0.01,      -- Limit the number of decimals displayed for floats
    --2              --1    path =                       -- Where Fidget writes its logs to
    --2              --1        string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
    --2              --1},
    --2         }

    --2     )
    --2 end
}
