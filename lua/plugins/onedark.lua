require('onedark').setup{
    style = "darker",
    code_style = {
        comments = "italic",
        keywords = "italic",
    },
    highlights = {
        ["@lsp.type.property.cs"] = { fg = "$red" },
        ["@variable.member.c_sharp"] = { fg = "$red" }
    }
}

require('onedark').load()
