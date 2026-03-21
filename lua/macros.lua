local function generate_class()
    local class_name = vim.fn.input("Class name: ")
    local text = string.format([[
public class %s
{
    public %s() {}
}
    ]], class_name, class_name)

    vim.api.nvim_put(vim.split(text, "\n"), 'l', true, true)
end

local function generate_struct()
    local struct_name = vim.fn.input("Struct name: ")
    local text = string.format([[
public struct %s
{
    public %s() {}
}
    ]], struct_name, struct_name)

    vim.api.nvim_put(vim.split(text, "\n"), 'l', true, true)
end

vim.keymap.set('n', '<leader>mc', generate_class, { noremap = true, silent = true, desc = "Insert class definition" })
vim.keymap.set('n', '<leader>ms', generate_struct, { noremap = true, silent = true, desc = "Insert struct definition" })
