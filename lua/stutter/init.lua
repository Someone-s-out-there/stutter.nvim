local commands = require("lua.stutter.commands")

local M = {}
local prevchar = nil

local function parser(char)
    if char == "#" and prevchar == "#" then
        vim.api.nvim_input("<BS><BS>test")
    end
end

function M.setup(opts)
    commands.command_creation()
    print("plugin/example.lua is executed!")
end
