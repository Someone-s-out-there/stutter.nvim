require("stutter.string_util")
local command = require("stutter.commands")

local M = {}

local options = {}
local prevchars = ""
local prevchars_count = 10
local stutterState = true

local function parser(char)
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

    if prevchars:endswith("kb") then
        prevchars = string.sub(prevchars, 1, -5)
    end

    parser(char)

    if string.len(prevchars) >= prevchars_count then
        prevchars = string.sub(prevchars, -10)
    end
end

function M.setup(opts)
    options = opts

    command.command_creation()

    vim.on_key(onkeycallback)
end

return M
