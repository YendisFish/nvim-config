require('onedark').setup{
    style = "darker",
    code_style = {
        comments = "italic",
        keywords = "italic",
    },
    highlights = {
        ["@lsp.type.property"] = { fg = "$red" },
        ["@property"] = { fg = "$red" },
        ["@variable.member"] = { fg = "$red" },
        ["@lsp.type.builtin"] = { fg = "$purple" },
        -- ["@lsp.type.operator.cpp"] = {}
    }
}

require('onedark').load()
