require("stutter.string_util")
local command = require("stutter.commands")
local parser = require("stutter.parser")

local M = {}

local options = {}
local prevchars = ""
local prevchars_count = 10

--- on keypress callback function
---@param char number which has been pressed
local function onkeycallback(char)
    if (not command.stutterstate) or (not vim.api.nvim_get_mode().mode == "i") then
        return
    end

    prevchars = prevchars .. char

    if prevchars:endswith("kb") then
        prevchars = string.sub(prevchars, 1, -5)
    end

    local buffer_lang = vim.bo[vim.api.nvim_get_current_buf()].filetype ---@type string
    print(buffer_lang .. ":" .. prevchars .. "  ")

    parser.parser(prevchars, options, buffer_lang)

    if string.len(prevchars) >= prevchars_count then
        prevchars = string.sub(prevchars, -10) --get last 10 chars
    end
end

--- setup the plugin with parameter opts
---@param opts table
function M.setup(opts)
    options = opts

    command.command_creation()

    vim.on_key(onkeycallback)
end

return M
