print("plugin/example.lua is executed!")

vim.on_key(function(char)
    print(char)
end)

vim.api.nvim_create_user_command("Stutter-on", function (opts)
    print("stutter on")
end, {nargs = 0})

vim.api.nvim_create_user_command("Stutter-off", function (opts)
    print("stutter off")
end, {nargs = 0})
