local commands = require("lua.stutter.commands")

local M = {}

function M.setup(opts)
    commands.command_creation()
    print("plugin/example.lua is executed!")
end
