local dap = require('dap')

dap.adapters.python = {
    type = "executable",
    command = "python",
    args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
    -- launch exe
    {
        type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = "launch",
        name = "Launch file",
        program = "${file}", -- This configuration will launch the current file if used.
        args = function()
            local input = vim.fn.input("Input args: ")
            return require("user.dap.dap-util").str2argtable(input)
        end,
        pythonPath = function()
            local output = io.popen("which python")
            if output ~= nil then
                local pp = output:read("*a")
                output:close()
                return pp
            end
            return os.getenv("HOME") .. "/miniconda3/bin/python"
            -- local venv_path = os.getenv("VIRTUAL_ENV")
            -- if venv_path then
            --   return venv_path .. "/bin/python"
            -- end
            -- return "/usr/bin/python"
        end
    }
}
