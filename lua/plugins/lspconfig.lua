-- local lspconfig = vim.lsp.config()
local cmp_nvim_lsp = require("cmp_nvim_lsp")
--
local on_attach = function(client, bufnr)
    local function bufmap(mode, ihs, rhs, desc)
        vim.keymap.set(mode, ihs, rhs, { buffer = bufnr, desc = desc }) end

    bufmap("n", "<leader>ld", vim.lsp.buf.definition, "Load declaration")
    bufmap("n", "<leader>lh", vim.lsp.buf.hover, "Inspect object")
    bufmap("i", "<C-s>", vim.lsp.buf.signature_help, "Inspect signature")
    bufmap("n", "<leader>lr", vim.lsp.buf.references, "View references")
    bufmap("n", "<leader>li", vim.lsp.buf.implementation, "View implementation")
end
--
-- lspconfig.omnisharp.setup({
--     cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
--     capabilities = cmp_nvim_lsp.default_capabilities(),
--     on_attach = on_attach,
-- })
--
-- lspconfig.zls.setup({
--     on_attach = on_attach,
--     capabilities = cmp_nvim_lsp.default_capabilities()
-- })
--
-- lspconfig.clangd.setup({
--     cmd = { "clangd" },
--     filetypes = { "c", "cpp", "objc", "objcpp" },
--     root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
--     capabilities = cmp_nvim_lsp.default_capabilities(),
-- })
--
-- lspconfig.ts_ls.setup({
--     cmd = { "bunx", "typescript-language-server", "--stdio" },
--     filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
--     root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
--     on_attach = on_attach,
-- })
--
-- lspconfig.svelte.setup({
--     capabilities = cmp_nvim_lsp.default_capabilities(),
--     on_attach = on_attach,
-- })
--

local lsps = { 
    { "rust_analyzer", {
        cmd = { "rust-analyzer" },
        filetypes = { "rust" },
        capabilities = cmp_nvim_lsp.default_capabilities(),
        root_markers = { "Cargo.toml", ".git" },
        on_attach = on_attach,
    }},
    { "ts_ls", {
        cmd = { "bunx", "typescript-language-server", "--stdio" },
        filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
        root_markers = { "tsconfig.json", ".git" },
        on_attach = on_attach,
    }},
    { "svelte", {
        cmd = { "svelteserver", "--stdio" },
        filetypes = { "svelte" },
        root_markers = { "package.json", "tsconfig.json", ".git" },
        settings = {
            svelte = {
                plugin = {
                    css = { enable = true },
                    html = { enable = true },
                    typescript = { enable = true }
                }
            }
        }, 
        on_attach = on_attach,
    }},
    { "intelephense", {
        settings = {
            intelephense = {
                files = {
                    maxSize = 1000000,
                }
            }
        },
        on_attach = on_attach,
    }},
    { "cssls", {
        capabilities = cmp_nvim_lsp.default_capabilities(),
        on_attach = on_attach,
    }},
    { "tailwindcss", {
        filetypes = { "html", "svelte", "typescript", "css", "scss" },
        root_markers = { "tailwind.config.js", "package.json" },
        capabilities = cmp_nvim_lsp.default_capabilities(),
        on_attach = on_attach,
    }},
    { "fsautocomplete", {
        cmd = { "fsautocomplete", "--background-service-enabled" },
        root_markers = { "*.fsproj", "*.sln" },
        capabilities = cmp_nvim_lsp.default_capabilities(),
        on_attach = on_attach,
    }},
    { "omnisharp", {
        cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
        root_markers = { "*.csproj", "*.sln" },
        capabilities = cmp_nvim_lsp.default_capabilities(),
        on_attach = on_attach,
    }},
    { "gopls", {
        capabilities = cmp_nvim_lsp.default_capabilities(),
        on_attach = on_attach,
    }},
    { "clangd", {
        cmd = { "clangd" },
        filetypes = { "c", "cpp" },
        capabilities = cmp_nvim_lsp.default_capabilities(),
        on_attach = on_attach,
    }},
    { "serve-d", {
        cmd = { "serve-d" },
        filetypes = { "d" },
        root_markers = { "dub.json", "dub.sdl" },
        capabilities = cmp_nvim_lsp.default_capabilities(),
        on_attach = on_attach,
        settings = {
            d = {
                stdlibPath = "auto",
                enableDub = true,
            },
        },
    }}
}


for _, lsp in pairs(lsps) do 
    local name, config = lsp[1], lsp[2]
    vim.lsp.enable(name)
    if config then
        vim.lsp.config(name, config)
    end
end

