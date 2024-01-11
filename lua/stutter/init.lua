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

    local stutterState = true
    vim.on_key(function(char)
        parser(char)
    end)

    print("plugin/example.lua is executed!")
end
