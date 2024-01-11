local M ={}

---@param prevchars string
---@param options table
---@return nil
function M.parser(prevchars,options)
    for _, pattern in pairs(options.patterns) do
        if prevchars:endswith(pattern[1]) then
            vim.api.nvim_input("<BS><BS>")
            vim.api.nvim_input(pattern[2])
        end
    end
end
return M
