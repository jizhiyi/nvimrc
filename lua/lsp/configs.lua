local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local lsp_servers = require("utils.lsp-servers")

local on_attach = require("lsp.handlers").on_attach
local capabilities = require("lsp.handlers").capabilities

lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = require("lsp.config.lua_ls").settings,
})

lspconfig.clangd.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = {
        "clangd",
        "--limit-references=0",
        "--background-index",
    }
})

for _, server in ipairs(lsp_servers.regular_servers) do
    lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end
