local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
    debug = false,
    sources = {
        -- c/c++
        formatting.clang_format,
        -- cmake
        formatting.gersemi,
        -- go
        formatting.gofumpt, -- 格式化
        formatting.goimports_reviser, -- 自动添加,删除 import
        formatting.goimports, -- 排序 import
        -- json
        formatting.jq,
        -- lua
        formatting.stylua.with({ extra_args = { "--indent_type=Spaces" } }),
        -- js
        formatting.prettier,

        formatting.black.with({ extra_args = { "--fast" } }),
        diagnostics.flake8,

        diagnostics.jsonlint,
        code_actions.gitsigns,
        formatting.latexindent,
        diagnostics.chktex,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- vim.lsp.buf.formatting_sync()
                    vim.lsp.buf.format({ async = true, bufnr = 0 })
                end,
            })
        end
    end,
    -- on_attach = require("lsp.handlers").on_attach,
})
