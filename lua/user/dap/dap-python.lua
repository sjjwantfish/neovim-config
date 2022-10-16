local dap = require('dap')

local function get_python_path()
    local output = io.popen("which python")
    if output ~= nil then
        local pp = output:read("*a")
        output:close()
        -- remove '\n'
        return string.sub(pp, 0, -2)
    end
    return os.getenv("HOME") .. "/miniconda3/bin/python"

end

dap.adapters.python = {
    type = "executable",
    command = get_python_path(),
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
        pythonPath = get_python_path(),
    }
}
