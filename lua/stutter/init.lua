local commands = require("lua.stutter.commands")

local M = {}
local prevchar = nil

local function parser(char)
    if char == "#" and prevchar == "#" then
        vim.api.nvim_input("<BS><BS>test")
    end
end

local function parser2(char)
    for _, pattern in pairs(options.patterns) do
        if prevchars:endswith(pattern[1]) then
            vim.api.nvim_input("<BS><BS>")
            vim.api.nvim_input(pattern[2])
        end
    end
end


local function onkeycallback(char)
    if not stutterState and not vim.api.nvim_get_mode().mode == "i" then
        return
    end
    prevchars = prevchars .. char
    parser2(char)
    if string.len(prevchars) >= prevchars_count then
        prevchars = string.sub(prevchars, -5)
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
