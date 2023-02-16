return {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
                neededFileStatus = {
                    ["codestyle-check"] = "Any",
                },
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.stdpath("config") .. "/lua",
                },
            },
            format = {
                enable = true,
                -- Put format options here
                defaultConfig = {
                    indent_style = "space",
                    indent_size = "4",
                    quote_style = "double",
                    max_line_length = "unset"
                },
            },
            locale = "zh-cn",
        },
    },
}
