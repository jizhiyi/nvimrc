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
}

M.regular_servers = {
    "cmake",
    "gopls",
    "pyright",
    "tsserver",
    "cssls",
}

return M
