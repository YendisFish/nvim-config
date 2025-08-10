local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local on_attach = function(client, bufnr)
    local function bufmap(mode, ihs, rhs, desc)
        vim.keymap.set(mode, ihs, rhs, { buffer = bufnr, desc = desc })
    end

    bufmap("n", "<leader>ld", vim.lsp.buf.definition, "Load declaration")
    bufmap("n", "<leader>lh", vim.lsp.buf.hover, "Inspect object")
    bufmap("i", "<C-s>", vim.lsp.buf.signature_help, "Inspect signature")
    bufmap("n", "<leader>lr", vim.lsp.buf.references, "View references")
    bufmap("n", "<leader>li", vim.lsp.buf.implementation, "View implementation")
end

lspconfig.omnisharp.setup({
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
    capabilities = cmp_nvim_lsp.default_capabilities(),
    on_attach = on_attach,
})
