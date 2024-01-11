local M = {}

---@param prevchars string
---@param options table
---@param buffer_lang string
---@return nil
function M.parser(prevchars, options, buffer_lang)
    --TODO: do check buffer_lang value, and check buffer lang value in if statement, add buffer_lang in config as third element in table
    --if buffer_lang == pattern[3] or pattern[3] == nil then and prevchars:endswith(pattern[1]) then do the thing
    for _, pattern in pairs(options.patterns) do
        if prevchars:endswith(pattern[1]) then
            vim.api.nvim_input("<BS><BS>")
            vim.api.nvim_input(pattern[2])
        end
    end
end

return M
