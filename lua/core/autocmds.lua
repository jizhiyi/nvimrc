-- 自动命令，好像有版本要求
local autocmd = vim.api.nvim_create_autocmd
local api = vim.api

autocmd("FileType", {
    pattern = "qf",
    callback = function(args)
        api.nvim_buf_set_keymap(args.buf, "n", "q", "<cmd>bdelete<CR>", { noremap = true, silent = true })
    end,
})
