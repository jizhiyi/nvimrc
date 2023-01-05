local function bootstrap()
    local o_options = {
        -- 通用设置
        cmdheight = 1, -- 命令行高度
        showcmd = true, -- select模式下显示选中的行数
        ruler = true, -- 总是显示光标位置
        laststatus = 2, -- 总是显示状态栏
        number = true, -- 行号
        relativenumber = true, -- 相对行号
        cursorline = true, -- 高亮当前行
        ttimeoutlen = 0, -- <ESC>键响应时间
        updatetime = 300,
        timeoutlen = 500,
        virtualedit = "block,onemore", -- 允许光标出现在最后一个字符的后面
        -- 代码缩进和排版
        autoindent = true, -- 设置自动缩进
        cindent = true,
        smartindent = true,
        expandtab = true, -- 将制表符扩展为空格
        tabstop = 4, -- 设置编辑时制表符占用空格数
        shiftwidth = 4, -- 设置格式化时制表符占用空格数
        softtabstop = 4, -- 设置4个空格为制表符
        smarttab = true, -- 在行和段开始处使用制表符
        wrap = true, -- 自动折行
        sidescroll = 10,

        wildmenu = true,
        completeopt = "menuone,noselect",

        hlsearch = true, -- 高亮显示搜索结果
        incsearch = true, -- 开启实时搜索功能
        ignorecase = true, -- 搜索时大小写不敏感

        backup = false, -- 设置不备份
        writebackup = false,
        swapfile = false,

        autoread = true, -- 文件在vim之外修改过，自动重新读入
        autowrite = true, -- 设置自动保存
        confirm = true, -- 在处理未保存或只读文件的时候，弹出确认
        -- 编码
        langmenu = "zh_CN.UTF-8",
        helplang = "cn",
        termencoding = "utf-8",
        encoding = "utf8",
        fileencodings = "utf8,ucs-bom,gbk,cp936,gb2312,gb18030",

        -- 分屏出现位置下,右
        splitbelow = true,
        splitright = true,

        pumheight = 10,
        showmode = false,
        guifont = "Hack Nerd Font Mono:h14",
        mouse = "",

    }
    for name, value in pairs(o_options) do
        vim.o[name] = value
    end
end

bootstrap()
