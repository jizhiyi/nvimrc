local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    auto_clean = true,
    compile_on_sync = true,
    git = {
        clone_timeout = 6000,
        -- default_url_format = "https://gh.api.99988866.xyz/https://github.com/%s",
    },
    display = {
        working_sym = "ﲊ",
        error_sym = "✗ ",
        done_sym = " ",
        removed_sym = " ",
        moved_sym = "",
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
    },
})

-- Install Plugins
packer.startup(function(use)
    use("wbthomason/packer.nvim") -- Have packer manage itself

    -- 主题
    use("RRethy/nvim-base16")
    use { "catppuccin/nvim", as = "catppuccin" }

    -- 自动配对
    use("windwp/nvim-autopairs")


    use("kyazdani42/nvim-web-devicons")
    -- 文件树
    use("nvim-tree/nvim-tree.lua")

    -- 顶栏
    use("akinsho/bufferline.nvim")
    use("moll/vim-bbye")
    -- 状态栏
    use("nvim-lualine/lualine.nvim")
    -- 提示线
    use("lukas-reineke/indent-blankline.nvim")
    -- 代码高亮增强
    use("nvim-treesitter/nvim-treesitter")
    use("p00f/nvim-ts-rainbow")


    -- Lsp
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("neovim/nvim-lspconfig")

    -- 代码格式化
    use("jose-elias-alvarez/null-ls.nvim")
    -- 代码重构
    use("filipdutescu/renamer.nvim")
    -- 虚拟文本展示错误
    use({ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" })

    -- cmp plugins
    use("hrsh7th/nvim-cmp") -- The completion plugin
    use("hrsh7th/cmp-buffer") -- buffer completions
    use("hrsh7th/cmp-path") -- path completions
    use("hrsh7th/cmp-cmdline") -- cmdline completions
    use("saadparwaiz1/cmp_luasnip") -- snippet completions
    use("hrsh7th/cmp-nvim-lsp")
    -- snippets
    use("L3MON4D3/LuaSnip") --snippet engine
    use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

    -- Telescope
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-ui-select.nvim")
    use("nvim-telescope/telescope-dap.nvim")
    use("nvim-telescope/telescope-packer.nvim")
    use("nvim-telescope/telescope-project.nvim")
    use("nvim-telescope/telescope-file-browser.nvim")
    -- 欢迎界面
    use("goolord/alpha-nvim")

    -- 运行代码
    use("CRAG666/code_runner.nvim")
    -- 优化启动
    use("lewis6991/impatient.nvim")
    -- 代码注释
    use("numToStr/Comment.nvim")
    use("folke/todo-comments.nvim")
    use { "danymat/neogen", config = function()
        require("neogen").setup {}
    end }
    -- Git
    use("lewis6991/gitsigns.nvim")
    use("tpope/vim-fugitive")
    -- dap
    use("mfussenegger/nvim-dap")
    use("theHamsta/nvim-dap-virtual-text")
    use("rcarriga/nvim-dap-ui")
    use("mfussenegger/nvim-dap-python")
    use("leoluz/nvim-dap-go")
    use("jbyuki/one-small-step-for-vimkind")
    -- cmake
    use("Civitasv/cmake-tools.nvim")
    -- which-key
    use("folke/which-key.nvim")
    -- 终端
    use("akinsho/toggleterm.nvim")
    -- Hop
    use("phaazon/hop.nvim")
    -- Fold Code
    use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

    -- 竞争性编程
    use {
        "xeluxee/competitest.nvim",
        requires = "MunifTanjim/nui.nvim",
        config = function() require "competitest".setup() end
    }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        packer.sync()
    end
end)

require("plugins.config.nvim-tree")
require("plugins.config.mason")
require("lsp")
require("plugins.config.cmp")
require("plugins.config.alpha")
require("plugins.config.telescope")
require("plugins.config.bufferline")
require("plugins.config.lualine")
require("plugins.config.indent-blankline")
require("plugins.config.treesitter")
require("plugins.config.renamer")
require("plugins.config.lsp_lines")
require("plugins.config.autopairs")
require("plugins.config.code-runner")
require("plugins.config.comment")
require("plugins.config.todo-comments")
require("daps")
require("plugins.config.which-key")
require("plugins.config.toggleterm")
require("plugins.config.hop")
require("plugins.config.nvim-ufo")
require("plugins.config.gitsigns")
