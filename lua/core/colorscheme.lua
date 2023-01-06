vim.o.background = "dark"
local colorscheme = "base16-monokai"

-- base16-monokai
-- base16-pico
-- base16-windows-10
-- base16-windows-10-light
-- base16-tender



local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
    return
end
