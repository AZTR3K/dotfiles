-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master", -- THIS IS THE MAGIC FIX!
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = {
            "c", "cpp", "python", "rust", "javascript", "typescript",
            "tsx", "go", "dart", "lua", "vim", "vimdoc", "markdown"
        },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
    },
}
