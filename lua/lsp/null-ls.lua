local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local async_formatting = function(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()

    vim.lsp.buf_request(
        bufnr,
        "textDocument/formatting",
        vim.lsp.util.make_formatting_params({}),
        function(err, res, ctx)
            if err then
                local err_msg = type(err) == "string" and err or err.message
                -- you can modify the log message / level (or ignore it completely)
                vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
                return
            end

            -- don't apply results if buffer is unloaded or has been modified
            if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
                return
            end

            if res then
                local client = vim.lsp.get_client_by_id(ctx.client_id)
                vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
                vim.api.nvim_buf_call(bufnr, function()
                    vim.cmd("silent noautocmd update")
                end)
            end
        end
    )
end
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
            vim.api.nvim_create_autocmd("BufWritePost", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    async_formatting(bufnr)
                end,
            })
        end
        require("lsp.handlers").on_attach(client, bufnr)
    end,
    -- on_attach = require("lsp.handlers").on_attach,
})
