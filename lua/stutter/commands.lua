local M = { stutterstate = false }

--- create commands to turn on and off stutter mode
function M.command_creation()
    vim.api.nvim_create_user_command("StutterOn", function(opts)
        print("stutter on")
        M.stutterstate = true
    end, { nargs = 0 })

    vim.api.nvim_create_user_command("StutterOff", function(opts)
        print("stutter off")
        M.stutterstate = false
    end, { nargs = 0 })
end

return M
