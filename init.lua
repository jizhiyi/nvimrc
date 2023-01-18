require("core")
require("plugins")
require("impatient")


-- vim.cmd [[
--     hi NonText ctermbg=none
--     hi Normal guibg=NONE ctermbg=NONE
-- ]]


vim.cmd [[
    "" hi Cursor guifg=green guibg=green
    "" hi Cursor2 guifg=red guibg=red
    set termguicolors
    highlight Cursor1 guifg=NONE guibg=fg
    " set guicursor=n-v-c:block-Cursor1/lCursor1,i-ci:ver25-Cursor/lCursor,
    set guicursor=a:blinkwait0-blinkon200-blinkoff200-Cursor1
]]

vim.cmd [[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif 
]]
