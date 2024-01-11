require("stutter.string_util")
local commands = require("stutter.commands")

local M = {}
local options = {}
local prevchars = ""
local prevchars_count = 10
local stutterState = true
local uptodate= false

local function parser2(char)
    for _, pattern in pairs(options.patterns) do
        if prevchars:endswith(pattern[1]) then
            vim.api.nvim_input("<BS><BS>")
            vim.api.nvim_input(pattern[2])
            uptodate = true
        end
    end
end

local function onkeycallback(char)
    if not stutterState and not vim.api.nvim_get_iode().mode == "i" then
        return
    end

    prevchars = prevchars .. char

    if prevchars:endswith("kb") then
        prevchars = string.sub(prevchars, 1,-5)
    end

    parser2(char)

    if string.len(prevchars) >= prevchars_count then
        prevchars = string.sub(prevchars, -10)
    end

end

function M.setup(opts)
    options = opts
    commands.command_creation()

    vim.on_key(onkeycallback)
end

return M
