-- ~/.config/nvim/lua/plugins/lazydev.lua
return {
    "folke/lazydev.nvim",
    ft = "lua", -- strictly load this only when opening Lua files
    opts = {
        library = {
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
    },
}
