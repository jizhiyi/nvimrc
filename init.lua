require("core")
require("plugins")
require("impatient")


vim.cmd [[
    hi NonText ctermbg=none
    hi Normal guibg=NONE ctermbg=NONE
]]

vim.cmd [[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif 
]]
