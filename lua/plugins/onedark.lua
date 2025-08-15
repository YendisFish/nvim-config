require('onedark').setup{
    style = "darker",
    code_style = {
        comments = "italic",
        keywords = "italic",
    },
    highlights = {
        ["@lsp.type.property"] = { fg = "$red" },
        ["@variable.member"] = { fg = "$red" },
        ["@lsp.type.builtin"] = { fg = "$purple" }
    }
}

require('onedark').load()
