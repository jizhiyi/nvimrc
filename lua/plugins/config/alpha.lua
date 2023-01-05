local ok, alpha = pcall(require, "alpha")

if not ok then
    return
end

local function button(sc, txt, keybind)
    local opts = {
        position = "center",
        text = txt,
        shortcut = sc,
        cursor = 5,
        width = 36,
        align_shortcut = "right",
        hl = "AlphaButtons",
    }

    if keybind then
        opts.keymap = { "n", sc, keybind, { noremap = true, silent = true } }
    end

    return {
        type = "button",
        val = txt,
        on_press = function()
            local key = vim.api.nvim_replace_termcodes(sc, true, false, true)
            vim.api.nvim_feedkeys(key, "normal", false)
        end,
        opts = opts,
    }
end

local options = {}

-- http://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=neovim
local ascii = {
    "                                    ██████                                    ",
    "                                ████▒▒▒▒▒▒████                                ",
    "                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                              ",
    "                            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                            ",
    "                          ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒                              ",
    "                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓                          ",
    "                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓                          ",
    "                        ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██                        ",
    "                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ",
    "                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ",
    "                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ",
    "                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ",
    "                        ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██                        ",
    "                        ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██                        ",
    "                        ██      ██      ████      ████                        ",
}

options.header = {
    type = "text",
    val = ascii,
    opts = {
        position = "center",
        hl = "AlphaHeader",
    },
}

options.buttons = {
    type = "group",
    val = {
        button("f", "  Find File  ", "<cmd>Telescope find_files<CR>"),
        button("p", "  Find Projects  ", "<cmd>Telescope project<CR>"),
        button("o", "  Recent File  ", "<cmd>Telescope oldfiles<CR>"),
        button("w", "  Find Word  ", "<cmd>Telescope live_grep<CR>"),
        button("m", "  Bookmarks  ", "<cmd>Telescope marks<CR>"),
        button("t", "  Themes  ", "<cmd>Telescope colorscheme<CR>"),
        button("s", "  Settings", "<cmd>e $MYVIMRC | :cd %:p:h <CR>"),
        button("q", "  Quit NVIM", "<cmd>qa<CR>"),
    },
    opts = {
        spacing = 1,
    },
}

-- dynamic header padding
local fn = vim.fn
local marginTopPercent = 0.3
local headerPadding = fn.max { 2, fn.floor(fn.winheight(0) * marginTopPercent) }

alpha.setup {
    layout = {
        { type = "padding", val = headerPadding },
        options.header,
        { type = "padding", val = 2 },
        options.buttons,
    },
    opts = {},
}

