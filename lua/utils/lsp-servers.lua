local M = {}

M.all_servers = {
    -- "jsonls",
    "lua_ls",
    "clangd",
    "cmake",
    "gopls",
    "jedi_language_server",
    "rust_analyzer",
    "tsserver",
}

M.regular_servers = {
    "cmake",
    "gopls",
    "jedi_language_server",
    "tsserver",
}

return M
