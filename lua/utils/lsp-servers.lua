local M = {}

M.all_servers = {
    -- "jsonls",
    "lua_ls",
    "clangd",
    "cmake",
    "gopls",
    "pyright",
    "rust_analyzer",
    "tsserver",
    "cssls",
    "omnisharp",
    "volar",
}

M.regular_servers = {
    "cmake",
    "gopls",
    "pyright",
    "tsserver",
    "cssls",
    "omnisharp",
    "volar",
}

return M
