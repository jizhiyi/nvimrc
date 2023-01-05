local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local lsp_servers = require("utils.lsp-servers")

local on_attach = require("lsp.handlers").on_attach
local capabilities = require("lsp.handlers").capabilities

lspconfig.sumneko_lua.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = require("lsp.config.sumneko_lua").settings,
})

for _, server in ipairs(lsp_servers.regular_servers) do
    lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end
