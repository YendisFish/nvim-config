local oil = require("oil")

oil.setup({
    default_file_explorer = true,
    columns = {
        "icons",
    },
    view_options = {
        show_hidden = true
    },
})

vim.keymap.set("n", "<leader>;", oil.open, { desc = "Open oil" })
