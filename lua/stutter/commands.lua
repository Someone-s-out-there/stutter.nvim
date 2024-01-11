local M = {}

function M.command_creation()
    vim.api.nvim_create_user_command("StutterOn", function(opts)
        print("stutter on")
    end, { nargs = 0 })

    vim.api.nvim_create_user_command("StutterOff", function(opts)
        print("stutter off")
    end, { nargs = 0 })
end

return M
