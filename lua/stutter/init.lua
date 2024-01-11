require("stutter.string_util")
local commands = require("stutter.commands")

local M = {}
local options = {}
local prevchars = ""
local prevchars_count = 5
local stutterState = true

local function parser(char)
    if prevchars:endswith(options.patterns[1][1]) then
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
    options = opts
    commands.command_creation()

    vim.on_key(onkeycallback)
end

return M
