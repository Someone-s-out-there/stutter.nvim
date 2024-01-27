local M = {}

--- parse last 10 chars
---@param prevchars string
---@param options table
---@param buffer_lang string
function M.parser(prevchars, options, buffer_lang)
    for _, pattern in pairs(options.patterns) do
        if prevchars:endswith(pattern[1]) and (buffer_lang == pattern[3] or pattern[3] == nil) then
            vim.api.nvim_input("<BS><BS>")
            vim.api.nvim_input(pattern[2])
        end
    end
end

return M
