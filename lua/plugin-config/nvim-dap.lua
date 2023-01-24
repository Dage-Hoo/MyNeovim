local dap, dapui = require("dap"), require("dapui")
dapui.setup({
    icons = { expanded = "", collapsed = "", current_frame = "" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    -- Use this to override mappings for specific elements
    element_mappings = {
        -- Example:
        -- stacks = {
        --   open = "<CR>",
        --   expand = "o",
        -- }
    },
    -- Expand lines larger than the window
    -- Requires >= 0.7
    expand_lines = vim.fn.has("nvim-0.7") == 1,
    -- Layouts define sections of the screen to place windows.
    -- The position can be "left", "right", "top" or "bottom".
    -- The size specifies the height/width depending on position. It can be an Int
    -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
    -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
    -- Elements are the elements shown in the layout (in order).
    -- Layouts are opened in order so that earlier layouts take priority in window sizing.
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                { id = "scopes", size = 0.25 },
                "breakpoints",
                "stacks",
                "watches",
            },
            size = 40, -- 40 columns
            position = "left",
        },
        {
            elements = {
                "repl",
                "console",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
        },
    },
    controls = {
        -- Requires Neovim nightly (or 0.8 when released)
        enabled = true,
        -- Display controls in this element
        element = "repl",
        icons = {
            pause = "",
            play = "",
            step_into = "",
            step_over = "",
            step_out = "",
            step_back = "",
            run_last = "",
            terminate = "",
        },
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil, -- Can be integer or nil.
        max_value_lines = 100, -- Can be integer or nil.
    },
})
dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        -- CHANGE THIS to your path!
        command = "/home/dage/.local/share/nvim/mason/bin/codelldb",
        args = { "--port", "${port}" },

        -- On windows you may have to uncomment this:
        -- detached = false,
    },
}
dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
dap.adapters.python = {
    type = "executable",
    command = "/home/dage/.local/share/nvim/mason/packages/debugpy/venv/bin/python",
    args = { "-m", "debugpy.adapter" },
}
dap.configurations.python = {
    {
        -- The first three options are required by nvim-dap
        type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = "launch",
        name = "Launch file",

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}", -- This configuration will launch the current file if used.
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                return cwd .. "/venv/bin/python"
            elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                return cwd .. "/.venv/bin/python"
            else
                return "/usr/bin/python"
            end
        end,
    },
}

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

vim.api.nvim_create_user_command("Dbp", dap.toggle_breakpoint, { nargs = 0 })
vim.api.nvim_create_user_command("Dbc", dap.continue, { nargs = 0 })
vim.api.nvim_create_user_command("Dbso", dap.step_over, { nargs = 0 })
vim.api.nvim_create_user_command("Dbsi", dap.step_into, { nargs = 0 })
vim.api.nvim_create_user_command("Dbe", dapui.eval, { nargs = 0 })
