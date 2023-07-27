local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

treesitter.setup {
    -- A list of parser names, or "all"
    ensure_installed = {
        "c",
        "cmake",
        "comment",
        "cpp",
        "css",
        "go",
        "gomod",
        "gowork",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "markdown",
        "proto",
        "python",
        "regex",
        "toml",
        "typescript",
        "vim",
        "yaml",
    },
    sync_install = false,                  -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "hack", "rnoweb" }, -- List of parsers to ignore installing
    autopairs = {
        enable = true,
    },
    highlight = {
        enable = true,    -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
        },
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
}

-- 开启 Folding 模块
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldlevel = 99

-- 其他扩展模块
-- https://hub.fastgit.xyz/nvim-treesitter/nvim-treesitter/wiki/Extra-modules-and-plugins
