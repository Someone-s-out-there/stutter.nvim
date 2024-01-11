require("stutter.string_util")
local command = require("stutter.commands")
local parser = require("stutter.parser")

local M = {}

local options = {}
local prevchars = ""
local prevchars_count = 10

local function onkeycallback(char)
    if (not command.stutterstate) or (not vim.api.nvim_get_mode().mode == "i") then
        return
    end

    prevchars = prevchars .. char

    if prevchars:endswith("kb") then
        prevchars = string.sub(prevchars, 1, -5)
    end

    parser.parser(prevchars, options)

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
