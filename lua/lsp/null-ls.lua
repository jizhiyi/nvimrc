local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local nvim_config_dir = vim.fn.stdpath("config")

null_ls.setup({
    debug = false,
    sources = {
        -- c/c++
        formatting.clang_format.with({ extra_args = { "-style=file:" .. nvim_config_dir .. "/.clang-format" } }),
        -- cmake
        formatting.gersemi,
        -- go
        formatting.gofumpt,           -- 格式化
        formatting.goimports_reviser, -- 自动添加,删除 import
        formatting.goimports,         -- 排序 import
        code_actions.gomodifytags,    -- 添加标签
        -- json
        formatting.jq,
        -- lua
        formatting.stylua.with({ extra_args = { "--indent_type=Spaces" } }),
        -- js
        formatting.prettier.with({ extra_args = { "--tab-width", "4" } }),

        formatting.autopep8,
        diagnostics.flake8,

        diagnostics.jsonlint,
        code_actions.gitsigns,
        formatting.latexindent,
        diagnostics.chktex,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePost", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- vim.lsp.buf.format({ bufnr = bufnr })
                    -- vim.lsp.buf.formatting_sync()
                    lsp_formatting(bufnr)
                end,
            })
        end
        -- require("lsp.handlers").on_attach(client, bufnr)
    end,
    -- on_attach = require("lsp.handlers").on_attach,
})
