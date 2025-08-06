local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local on_attach = function(client, bufnr)
    local function bufmap(mode, ihs, rhs, desc)
        vim.keymap.set(mode, ihs, rhs, { buffer = bufnr, desc = desc })
    end
end

lspconfig.omnisharp.setup({
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
    capabilities = cmp_nvim_lsp.default_capabilities(),
    on_attach = on_attach,
})
